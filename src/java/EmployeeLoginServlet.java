/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author adamh
 */

import bean.LoginBeanEmployee;
import dao.LoginDaoEmployee;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EmployeeLoginServlet")
public class EmployeeLoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginBeanEmployee loginBean = new LoginBeanEmployee(email, password);

        LoginDaoEmployee loginDao = new LoginDaoEmployee();
        String role = loginDao.authenticateUser(loginBean); // Fetch role from the database

        if (role != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userRole", role); // Store the role in session
            session.setAttribute("userEmail", email); // Store user email in session
            
            // Redirect based on the role fetched from the database
            if ("Admin".equalsIgnoreCase(role)) {
                response.sendRedirect("adminDashboard.jsp"); // Redirect to admin dashboard
            } else if ("Nurse".equalsIgnoreCase(role)) {
                response.sendRedirect("nurseDashboard.jsp"); // Redirect to nurse dashboard
            } else {
                request.setAttribute("errorMessage", "Unknown role.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("employeeLogin.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("employeeLogin.jsp");
            dispatcher.forward(request, response);
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
        return "Handles employee login functionality";
    }
}



