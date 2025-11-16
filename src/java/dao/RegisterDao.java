/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author adamh


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
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import bean.RegisterBean;

public class RegisterDao {
    
    // Oracle database connection details
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE"; // Replace with your Oracle DB details
    private static final String DB_USER = "SeniorCare"; // Replace with your Oracle schema username
    private static final String DB_PASSWORD = "system"; // Replace with your Oracle schema password

    // Method to register a new patient
    public String registerUser(RegisterBean registerBean) {
    String fname = registerBean.getFname();
    String lname = registerBean.getLname();
    String phone = registerBean.getPhone();
    String address = registerBean.getAddress();
    String email = registerBean.getEmail();
    String password = registerBean.getPassword();
    
    String sql = "INSERT INTO Patient (Patient_FName, Patient_LName, Patient_Phone, Patient_Address, Patient_Email, Patient_Password) "
               + "VALUES (?, ?, ?, ?, ?, ?)";
    
    try {
        // Load Oracle JDBC driver explicitly
        Class.forName("oracle.jdbc.OracleDriver");
        
        // Establish the connection
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

            preparedStatement.setString(1, fname);
            preparedStatement.setString(2, lname);
            preparedStatement.setString(3, phone);
            preparedStatement.setString(4, address);
            preparedStatement.setString(5, email);
            preparedStatement.setString(6, password);

            int result = preparedStatement.executeUpdate();
            if (result > 0) {
                return "success"; // Registration was successful
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        System.err.println("Oracle JDBC Driver not found.");
    }

    return "error"; // Registration failed
}

}