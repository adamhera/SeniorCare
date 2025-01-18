/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
TAK GUNa
 */

import com.seniorcare.model.Employee;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PendingApprovalsServlet")
public class PendingApprovalsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Employee> pendingEmployees = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");
            String query = "SELECT Emp_ID, Emp_Name, Emp_Email, Emp_Gender FROM Employee WHERE Status = 'Pending'";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Employee employee = new Employee();
                employee.setEmpID(rs.getInt("Emp_ID"));
                employee.setEmpName(rs.getString("Emp_Name"));
                employee.setEmpEmail(rs.getString("Emp_Email"));
                employee.setEmpGender(rs.getString("Emp_Gender"));
                pendingEmployees.add(employee);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the data in the request attribute and forward to JSP
        request.setAttribute("pendingEmployees", pendingEmployees);
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}
