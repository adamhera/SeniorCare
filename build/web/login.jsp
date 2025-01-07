<%-- 
    Document   : login
    Created on : Dec 28, 2024, 9:06:14 PM
    Author     : adamh
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Patient Login</title>
</head>
<body>
    <h2>Patient Login</h2>

    <% 
        // Invalidate the session to ensure clean login
        if (session != null) {
            session.invalidate();
        }
    %>

    <form action="LoginPatientServlet" method="POST">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="Login">
    </form>

    <div style="color: red; font-weight: bold;">
        <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
    </div>

    <p>Don't have an account? <a href="register.jsp">Register here</a>.</p>
</body>
</html>
