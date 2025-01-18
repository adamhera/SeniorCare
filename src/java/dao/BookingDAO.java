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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    
    //guna
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
    }
        
        //guna
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

   /*     
   public boolean approveBooking(int bookingId, int nurseId) {
    Connection conn = null;
    PreparedStatement stmt = null;
    boolean isApproved = false;

    try {
        // Establish database connection
        conn = DBConnection.createConnection();
        
        // Start a transaction (so that both operations are done atomically)
        conn.setAutoCommit(false);

        // 1. Update booking status to "Approved"
        String updateBookingStatusQuery = "UPDATE Booking SET Status = 'Approved' WHERE Booking_ID = ?";
        stmt = conn.prepareStatement(updateBookingStatusQuery);
        stmt.setInt(1, bookingId);
        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated > 0) {
            // 2. Assign booking to the nurse
            String assignNurseQuery = "INSERT INTO nurseBooking (nurse_id, booking_id) VALUES (?, ?)";
            stmt = conn.prepareStatement(assignNurseQuery);
            stmt.setInt(1, nurseId);
            stmt.setInt(2, bookingId);
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                // Commit the transaction if both operations succeed
                conn.commit();
                isApproved = true;
            } else {
                // Rollback if the nurse assignment fails
                conn.rollback();
            }
        } else {
            // Rollback if the booking status update fails
            conn.rollback();
        }

    } catch (SQLException e) {
        e.printStackTrace();
        try {
            if (conn != null) {
                conn.rollback(); // Rollback the transaction in case of error
            }
        } catch (SQLException se) {
            se.printStackTrace();
        }
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

        return isApproved;
    }

    
    public boolean assignBookingToNurse(int nurseId, int bookingId) {
        String query = "INSERT INTO nurseBooking (nurse_id, booking_id) VALUES (?, ?)";
        try (Connection conn = DBConnection.createConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, nurseId);
            ps.setInt(2, bookingId);

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;  // Return true if the insertion was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Booking> getPendingBookings() {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT b.Booking_ID, p.Patient_FName || ' ' || p.Patient_LName AS PatientName, " +
                       "pk.Package_Name, b.Booking_Date, b.Booking_Time " +
                       "FROM Booking b " +
                       "JOIN Patient p ON b.Patient_ID = p.Patient_ID " +
                       "JOIN Package pk ON b.Package_ID = pk.Package_ID " +
                       "WHERE b.Status = 'Pending'";

        try (Connection conn = DBConnection.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

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
            e.printStackTrace();  // Log error
        }
        return bookings;
    }
*/
    
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
        e.printStackTrace();  // Log error
    }
    return bookings;
    }
    
    /*
    public String getBookingStatus(int bookingId) {
    String status = null;
    String query = "SELECT Status FROM BOOKING WHERE Booking_ID = ?";
    try (Connection conn = DBConnection.createConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setInt(1, bookingId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            status = rs.getString("Status");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return status;
    }

    
    public boolean deleteBooking(int bookingId) {
    String query = "DELETE FROM BOOKING WHERE Booking_ID = ?";
    try (Connection conn = DBConnection.createConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setInt(1, bookingId);
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
    }
    */
}

