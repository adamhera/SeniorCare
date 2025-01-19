<%-- 
    Document   : deleteEmployee
    Created on : Jan 18, 2025, 11:42:11 AM
    Author     : adamh
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
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
            background-color: #f1e8e3; /* Very light brown */
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #735445; /* Darker soft brown */
        }
        p {
            color: #8b6a59; /* Soft brown */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #ffffff;
        }
        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #8b6a59; /* Soft brown */
        }
        table th {
            background-color: #735445; /* Darker soft brown */
            color: white;
        }
        table tr:nth-child(even) {
            background-color: #f1e8e3; /* Very light brown */
        }
        table tr:hover {
            background-color: #8b6a59; /* Soft brown */
            color: white;
        }
        .btn {
            background-color: red; /* Soft brown */
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: red; /* Darker soft brown */
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
