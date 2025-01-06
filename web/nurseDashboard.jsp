<%-- 
    Document   : nurseDashboard
    Created on : Dec 28, 2024, 9:20:15 PM
    Author     : adamh
--%>
<%@ page session="true" %>
<%
    if (session.getAttribute("nurseID") == null) {
        response.sendRedirect("employeeLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Nurse Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= session.getAttribute("nurseName") %>!</h2>
    <a href="LogoutServlet">Logout</a>
</body>
</html>
</html>
