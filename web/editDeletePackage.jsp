<%-- 
    Document   : editDeletePackage
    Created on : Jan 9, 2025, 1:12:56 AM
    Author     : adamh
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit or Delete Package</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input, textarea, button {
            padding: 8px;
            width: 100%;
            max-width: 400px;
            margin-bottom: 15px;
        }
        button {
            width: auto;
            margin-right: 10px;
        }
        .error {
            color: red;
            margin-top: 10px;
        }
        .success {
            color: green;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>Edit or Delete Package</h1>
    
    <!-- Display success or error messages -->
    <%
        String successMessage = (String) request.getAttribute("successMessage");
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (successMessage != null) {
    %>
        <p class="success"><%= successMessage %></p>
    <% 
        } 
        if (errorMessage != null) { 
    %>
        <p class="error"><%= errorMessage %></p>
    <% 
        } 
    %>

    <form action="EditDeletePackageServlet" method="POST">
        <input type="hidden" name="packageID" value="<%= request.getAttribute("packageID") %>" />

        <label for="packageName">Package Name:</label>
        <input type="text" id="packageName" name="packageName" 
               value="<%= request.getAttribute("packageName") %>" required />

        <label for="packageDescription">Package Description:</label>
        <textarea id="packageDescription" name="packageDescription" rows="4" required>
            <%= request.getAttribute("packageDescription") %>
        </textarea>

        <label for="packagePrice">Package Price:</label>
        <input type="number" step="0.01" id="packagePrice" name="packagePrice" 
               value="<%= new DecimalFormat("#.00").format(request.getAttribute("packagePrice")) %>" required />

        <button type="submit" name="action" value="Edit">Save Changes</button>
        <button type="submit" name="action" value="Delete" 
                onclick="return confirm('Are you sure you want to delete this package?');">
            Delete Package
        </button>
    </form>

    <a href="adminDashboard.jsp">Back to Dashboard</a>
</body>
</html>

