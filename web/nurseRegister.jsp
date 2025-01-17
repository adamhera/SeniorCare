<%-- 
    Document   : nurseRegister
    Created on : Dec 29, 2024, 9:00:37 PM
    Author     : adamh
 ni tak guna
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Nurse Registration</title>
</head>
<body>
    <h2>Nurse Registration</h2>

    <!-- Display error message if set in the request -->
    <% String message = (String) request.getAttribute("message"); %>
    <% if (message != null) { %>
        <p style="color: red;"><%= message %></p>
    <% } %>

    <form action="NurseRegisterServlet" method="POST">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select><br><br>

        <input type="submit" value="Register">
    </form>
</body>
</html>
