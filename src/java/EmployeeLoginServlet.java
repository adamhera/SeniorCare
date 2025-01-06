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
        String role = request.getParameter("role"); // Get the role from the form

        LoginBeanEmployee loginBean = new LoginBeanEmployee();
        loginBean.setEmail(email);
        loginBean.setPassword(password);
        loginBean.setRole(role);

        LoginDaoEmployee loginDao = new LoginDaoEmployee();
        String nurseName = loginDao.authenticateAndFetchName(loginBean); // Fetch nurse name if authentication is successful

        if (nurseName != null) {
            HttpSession session = request.getSession();
            session.setAttribute("nurseID", email); // Store email (or unique ID)
            session.setAttribute("nurseName", nurseName); // Store nurse name

            if ("Admin".equalsIgnoreCase(role)) {
                response.sendRedirect("adminDashboard.jsp");
            } else if ("Nurse".equalsIgnoreCase(role)) {
                response.sendRedirect("nurseDashboard.jsp");
            } else {
                request.setAttribute("errorMessage", "Unknown role.");
                request.getRequestDispatcher("employeeLogin.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("employeeLogin.jsp").forward(request, response);
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




