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
import bean.LoginBeanEmployee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DBConnection;

public class LoginDaoEmployee {
    
    //Guna
    public String authenticateAndFetchName(LoginBeanEmployee loginBean) {
        String query = "SELECT EMP_ID, EMP_ROLE, EMP_NAME, STATUS FROM EMPLOYEE WHERE EMP_EMAIL = ? AND EMP_PASSWORD = ?";
        
        try (Connection con = DBConnection.createConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, loginBean.getEmail());
            ps.setString(2, loginBean.getPassword());
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String status = rs.getString("STATUS");
                    // Check if the status is 'Rejected'
                    if ("Rejected".equalsIgnoreCase(status)) {
                        return "REJECTED";  // Return a special value if the status is rejected
                    }

                    // If status is 'Pending', allow login but notify the user
                    if ("Pending".equalsIgnoreCase(status)) {
                        return "PENDING";  // Return a special value for pending status
                    }

                    // Check if the role matches
                    if (rs.getString("EMP_ROLE").equalsIgnoreCase(loginBean.getRole())) {
                        loginBean.setEmployeeId(rs.getInt("EMP_ID"));
                        return rs.getString("EMP_NAME");  // Return the employee name if role matches
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if authentication fails
    }
    
   
}
