/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import bean.RegisterBeanEmployee;
import dao.RegisterDaoEmployee;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/EmployeeRegisterServlet"})
public class EmployeeRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String role = request.getParameter("role");
        String status = "Pending"; // Default status for new employees
        String password = request.getParameter("password");

        // Debugging: Print received inputs
        System.out.println("Received registration data:");
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Gender: " + gender);
        System.out.println("Role: " + role);
        System.out.println("Password: " + password);

        // Create RegisterBeanEmployee object
        RegisterBeanEmployee registerBean = new RegisterBeanEmployee(name, email, role, status, gender, password);

        // Call DAO for registration
        RegisterDaoEmployee registerDao = new RegisterDaoEmployee();
        String result = registerDao.registerUser(registerBean);

        // Debugging: Print DAO result
        System.out.println("DAO result: " + result);

        if (result.equals("success")) {
            // Successful registration
            RequestDispatcher dispatcher = request.getRequestDispatcher("pendingApproval.jsp");
            dispatcher.forward(request, response);
        } else {
            // Registration failed
             request.setAttribute("errorMessage", "Registration failed. Please try again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/employeeRegister.jsp");
                dispatcher.forward(request, response);
        }
    }
}


