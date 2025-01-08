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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBConnection;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int packageID = Integer.parseInt(request.getParameter("packageID"));
        int patientID = (int) request.getSession().getAttribute("patientID");
        String bookingDate = request.getParameter("bookingDate");
        String bookingTime = request.getParameter("bookingTime");

        try (Connection conn = DBConnection.createConnection()) {
            String query = "INSERT INTO Booking (Patient_ID, Package_ID, Booking_Date, Booking_Time, Status) " +
                           "VALUES (?, ?, ?, ?, 'Pending')";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, patientID);
            stmt.setInt(2, packageID);
            stmt.setString(3, bookingDate);
            stmt.setString(4, bookingTime);
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                request.setAttribute("message", "Booking successful!");
            } else {
                request.setAttribute("message", "Failed to book the package.");
            }
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred: " + e.getMessage());
        }

        request.getRequestDispatcher("patientDasboard.jsp").forward(request, response);
    }
}
