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

    public String authenticateUser(LoginBean loginBean) {

        String email = loginBean.getEmail();
        String password = loginBean.getPassword();

        String query = "SELECT Patient_Email, Patient_Password FROM Patient WHERE Patient_Email = ? AND Patient_Password = ?";
        try (Connection con = DBConnection.createConnection();
             PreparedStatement preparedStatement = con.prepareStatement(query)) {

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return "SUCCESS";
                } else {
                    return "Invalid email or password.";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error: " + e.getMessage();
        }
    }
}
