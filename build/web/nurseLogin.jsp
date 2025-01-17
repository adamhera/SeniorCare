<%-- 
    Document   : nurseLogin
    Created on : Dec 28, 2024, 9:17:43 PM
    Author     : adamh
 ni tak guna
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Nurse Login</title>
</head>
<body>
    <h2>Nurse Login</h2>

    <!-- Display error message if set in the request -->
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>

    <form action="EmployeeLoginServlet" method="POST">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
