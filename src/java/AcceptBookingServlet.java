/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author adamh
 */
@WebServlet(urlPatterns = {"/AcceptBookingServlet"})
public class AcceptBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the booking ID from the request
        int bookingID = Integer.parseInt(request.getParameter("bookingID"));
         Integer nurseEmpId = (Integer) request.getSession().getAttribute("emp_id");
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // Database connection
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");

            // Update the booking status to "Accepted"
            String updateQuery = "UPDATE Booking SET Status = 'Accepted', emp_id = ? WHERE Booking_ID = ?";
            stmt = conn.prepareStatement(updateQuery);
            stmt.setInt(1, nurseEmpId); // set the nurse ID
            stmt.setInt(2, bookingID); // set the booking ID

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Successfully updated the booking status
                response.sendRedirect("adminDashboard.jsp");
            } else {
                // Booking not found or update failed
                request.setAttribute("errorMessage", "Error updating booking status.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            // Log the error
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating booking status: " + e.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}