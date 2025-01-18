<%-- 
    Document   : deleteEmployee
    Created on : Jan 18, 2025, 11:42:11 AM
    Author     : adamh
--%>

<%@page import="java.sql.*"%>
<%@page import="util.DBConnection"%>
<%@page session="true" %>

<%
    // Check if the admin is logged in
    if (session.getAttribute("emp_id") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    // Establish database connection and fetch rejected employees
    Connection conn = DBConnection.createConnection();
    String query = "SELECT Emp_ID, Emp_Name, Emp_Email FROM Employee WHERE Status = 'Rejected'";
    PreparedStatement stmt = conn.prepareStatement(query);
    ResultSet rs = stmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Rejected Employees</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        h2 {
            color: #2c3e50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        table th {
            background-color: #3498db;
            color: white;
        }
        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .btn {
            background-color: #e74c3c;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <h2>Delete Rejected Employees</h2>
    <p>Below is the list of employees with the "Rejected" status. You can delete their records.</p>

    <table>
        <tr>
            <th>Employee ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Action</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("Emp_ID") %></td>
            <td><%= rs.getString("Emp_Name") %></td>
            <td><%= rs.getString("Emp_Email") %></td>
            <td>
                <form action="DeleteEmployeeServlet" method="POST" style="display:inline;">
                    <input type="hidden" name="emp_id" value="<%= rs.getInt("Emp_ID") %>">
                    <button type="submit" class="btn">Delete</button>
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
