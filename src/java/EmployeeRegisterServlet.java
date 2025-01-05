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
        String status = request.getParameter("status");
        String password = request.getParameter("password");
        
         RegisterBeanEmployee registerBean = new RegisterBeanEmployee(name, email, gender, role, status, password);
        RegisterDaoEmployee registerDao = new RegisterDaoEmployee();
        /*try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Driver loaded successfully!");

            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");
            System.out.println("Database connected successfully!");

            String query = "INSERT INTO Employee (Emp_Name, Emp_Email, Emp_Gender, Emp_Role, Status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);

            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, gender);
            stmt.setString(4, role);
            stmt.setString(5, "Pending");

            int rows = stmt.executeUpdate();
            System.out.println(rows + " rows inserted.");

            stmt.close();
            conn.close();

            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }*/
        
        String result = registerDao.registerUser(registerBean);
        if (result.equals("success")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/nurseLogin.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/employeeRegister.jsp");
            dispatcher.forward(request, response);
        }
        // Redirect to a confirmation page or patient list
        //response.sendRedirect("ListPatientsServlet");
    }
 }

