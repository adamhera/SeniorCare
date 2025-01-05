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
    <form action="LoginPatientServlet" method="POST">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="Login">
    </form>
    <p style="color: red;">
        ${errorMessage != null ? errorMessage : ""}
    </p>
</body>
</html>


