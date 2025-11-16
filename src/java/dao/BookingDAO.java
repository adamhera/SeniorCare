/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author adamh
 */

import com.seniorcare.model.Booking;
import util.DBConnection;
import java.sql.Connection;
//import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BookingDAO {
    
    /*guna
    public boolean createBooking(int patientID, int packageID, String bookingDate, String bookingTime) {
        try (Connection conn = DBConnection.createConnection()) {
            String query = "INSERT INTO Booking (Patient_ID, Package_ID, Booking_Date, Booking_Time, Status) " +
                           "VALUES (?, ?, ?, ?, 'Pending')";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, patientID);
                stmt.setInt(2, packageID);
                stmt.setString(3, bookingDate);
                stmt.setString(4, bookingTime);

                int rowsInserted = stmt.executeUpdate();
                return rowsInserted > 0;  // Return true if the booking was inserted successfully
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // Return false if there's an exception
        }
    }*/

 // Create a new booking

public boolean createBooking(int patientID, int packageID, String bookingDate, String bookingTime) {
    try (Connection conn = DBConnection.createConnection()) {
        // Debugging: print the bookingDate received
        System.out.println("Booking Date received: " + bookingDate);

        // Format the booking date to Oracle's standard format (YYYY-MM-DD)
        String formattedBookingDate = bookingDate; // The bookingDate should be in YYYY-MM-DD format
        
        // Ensure bookingTime is in HH:mm:ss format (add seconds if missing)
        if (bookingTime != null && bookingTime.length() == 5) {
            bookingTime = bookingTime + ":00"; // Add ":00" for seconds if missing
        }

        // Combine bookingDate and bookingTime into a single timestamp string
        String bookingDateTime = formattedBookingDate + " " + bookingTime;

        // Debugging: print out the formatted date and time
        System.out.println("Formatted Booking Date: " + formattedBookingDate);
        System.out.println("Formatted Booking Time: " + bookingTime);
        System.out.println("Combined Booking DateTime: " + bookingDateTime);

        // Prepare the SQL query to insert the booking
        String query = "INSERT INTO Booking (BOOKING_ID, Patient_ID, Package_ID, Booking_Date, Booking_Time, Status) " +
                       "VALUES (booking_id_seq.NEXTVAL, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI:SS'), 'Pending')";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            // Set the values in the PreparedStatement
            stmt.setInt(1, patientID);  // Patient ID
            stmt.setInt(2, packageID);  // Package ID
            stmt.setString(3, formattedBookingDate);  // Booking Date (formatted as YYYY-MM-DD)
            stmt.setString(4, bookingDateTime);  // Combined Booking DateTime

            // Execute the query
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;  // Return true if booking is successful
        }
    } catch (SQLException e) {
        e.printStackTrace();
        return false;  // Return false if an exception occurs
    }
}





        /*guna
        public boolean updateBooking(int bookingID, String bookingDate, String bookingTime, int packageID) {
        try (Connection conn = DBConnection.createConnection()) {
            String query = "UPDATE Booking SET Booking_Date = ?, Booking_Time = ?, Package_ID = ? " +
                           "WHERE Booking_ID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, bookingDate);
                stmt.setString(2, bookingTime);
                stmt.setInt(3, packageID);
                stmt.setInt(4, bookingID);

                int rowsUpdated = stmt.executeUpdate();
                return rowsUpdated > 0;  // Return true if the booking was updated successfully
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // Return false if there's an exception
        }
    }*/

public boolean updateBooking(int bookingID, String bookingDate, String bookingTime, int packageID) {
    try (Connection conn = DBConnection.createConnection()) {
        // Format the booking date and time as needed (ensure time format is HH:mm:ss)
        if (bookingTime != null && bookingTime.length() == 5) {
            bookingTime = bookingTime + ":00"; // Add ":00" if time format is HH:mm
        }
        String bookingDateTime = bookingDate + " " + bookingTime;

        // Prepare the SQL query
        String query = "UPDATE Booking SET Booking_Date = TO_DATE(?, 'YYYY-MM-DD'), " +
                       "Booking_Time = TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI:SS'), Package_ID = ? " +
                       "WHERE Booking_ID = ?";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            // Set parameters
            stmt.setString(1, bookingDate);  // Booking Date
            stmt.setString(2, bookingDateTime);  // Booking Date and Time
            stmt.setInt(3, packageID);  // Package ID
            stmt.setInt(4, bookingID);  // Booking ID

            // Execute the update
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;  // Return true if the booking was updated successfully
        }
    } catch (SQLException e) {
        e.printStackTrace();
        return false;  // Return false if there's an exception
    }
}

        
        //guna
        public boolean updateBookingStatus(int bookingId, String status, int empId) {
        String query = "UPDATE Booking SET Status = ?, emp_id = ? WHERE Booking_ID = ?";
        try (Connection conn = DBConnection.createConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, status);
            ps.setInt(2, empId);  // Set the nurse's emp_id in the booking
            ps.setInt(3, bookingId);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Return true if the update was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    //guna
    public List<Booking> getPendingBookingsByPackage(String packageName) {
    List<Booking> bookings = new ArrayList<>();
    String query = "SELECT b.Booking_ID, p.Patient_FName || ' ' || p.Patient_LName AS PatientName, " +
                   "pk.Package_Name, b.Booking_Date, b.Booking_Time " +
                   "FROM Booking b " +
                   "JOIN Patient p ON b.Patient_ID = p.Patient_ID " +
                   "JOIN Package pk ON b.Package_ID = pk.Package_ID " +
                   "WHERE b.Status = 'Pending' AND pk.Package_Name = ?";

    try (Connection conn = DBConnection.createConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {
        stmt.setString(1, packageName);  // Use the packageName to filter the bookings
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Booking booking = new Booking();
            booking.setBookingId(rs.getInt("Booking_ID"));
            booking.setPatientName(rs.getString("PatientName"));
            booking.setPackageName(rs.getString("Package_Name"));
            booking.setBookingDate(rs.getDate("Booking_Date"));
            booking.setBookingTime(rs.getTime("Booking_Time"));
            bookings.add(booking);
        }
    } catch (SQLException e) {
        e.printStackTrace();  
    }
    return bookings;
    }
    
    //guna
    public boolean deleteBooking(int bookingID) {
    String query = "DELETE FROM Booking WHERE Booking_ID = ?";
    try (Connection conn = DBConnection.createConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {
        stmt.setInt(1, bookingID);
        int rowsDeleted = stmt.executeUpdate();
        return rowsDeleted > 0;  // Return true if deletion is successful
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;  
}

}

