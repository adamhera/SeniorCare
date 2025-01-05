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

import bean.RegisterBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import bean.RegisterBeanEmployee;

public class RegisterDaoEmployee {
   public String registerUser(RegisterBeanEmployee registerBeanEmployee) {
       String name = registerBeanEmployee.getName();
       String email = registerBeanEmployee.getEmail();
       String role = registerBeanEmployee.getRole();
       String status = registerBeanEmployee.getStatus();
       String gender = registerBeanEmployee.getGender();
       String password = registerBeanEmployee.getPassword();

       String jdbcURL = "jdbc:derby://localhost:1527/SeniorCareDB";
       String dbUser = "app";
       String dbPassword = "app";

       String sql = "INSERT INTO EMPLOYEE (EMP_NAME, EMP_EMAIL, EMP_ROLE, STATUS, EMP_GENDER, EMP_PASSWORD) VALUES (?, ?, ?, ?, ?, ?)";
       try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

           preparedStatement.setString(1, name);
           preparedStatement.setString(2, email);
           preparedStatement.setString(3, role);
           preparedStatement.setString(4, status);
           preparedStatement.setString(5, gender);
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
