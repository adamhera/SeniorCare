<%-- 
    Document   : adminDashboard
    Created on : Dec 29, 2024, 9:01:29 PM
    Author     : adamh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h2>Pending Nurse Approvals</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Gender</th>
            <th>Action</th>
        </tr>
        <% 
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");
            String query = "SELECT Emp_ID, Emp_Name, Emp_Email, Emp_Gender FROM Employee WHERE Status = 'Pending'";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("Emp_ID") %></td>
            <td><%= rs.getString("Emp_Name") %></td>
            <td><%= rs.getString("Emp_Email") %></td>
            <td><%= rs.getString("Emp_Gender") %></td>
            <td>
                <form action="ApproveRejectServlet" method="POST">
                    <input type="hidden" name="empID" value="<%= rs.getInt("Emp_ID") %>">
                    <button type="submit" name="action" value="Approve">Approve</button>
                    <button type="submit" name="action" value="Reject">Reject</button>
                </form>
            </td>
        </tr>
        <% 
            }
            rs.close();
            stmt.close();
            conn.close();
        %>
    </table>
</body>
</html>
