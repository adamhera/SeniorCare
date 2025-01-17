/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ApproveRejectServlet")
public class ApproveRejectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int empID = Integer.parseInt(request.getParameter("empID"));
        String action = request.getParameter("action"); // Approve or Reject
        String newStatus = action.equals("Approve") ? "Approved" : "Rejected";

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
            conn.setAutoCommit(false);

            // Step 1: Update Employee Status
            String updateEmployeeQuery = "UPDATE Employee SET Status = ? WHERE Emp_ID = ?";
            try (PreparedStatement stmtUpdate = conn.prepareStatement(updateEmployeeQuery)) {
                stmtUpdate.setString(1, newStatus);
                stmtUpdate.setInt(2, empID);
                stmtUpdate.executeUpdate();
            }

            // Step 2: Check if Approved and Insert into Role Table
            if ("Approved".equalsIgnoreCase(action)) {
                String getRoleQuery = "SELECT Emp_Role FROM Employee WHERE Emp_ID = ?";
                try (PreparedStatement stmtGetRole = conn.prepareStatement(getRoleQuery)) {
                    stmtGetRole.setInt(1, empID);
                    ResultSet rs = stmtGetRole.executeQuery();

                    if (rs.next()) {
                        String role = rs.getString("Emp_Role");
                        System.out.println("Role for Emp_ID " + empID + ": " + role);

                        if ("Nurse".equalsIgnoreCase(role)) {
                            // Insert into Nurse Table
                            String insertNurseQuery = "INSERT INTO Nurse (Emp_ID) VALUES (?)";
                            try (PreparedStatement stmtInsertNurse = conn.prepareStatement(insertNurseQuery)) {
                                stmtInsertNurse.setInt(1, empID);
                                stmtInsertNurse.executeUpdate();
                                System.out.println("Nurse record inserted for Emp_ID: " + empID);
                            }
                        } else if ("Admin".equalsIgnoreCase(role)) {
                            // Insert into Admin Table
                            String insertAdminQuery = "INSERT INTO Admin (Emp_ID) VALUES (?)";
                            try (PreparedStatement stmtInsertAdmin = conn.prepareStatement(insertAdminQuery)) {
                                stmtInsertAdmin.setInt(1, empID);
                                stmtInsertAdmin.executeUpdate();
                                System.out.println("Admin record inserted for Emp_ID: " + empID);
                            }
                        }
                    }

                    rs.close();
                }
            }

            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect to Pending Approvals Page
        response.sendRedirect("PendingApprovalsServlet");
    }
}
