<%-- 
    Document   : editPackage
    Created on : Jan 9, 2025, 10:54:01 AM
    Author     : adamh
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Package</title>
</head>
<body>
    <h2>Edit Package</h2>

    <form action="EditPackageServlet" method="POST">
        <!-- Hidden field to pass the package ID for editing -->
        <input type="hidden" name="packageID" value="<%= request.getAttribute("packageID") != null ? request.getAttribute("packageID") : "" %>">

        <label for="packageName">Package Name:</label>
        <input type="text" name="packageName" value="<%= request.getAttribute("packageName") != null ? request.getAttribute("packageName") : "" %>" required>
        <br>

        <label for="packageDescription">Package Description:</label>
        <textarea name="packageDescription" required><%= request.getAttribute("packageDescription") != null ? request.getAttribute("packageDescription") : "" %></textarea>
        <br>

        <label for="packagePrice">Price:</label>
        <input type="number" name="packagePrice" step="0.01" value="<%= request.getAttribute("packagePrice") != null ? request.getAttribute("packagePrice") : "" %>" required>
        <br>

        <button type="submit">Save Changes</button>
        <a href="adminDashboard.jsp">Back to Dashboard</a>
    </form>

    <% if (request.getAttribute("errorMessage") != null) { %>
        <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
    <% } %>
    <% if (request.getAttribute("successMessage") != null) { %>
        <p style="color: green;"><%= request.getAttribute("successMessage") %></p>
    <% } %>
</body>
</html>

