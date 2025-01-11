/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.seniorcare.model.Employee;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    // Method to get all employees with the role 'Nurse'
    public List<Employee> getNurses() {
        List<Employee> nurses = new ArrayList<>();

        // Get connection using the DBConnection utility
        try (Connection conn = DBConnection.createConnection()) {
            String query = "SELECT * FROM Employee WHERE empRole = 'Nurse'";  // Checking for 'Nurse' role
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // Create Employee object for each nurse found
                Employee nurse = new Employee();
                nurse.setEmpID(rs.getInt("empID"));  // Assuming the employee table uses 'empID' as the primary key
                nurse.setEmpName(rs.getString("empName"));
                nurse.setEmpEmail(rs.getString("empEmail"));
                nurse.setEmpRole(rs.getString("empRole"));
                nurse.setEmpGender(rs.getString("empGender"));
                nurses.add(nurse);
            }

            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return nurses;
    }
}
