/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author adamh

import com.seniorcare.model.Patient;
import util.DBConnection;
import java.sql.*;

public class PatientDao {

    public static Patient getPatientByEmail(String email) {
        Patient patient = null;
        String query = "SELECT patient_fname, patient_lname, patient_phone, patient_email, patient_address FROM Patient WHERE patient_email = ?";

        try (Connection con = DBConnection.createConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                patient = new Patient();
                patient.setFirstName(rs.getString("patient_fname"));
                patient.setLastName(rs.getString("patient_lname"));
                patient.setPhone(rs.getString("patient_phone"));
                patient.setEmail(rs.getString("patient_email"));
                patient.setAddress(rs.getString("patient_address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return patient;
    }
}
*/