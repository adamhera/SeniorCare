<%-- 
    Document   : editPatientinfo
    Created on : Jan 6, 2025, 11:25:36 PM
    Author     : adamh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    if (session.getAttribute("patientID") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String patientName = (String) session.getAttribute("patientName");
    String patientEmail = (String) session.getAttribute("patientEmail");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Patient Information</title>
</head>
<body>
    <h1>Edit My Information</h1>
    <form action="UpdatePatientInfoServlet" method="POST">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= patientName %>" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= patientEmail %>" required><br><br>

        <button type="submit">Update</button>
    </form>
</body>
</html>
