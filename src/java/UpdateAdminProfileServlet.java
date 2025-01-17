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
        // Retrieve the form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        AdminDAO adminDAO = new AdminDAO();
        // Call the DAO method to update the admin profile
        boolean isUpdated = adminDAO.updateAdminProfile(username, password);

        if (isUpdated) {
            // If update is successful
            request.setAttribute("successMessage", "Profile updated successfully!");
        } else {
            // If update fails
            request.setAttribute("errorMessage", "Failed to update profile. Please try again.");
        }

        // Forward back to the admin dashboard
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}
