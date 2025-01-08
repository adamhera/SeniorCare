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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookingID = Integer.parseInt(request.getParameter("bookingID"));
        
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
            String query = "DELETE FROM Booking WHERE Booking_ID = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, bookingID);
            
            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                request.setAttribute("successMessage", "Booking canceled successfully.");
            } else {
                request.setAttribute("errorMessage", "Failed to cancel booking.");
            }
            
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while canceling booking.");
        }
        
        response.sendRedirect("patientDasboard.jsp");
    }
}
