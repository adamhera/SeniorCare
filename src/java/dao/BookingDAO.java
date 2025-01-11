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
        
        public boolean updateBookingStatus(int bookingId, String status) {
        String query = "UPDATE BOOKING SET STATUS = ? WHERE BOOKING_ID = ?";
        try (Connection conn = DBConnection.createConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, status);
            ps.setInt(2, bookingId);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Return true if the update was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean approveBooking(int bookingId) {
        String query = "UPDATE BOOKING SET STATUS = 'Approved' WHERE BOOKING_ID = ?";
        try (Connection conn = DBConnection.createConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, bookingId);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
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
}

