<%-- 
    Document   : nurseDashboard
    Created on : Dec 28, 2024, 9:20:15 PM
    Author     : adamh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page session="true" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("employeeID") == null) {
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
    <h2>Welcome, <%= session.getAttribute("employeeName") %>!</h2>
    <a href="LogoutServlet">Logout</a>

    <h3>List of Bookings</h3>
    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>Patient Name</th>
            <th>Package Name</th>
            <th>Booking Date</th>
            <th>Booking Time</th>
            <th>Action</th>
        </tr>
        <%
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");

            String queryBookings = "SELECT b.Booking_ID, p.Patient_FName || ' ' || p.Patient_LName AS PatientName, " +
                                   "pk.Package_Name, b.Booking_Date, b.Booking_Time " +
                                   "FROM Booking b " +
                                   "JOIN Patient p ON b.Patient_ID = p.Patient_ID " +
                                   "JOIN Package pk ON b.Package_ID = pk.Package_ID " +
                                   "WHERE b.Status = 'Pending'"; // Show only pending bookings

            PreparedStatement stmtBookings = conn.prepareStatement(queryBookings);
            ResultSet rsBookings = stmtBookings.executeQuery();

            while (rsBookings.next()) {
        %>
        <tr>
            <td><%= rsBookings.getInt("Booking_ID") %></td>
            <td><%= rsBookings.getString("PatientName") %></td>
            <td><%= rsBookings.getString("Package_Name") %></td>
            <td><%= rsBookings.getDate("Booking_Date") %></td>
            <td><%= rsBookings.getTime("Booking_Time") %></td>
            <td>
                <form action="UpdateBookingStatusServlet" method="POST">
                    <input type="hidden" name="bookingID" value="<%= rsBookings.getInt("Booking_ID") %>">
                    <button type="submit" name="action" value="Accept">Accept</button>
                    <button type="submit" name="action" value="Reject">Reject</button>
                </form>
            </td>
        </tr>
        <% 
            }
            rsBookings.close();
            stmtBookings.close();
        %>
    </table>
</body>
</html>
