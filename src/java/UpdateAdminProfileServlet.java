/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author adamh
 */
@WebServlet("/UpdateAdminProfileServlet")
public class UpdateAdminProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        int empID = (int) request.getSession().getAttribute("emp_id"); // Assuming empID is stored in session
        String adminCertification = request.getParameter("adminCertification");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate passwords
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match!");
            request.getRequestDispatcher("editAdminInfo.jsp").forward(request, response);
            return;
        }

        AdminDAO adminDAO = new AdminDAO();
        boolean isCertificationUpdated = adminDAO.updateAdminCertification(empID, adminCertification);
        boolean isPasswordUpdated = adminDAO.updateAdminPassword(empID, password);

        if (isCertificationUpdated && isPasswordUpdated) {
            request.setAttribute("successMessage", "Admin info updated successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to update admin info. Please try again.");
        }

        // Redirect back to admin dashboard
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}