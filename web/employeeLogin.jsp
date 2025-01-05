<%-- 
    Document   : employeeLogin
    Created on : Jan 5, 2025, 11:09:47 PM
    Author     : adamh
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Employee Login</h2>

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
