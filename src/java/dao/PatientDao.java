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
import util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PatientDAO {
    
    //guna
    public boolean updatePatientInfo(int patientID, String firstName, String lastName, String email, String password, String address) {
        String query;
        if (password != null && !password.trim().isEmpty()) {
            query = "UPDATE Patient SET patient_fname = ?, patient_lname = ?, patient_email = ?, patient_password = ?, patient_address = ? WHERE patient_id = ?";
        } else {
            query = "UPDATE Patient SET patient_fname = ?, patient_lname = ?, patient_email = ?, patient_address = ? WHERE patient_id = ?";
        }

        try (Connection conn = DBConnection.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            if (password != null && !password.trim().isEmpty()) {
                stmt.setString(4, password);
                stmt.setString(5, address);
                stmt.setInt(6, patientID);
            } else {
                stmt.setString(4, address);
                stmt.setInt(5, patientID);
            }

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;  // Return true if the update was successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // Return false if there's an exception
        }
    }
}