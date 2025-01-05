/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ApproveRejectServlet")
public class ApproveRejectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from the request
        int empID = Integer.parseInt(request.getParameter("empID"));
        String action = request.getParameter("action"); // Approve or Reject

        String newStatus = action.equals("Approve") ? "Approved" : "Rejected";

        try {
            // Database connection
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");
            String query = "UPDATE Employee SET Status = ? WHERE Emp_ID = ?";
            PreparedStatement stmt = conn.prepareStatement(query);

            stmt.setString(1, newStatus);
            stmt.setInt(2, empID);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Status updated successfully!");
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to the admin dashboard
        response.sendRedirect("PendingApprovalsServlet");
    }
}
