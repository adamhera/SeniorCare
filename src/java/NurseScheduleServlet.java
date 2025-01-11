/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author adamh
 */
import com.seniorcare.model.Booking;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DBConnection;

@WebServlet("/NurseScheduleServlet")
public class NurseScheduleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer nurseId = (Integer) session.getAttribute("employeeId"); // Get nurse ID from session

        if (nurseId == null) {
            // If nurse is not logged in, redirect to login page
            response.sendRedirect("employeeLogin.jsp");
            return;
        }

        List<Booking> acceptedBookings = new ArrayList<>();
        String query = "SELECT b.BOOKING_ID, p.PATIENT_FNAME, p.PATIENT_LNAME, pk.PACKAGE_NAME, " +
                       "b.BOOKING_DATE, b.BOOKING_TIME " +
                       "FROM BOOKING b " +
                       "JOIN PATIENT p ON b.PATIENT_ID = p.PATIENT_ID " +
                       "JOIN PACKAGE pk ON b.PACKAGE_ID = pk.PACKAGE_ID " +
                       "JOIN NURSEBOOKING nb ON b.BOOKING_ID = nb.BOOKING_ID " +
                       "WHERE nb.NURSE_ID = ? AND b.STATUS = 'Accept'";

        try (Connection con = DBConnection.createConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, nurseId); // Bind nurse ID to query
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("BOOKING_ID"));
                booking.setPatientName(rs.getString("PATIENT_FNAME") + " " + rs.getString("PATIENT_LNAME"));
                booking.setPackageName(rs.getString("PACKAGE_NAME"));
                booking.setBookingDate(rs.getDate("BOOKING_DATE"));
                booking.setBookingTime(rs.getTime("BOOKING_TIME"));
                acceptedBookings.add(booking);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("acceptedBookings", acceptedBookings);
        request.getRequestDispatcher("nurseDashboard.jsp").forward(request, response);
    }
}

