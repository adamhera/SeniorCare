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

public class AdminDAO {

    // Method to update admin profile
    public boolean updateAdminProfile(String username, String password) {
        String query = "UPDATE Admin SET username = ?, password = ? WHERE username = ?";  // Assuming admin is identified by username

        try (Connection conn = DBConnection.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, username); // Assuming you want to update the profile of the currently logged-in admin

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;  // Return true if update was successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // Return false in case of any exception
        }
    }
}