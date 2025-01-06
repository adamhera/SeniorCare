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
import util.DBConnection;

/*@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String patientID = request.getParameter("patientID");
        String packageID = request.getParameter("packageID");
        String bookingDate = request.getParameter("date");
        String bookingTime = request.getParameter("time");
        
        try {
            // Database connection
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");

            // Insert booking details
            String query = "INSERT INTO Booking (Patient_ID, Package_ID, Booking_Date, Booking_Time) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, patientID);
            stmt.setString(2, packageID);
            stmt.setString(3, bookingDate);
            stmt.setString(4, bookingTime);
            
            int rows = stmt.executeUpdate();
            stmt.close();
            conn.close();
            
            if (rows > 0) {
                response.sendRedirect("patientDashboard.jsp?status=success");
            } else {
                response.sendRedirect("booking.jsp?status=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("booking.jsp?status=error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}*/

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int packageID = Integer.parseInt(request.getParameter("packageID"));
        int patientID = (int) request.getSession().getAttribute("patientID");

        try (Connection conn = DBConnection.createConnection()) {
            String query = "INSERT INTO Booking (Patient_ID, Package_ID, Booking_Date, Booking_Time, Status) " +
                           "VALUES (?, ?, CURRENT_DATE, CURRENT_TIME, 'Pending')";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, patientID);
            stmt.setInt(2, packageID);
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

        request.getRequestDispatcher("patientDashboard.jsp").forward(request, response);
    }
}

