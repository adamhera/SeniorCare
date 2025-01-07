<%-- 
    Document   : editPatientinfo
    Created on : Jan 6, 2025, 11:25:36 PM
    Author     : adamh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    if (session.getAttribute("patientID") == null) {
        response.sendRedirect("patientLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Patient Information</title>
</head>
<body>
    <h2>Edit Your Information</h2>
    <form action="EditPatientInfoServlet" method="POST">
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" value="<%= session.getAttribute("patientFirstName") %>" required><br><br>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" value="<%= session.getAttribute("patientLastName") %>" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= session.getAttribute("patientEmail") %>" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br>
        <small>(Leave blank if you don't want to change it)</small><br><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%= session.getAttribute("patientAddress") %>" required><br><br>

        <input type="submit" value="Update">
    </form>
   
      <!-- Button to go back to patient dashboard -->
    <form action="patientDasboard.jsp" method="GET">
        <input type="submit" value="Back to Dashboard">
    </form>
    <!-- Display error or success messages -->
    <p style="color: red;"><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %></p>
    <p style="color: green;"><%= request.getAttribute("successMessage") != null ? request.getAttribute("successMessage") : "" %></p>
</body>
</html>

