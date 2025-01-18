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
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

   // guna
    public boolean updateAdminCertification(int empID, String adminCertification) {
        String query = "UPDATE Admin SET admin_certification = ? WHERE emp_id = ?";

        try (Connection conn = DBConnection.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, adminCertification);
            stmt.setInt(2, empID);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Return true if update was successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // guna
    public boolean updateAdminPassword(int empID, String newPassword) {
        String query = "UPDATE Employee SET emp_password = ? WHERE emp_id = ?";

        try (Connection conn = DBConnection.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, newPassword);
            stmt.setInt(2, empID);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
     
    ///guna
     public String getAdminCertification(int empID) {
        String query = "SELECT admin_certification FROM Admin WHERE emp_id = ?";
        try (Connection conn = DBConnection.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, empID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getString("admin_certification");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if no certification is found
    }
}
