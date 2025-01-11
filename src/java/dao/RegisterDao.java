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

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import bean.RegisterBean;

public class RegisterDao {
    public String registerUser(RegisterBean registerBean) {
        String fname = registerBean.getFname();
        String lname = registerBean.getLname();
        String phone = registerBean.getPhone();
        String address = registerBean.getAddress();
        String email = registerBean.getEmail();
        String password = registerBean.getPassword();
        
        
        String jdbcURL = "jdbc:derby://localhost:1527/SeniorCareDB";
        String dbUser = "app";
        String dbPassword = "app";

    
        String sql = "INSERT INTO PATIENT (PATIENT_FNAME, PATIENT_LNAME, PATIENT_PHONE, PATIENT_ADDRESS, PATIENT_EMAIL, PATIENT_PASSWORD) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

            preparedStatement.setString(1, fname);
            preparedStatement.setString(2, lname);
            preparedStatement.setString(3, phone);
            preparedStatement.setString(4, address);
            preparedStatement.setString(5, email);
            preparedStatement.setString(6, password);

            int result = preparedStatement.executeUpdate();
            if (result > 0) {
                return "success";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "error";
    }
}
