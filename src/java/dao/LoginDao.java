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

    public String getPatientFirstName(int patientID) {
        String firstName = null;

        try (Connection conn = DBConnection.createConnection()) {
            String query = "SELECT Patient_FName FROM Patient WHERE Patient_ID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, patientID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                firstName = rs.getString("Patient_FName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return firstName;
    }

    public String getPatientLastName(int patientID) {
        String lastName = null;

        try (Connection conn = DBConnection.createConnection()) {
            String query = "SELECT Patient_LName FROM Patient WHERE Patient_ID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, patientID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                lastName = rs.getString("Patient_LName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lastName;
    }

    public String getPatientEmail(int patientID) {
        String email = null;

        try (Connection conn = DBConnection.createConnection()) {
            String query = "SELECT Patient_Email FROM Patient WHERE Patient_ID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, patientID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                email = rs.getString("Patient_Email");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return email;
    }

    public String getPatientAddress(int patientID) {
        String address = null;

        try (Connection conn = DBConnection.createConnection()) {
            String query = "SELECT Patient_Address FROM Patient WHERE Patient_ID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, patientID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                address = rs.getString("Patient_Address");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return address;
    }

}
