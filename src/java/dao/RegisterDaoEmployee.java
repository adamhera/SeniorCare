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
import java.sql.ResultSet;

import java.sql.*;

public class RegisterDaoEmployee {
    public String registerUser(RegisterBeanEmployee registerBeanEmployee) {
        String name = registerBeanEmployee.getName();
        String email = registerBeanEmployee.getEmail();
        String role = registerBeanEmployee.getRole();
        String status = registerBeanEmployee.getStatus();
        String gender = registerBeanEmployee.getGender();
        String password = registerBeanEmployee.getPassword();
        
        //Ni guna javdb
        String jdbcURL = "jdbc:derby://localhost:1527/SeniorCareDB";
        String dbUser = "app";
        String dbPassword = "app";

        Connection conn = null;
        PreparedStatement empStmt = null;
        PreparedStatement roleStmt = null;

        try {
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Insert into EMPLOYEE table
            String empSql = "INSERT INTO EMPLOYEE (EMP_NAME, EMP_EMAIL, EMP_ROLE, STATUS, EMP_GENDER, EMP_PASSWORD) VALUES (?, ?, ?, ?, ?, ?)";
            empStmt = conn.prepareStatement(empSql, PreparedStatement.RETURN_GENERATED_KEYS);
            empStmt.setString(1, name);
            empStmt.setString(2, email);
            empStmt.setString(3, role);
            empStmt.setString(4, status);
            empStmt.setString(5, gender);
            empStmt.setString(6, password);
            int empResult = empStmt.executeUpdate();

            // Get the generated EMP_ID
            ResultSet rs = empStmt.getGeneratedKeys();
            int empId = 0;
            if (rs.next()) {
                empId = rs.getInt(1);
            }

            // Insert into specific role table
            if (role.equalsIgnoreCase("Admin")) {
                String adminSql = "INSERT INTO ADMIN (EMP_ID, ADMIN_CERTIFICATION) VALUES (?, ?)";
                roleStmt = conn.prepareStatement(adminSql);
                roleStmt.setInt(1, empId);
                roleStmt.setString(2, "Default Certification");
                roleStmt.executeUpdate();
            } else if (role.equalsIgnoreCase("Nurse")) {
                String nurseSql = "INSERT INTO NURSE (EMP_ID, NURSE_CERTIFICATION, NURSE_SHIFT) VALUES (?, ?, ?)";
                roleStmt = conn.prepareStatement(nurseSql);
                roleStmt.setInt(1, empId);
                roleStmt.setString(2, "Default Certification");
                roleStmt.setString(3, "Day Shift");
                roleStmt.executeUpdate();
            }

            return "success";
        } catch (SQLException e) {
            e.printStackTrace();
            return "error";
        } finally {
            try {
                if (empStmt != null) empStmt.close();
                if (roleStmt != null) roleStmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}


