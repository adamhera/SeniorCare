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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1e8e3;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        textarea {
            height: 80px;
        }
        button {
            padding: 10px 15px;
            background-color: #735445;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #735445;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #735445;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
        .message {
            text-align: center;
            font-size: 14px;
            margin-top: 15px;
        }
        .message.error {
            color: red;
        }
        .message.success {
            color: green;
        }
    </style>
</head> 
<body> 
    <div class="container">
        <h2>Edit Package</h2>
        <form action="EditPackageServlet" method="POST">
            <!-- Hidden fields -->
            <input type="hidden" name="action" value="Save">
            <input type="hidden" name="packageID" value="<%= request.getAttribute("packageID") != null ? request.getAttribute("packageID") : "" %>">

            <!-- Form fields -->
            <label for="packageName">Package Name:</label>
            <input type="text" name="packageName" id="packageName" value="<%= request.getAttribute("packageName") != null ? request.getAttribute("packageName") : "" %>" required>

            <label for="packageDescription">Package Description:</label>
            <input type="text" name="packageDescription" id="packageDescription" required>
            <%= request.getAttribute("packageDescription") != null ? request.getAttribute("packageDescription") : "" %></input>

            <label for="packagePrice">Price:</label>
            <input type="number" name="packagePrice" id="packagePrice" step="0.01" value="<%= request.getAttribute("packagePrice") != null ? request.getAttribute("packagePrice") : "" %>" required>

            <!-- Buttons -->
            <button type="submit">Save Changes</button>
            <a href="adminDashboard.jsp" class="back-link">Back to admin dashboard</a>
        </form>

        <!-- Messages -->
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="message error"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
        <% if (request.getAttribute("successMessage") != null) { %>
            <p class="message success"><%= request.getAttribute("successMessage") %></p>
        <% } %>
    </div>
</body> 
</html>
