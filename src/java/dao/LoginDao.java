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


import bean.LoginBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DBConnection;

public class LoginDao {
    public int authenticatePatient(LoginBean loginBean) {
        int patientID = -1;

        try (Connection conn = DBConnection.createConnection()) {
            String query = "SELECT Patient_ID FROM Patient WHERE Patient_Email = ? AND Patient_Password = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, loginBean.getEmail());
            ps.setString(2, loginBean.getPassword());

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                patientID = rs.getInt("Patient_ID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return patientID; // Returns -1 if authentication fails
    }

    public String getPatientName(int patientID) {
        String patientName = null;

        try (Connection conn = DBConnection.createConnection()) {
            String query = "SELECT Patient_FName FROM Patient WHERE Patient_ID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, patientID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                patientName = rs.getString("Patient_FName");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return patientName;
    }
}
