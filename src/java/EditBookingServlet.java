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
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditBookingServlet")
public class EditBookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookingID = Integer.parseInt(request.getParameter("bookingID"));
        
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
            String query = "SELECT B.Booking_ID, B.Booking_Date, B.Booking_Time, P.Package_Name " +
                       "FROM Booking B INNER JOIN Package P ON B.Package_ID = P.Package_ID " +
                       "WHERE B.Booking_ID = ?";

            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, bookingID);
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("bookingID", rs.getInt("Booking_ID"));
                request.setAttribute("bookingDate", rs.getDate("Booking_Date"));
                request.setAttribute("bookingTime", rs.getTime("Booking_Time"));
                
                request.setAttribute("packageName", rs.getString("Package_Name"));
            }
            
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unable to fetch booking details.");
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("editBooking.jsp");
        dispatcher.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int bookingID = Integer.parseInt(request.getParameter("bookingID"));
    String bookingDate = request.getParameter("bookingDate");
    String bookingTime = request.getParameter("bookingTime");
    String packageName = request.getParameter("packageName");

    int packageID = 0; // Map package name to ID
    switch (packageName) {
        case "Basic Package":
            packageID = 1;
            break;
        case "Package A":
            packageID = 2;
            break;
        case "Package B":
            packageID = 3;
            break;
        case "Package C":
            packageID = 4;
            break;
    }

    try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
        String query = "UPDATE Booking SET Booking_Date = ?, Booking_Time = ?, Package_ID = ? " +
                       "WHERE Booking_ID = ?";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, bookingDate);
        stmt.setString(2, bookingTime);
        stmt.setInt(3, packageID);
        stmt.setInt(4, bookingID);

        int rowsUpdated = stmt.executeUpdate();
        if (rowsUpdated > 0) {
            request.setAttribute("successMessage", "Booking updated successfully.");
        } else {
            request.setAttribute("errorMessage", "Failed to update booking.");
        }

        stmt.close();
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "An error occurred while updating booking.");
    }

    RequestDispatcher dispatcher = request.getRequestDispatcher("patientDasboard.jsp");
    dispatcher.forward(request, response);
}

}
