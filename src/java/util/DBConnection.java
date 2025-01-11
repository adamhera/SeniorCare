/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author adamh


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection createConnection() {
        Connection connection = null;
        try {
            String url = "jdbc:derby://localhost:1527/SeniorCareDB";
            String username = "app";
            String password = "app";
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    
}
* 
* */

/* ni guna database javadb*/
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String DB_URL = "jdbc:derby://localhost:1527/SeniorCareDB";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    public static Connection createConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}


/*Ni guna oracle
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // Oracle Database URL, username, and password
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE"; // Replace XE with your Oracle service name if different
    private static final String DB_USER = "SeniorCare"; // Replace with your schema username
    private static final String DB_PASSWORD = "system"; // Replace with your schema password

    public static Connection createConnection() {
        Connection connection = null;
        try {
            // Load Oracle JDBC Driver
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Establish the connection
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("Oracle JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Failed to connect to the database.");
            e.printStackTrace();
        }
        return connection;
    }
}
*/