/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



/**
 *
 * @author adamh
 */
import com.seniorcare.model.Employee;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "EmployeeLoginServlet", urlPatterns = {"/EmployeeLoginServlet"})
public class EmployeeLoginServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get user inputs
        String empEmail = request.getParameter("empEmail");
        String empPassword = request.getParameter("empPassword");

        // Database logic
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
            String query = "SELECT * FROM Employee WHERE Emp_Email = ? AND Emp_Password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, empEmail);
            stmt.setString(2, empPassword);

            ResultSet resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                // Create and populate the Employee object
                Employee employee = new Employee();
                employee.setEmpID(resultSet.getInt("Emp_ID"));
                employee.setEmpName(resultSet.getString("Emp_Name"));
                employee.setEmpEmail(resultSet.getString("Emp_Email"));
                employee.setEmpRole(resultSet.getString("Emp_Role"));
                employee.setEmpGender(resultSet.getString("Emp_Gender"));

                // Store the Employee object in session
                HttpSession session = request.getSession();
                session.setAttribute("employee", employee);

                // Redirect based on the role
                if (employee.getEmpRole().equalsIgnoreCase("Admin")) {
                    response.sendRedirect("adminDashboard.jsp");
                } else if (employee.getEmpRole().equalsIgnoreCase("Nurse")) {
                    response.sendRedirect("nurseDashboard.jsp");
                }
            } else {
                // Invalid credentials, redirect back to login
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database connection error.");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles patient login functionality";
    }
}

