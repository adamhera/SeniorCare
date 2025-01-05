<%-- 
    Document   : employeeRegister
    Created on : Dec 30, 2024, 4:43:53 PM
    Author     : adamh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Registration</title>
    </head>
    <body>
        <form action="EmployeeRegisterServlet" method="POST">
       <label for="name">Name:</label>
       <input type="text" id="name" name="name" required><br>

       <label for="email">Email:</label>
       <input type="email" id="email" name="email" required><br>

       <label for="gender">Gender:</label>
       <select id="gender" name="gender">
           <option value="Male">Male</option>
           <option value="Female">Female</option>
       </select><br>

       <label for="role">Role:</label>
       <select id="role" name="role">
           <option value="Nurse">Nurse</option>
           <option value="Admin">Admin</option>
       </select><br>

       <input type="submit" value="Register">
   </form>

    </body>
</html>
