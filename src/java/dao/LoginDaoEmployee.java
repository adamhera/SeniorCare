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

/*public class LoginDaoEmployee {

    /**
     * Authenticate an employee based on username, password, and role.
     *
     * @param loginBean The LoginBeanEmployee containing credentials and role.
     * @return "SUCCESS" if authentication is successful, otherwise an error message.
     * @throws SQLException If a database access error occurs.
    
    public String authenticateEmployee(LoginBeanEmployee loginBean) throws SQLException {
        String username = loginBean.getUsername();
        String password = loginBean.getPassword();
        String role = loginBean.getRole();

        String query = "SELECT Emp_Email, Emp_Password, Emp_Role FROM Employee WHERE Emp_Email = ? AND Emp_Password = ? AND Emp_Role = ?";

        try (Connection con = DBConnection.createConnection();
             PreparedStatement preparedStatement = con.prepareStatement(query)) {

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, role);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return "SUCCESS"; // Authentication successful
                } else {
                    return "Invalid credentials or role mismatch.";
                }
            }
        } catch (SQLException e) {
            System.err.println("Error during employee authentication: " + e.getMessage());
            throw e;
        }
    }
}*/



public class LoginDaoEmployee {

public String authenticateAndFetchName(LoginBeanEmployee loginBean) {
    String query = "SELECT EMP_ROLE, EMP_NAME FROM EMPLOYEE WHERE EMP_EMAIL = ? AND EMP_PASSWORD = ?";
    try (Connection con = DBConnection.createConnection();
         PreparedStatement ps = con.prepareStatement(query)) {

        ps.setString(1, loginBean.getEmail());
        ps.setString(2, loginBean.getPassword());
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next() && rs.getString("EMP_ROLE").equalsIgnoreCase(loginBean.getRole())) {
                return rs.getString("EMP_NAME"); // Return the name if role matches
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null; // Return null if authentication fails
}

}
