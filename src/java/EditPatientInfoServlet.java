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
        request.getRequestDispatcher("editPatientInfo.jsp").forward(request, response);
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

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        try (Connection conn = DBConnection.createConnection()) {
            String query = "UPDATE Patient SET Patient_Name = ?, Patient_Email = ?, Patient_Password = ?, Patient_Address = ? WHERE Patient_ID = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, address);
            stmt.setInt(5, patientID);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                session.setAttribute("patientName", name);
                session.setAttribute("patientEmail", email);
                session.setAttribute("patientAddress", address);

                request.setAttribute("successMessage", "Information updated successfully.");
            } else {
                request.setAttribute("errorMessage", "Failed to update information. Please try again.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        }

        request.getRequestDispatcher("editPatientInfo.jsp").forward(request, response);
    }
}

