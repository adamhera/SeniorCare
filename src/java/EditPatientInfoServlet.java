/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author adamh
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DBConnection;

@WebServlet("/EditPatientInfoServlet")
public class EditPatientInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("editPatientinfo.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer patientID = (Integer) session.getAttribute("patientID");

        if (patientID == null) {
            response.sendRedirect("patientLogin.jsp");
            return;
        }

        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        // Validate input
        if (firstName == null || firstName.trim().isEmpty() ||
            lastName == null || lastName.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            address == null || address.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields except password are required.");
            request.getRequestDispatcher("editPatientinfo.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnection.createConnection()) {
            // Build SQL query
            String query;
            if (password != null && !password.trim().isEmpty()) {
                query = "UPDATE Patient SET patient_fname = ?, patient_lname = ?, patient_email = ?, patient_password = ?, patient_address = ? WHERE patient_id = ?";
            } else {
                query = "UPDATE Patient SET patient_fname = ?, patient_lname = ?, patient_email = ?, patient_address = ? WHERE patient_id = ?";
            }

            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, firstName);
                stmt.setString(2, lastName);
                stmt.setString(3, email);
                if (password != null && !password.trim().isEmpty()) {
                    stmt.setString(4, password);
                    stmt.setString(5, address);
                    stmt.setInt(6, patientID);
                } else {
                    stmt.setString(4, address);
                    stmt.setInt(5, patientID);
                }

                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    session.setAttribute("patientFirstName", firstName);
                    session.setAttribute("patientLastName", lastName);
                    session.setAttribute("patientEmail", email);
                    session.setAttribute("patientAddress", address);

                    request.setAttribute("successMessage", "Information updated successfully.");
                   // Redirect to the page with the success message and the 'Back to Dashboard' button
                    request.getRequestDispatcher("editPatientinfo.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Failed to update information. Please try again.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        }

        request.getRequestDispatcher("editPatientinfo.jsp").forward(request, response);
    }
}
