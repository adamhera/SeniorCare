<%-- 
    Document   : editNurseInfo
    Created on : Jan 11, 2025, 7:07:18 PM
    Author     : adamh
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Nurse Information</title>
</head>
<body>
    <h2>Edit Your Information</h2>
    <form action="UpdateNurseInfoServlet" method="POST">
    <label for="nurse_certification">Nurse Certification:</label>
    <input type="text" id="nurse_certification" name="nurse_certification" required><br><br>

    <label for="nurse_shift">Nurse Shift:</label>
    <input type="text" id="nurse_shift" name="nurse_shift" required><br><br>

    <input type="submit" value="Update Information">
</form>
    <br>
    <a href="nurseDashboard.jsp">Back to Dashboard</a>
</body>
</html>
