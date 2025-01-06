<%-- 
    Document   : employeeLogin
    Created on : Jan 5, 2025, 11:09:47 PM
    Author     : adamh
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Login</title>
</head>
<body>
    <h2>Employee Login</h2>

    <form action="EmployeeLoginServlet" method="POST">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <label for="role">Role:</label>
        <select id="role" name="role" required>
            <option value="Admin">Admin</option>
            <option value="Nurse">Nurse</option>
        </select><br><br>

        <input type="submit" value="Login">
    </form>
    <p style="color: red;">
        ${errorMessage != null ? errorMessage : ""}
    </p>
</body>
</html>
