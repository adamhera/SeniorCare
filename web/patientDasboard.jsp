<%-- 
    Document   : patientDasboard
    Created on : Jan 6, 2025, 11:23:42 PM
    Author     : adamh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page session="true" %>
<%
    if (session.getAttribute("patientID") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String patientName = (String) session.getAttribute("patientName");
    int patientID = (int) session.getAttribute("patientID");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Dashboard</title>
</head>
<body>
    <h1>Welcome to Senior Care Connect, <%= patientName %>!</h1>

    <h2>Available Packages</h2>
    <table border="1">
        <tr>
            <th>Package Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        <%
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");
            String queryPackages = "SELECT Package_ID, Package_Name, Package_Description, Package_Price FROM Package";
            PreparedStatement stmt = conn.prepareStatement(queryPackages);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("Package_Name") %></td>
            <td><%= rs.getString("Package_Description") %></td>
            <td><%= rs.getDouble("Package_Price") %></td>
            <td>
                <form action="BookingServlet" method="POST">
                    <input type="hidden" name="packageID" value="<%= rs.getInt("Package_ID") %>">
                    <button type="submit">Book</button>
                </form>
            </td>
        </tr>
        <% 
            }
            rs.close();
            stmt.close();
            conn.close();
        %>
    </table>

    <h2>Your Information</h2>
    <form action="EditPatientInfoServlet" method="GET">
        <button type="submit">Edit My Information</button>
    </form>
</body>
</html>
