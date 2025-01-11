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

    String patientFirstName = (String) session.getAttribute("patientFirstName");
    int patientID = Integer.parseInt(session.getAttribute("patientID").toString());
%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Dashboard</title>
</head>
<body>
    <h1>Welcome to Senior Care Connect, <%= patientFirstName %>!</h1>

    <h2>Available Packages</h2>
<table border="1">
    <tr>
        <th>Package Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Action</th>
    </tr>
    <%
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
            String queryPackages = "SELECT Package_ID, Package_Name, Package_Description, Package_Price FROM Package";
            try (PreparedStatement stmt = conn.prepareStatement(queryPackages)) {
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
                <label for="bookingDate">Date:</label>
                <input type="date" name="bookingDate" required>
                <label for="bookingTime">Time:</label>
                <input type="time" name="bookingTime" required>
                
                
                
                <button type="submit">Book</button>
            </form>
        </td>
    </tr>
    <%
                }
                rs.close();
            }
        } catch (Exception e) {
            out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
        }
    %>
</table>


 <h2>Your Bookings</h2>
<table border="1">
    <tr>
        <th>Package Name</th>
        <th>Date</th>
        <th>Time</th>
        <th>Amount to Pay</th>
        <th>Status</th>
        <th>Nurse Name</th> <!-- New Column for Nurse Name -->
        <th>Actions</th>
    </tr>
    <%
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
            String queryBookings = "SELECT b.Booking_ID, p.Package_Name, b.Booking_Date, b.Booking_Time, p.Package_Price AS Amount_To_Pay, b.status, e.emp_Name " +
                                   "FROM Booking b " +
                                   "JOIN Package p ON b.Package_ID = p.Package_ID " +
                                   "LEFT JOIN Employee e ON p.emp_id = e.emp_ID " +  // Join with Employee table to get nurse's name
                                   "WHERE b.Patient_ID = ?";

            try (PreparedStatement stmtBooking = conn.prepareStatement(queryBookings)) {
                stmtBooking.setInt(1, patientID);
                ResultSet rsBooking = stmtBooking.executeQuery();

                while (rsBooking.next()) {
                    int bookingID = rsBooking.getInt("Booking_ID");
    %>
    <tr>
        <td><%= rsBooking.getString("Package_Name") %></td>
        <td><%= rsBooking.getDate("Booking_Date") %></td>
        <td><%= rsBooking.getTime("Booking_Time") %></td>
        <td><%= rsBooking.getDouble("Amount_To_Pay") %></td>
        <td><%= rsBooking.getString("Status") %></td>
        <td><%= rsBooking.getString("emp_Name") != null ? rsBooking.getString("emp_Name") : "No nurse assigned" %></td> <!-- Nurse Name -->
        <td>
            <form action="EditBookingServlet" method="GET" style="display:inline;">
                <input type="hidden" name="bookingID" value="<%= bookingID %>">
                <button type="submit">Edit</button>
            </form>
            <form action="CancelBookingServlet" method="POST" style="display:inline;">
                <input type="hidden" name="bookingID" value="<%= bookingID %>">
                <button type="submit" onclick="return confirm('Are you sure you want to cancel this booking?');">Cancel</button>
            </form>
        </td>
    </tr>
    <%
                }
                rsBooking.close();
            }
        } catch (Exception e) {
            out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
        }
    %>
</table>



    <h2>Your Information</h2>
    <!-- Button to navigate to Edit Patient Info -->
    <form action="EditPatientInfoServlet" method="GET">
        <button type="submit">Edit My Information</button>
    </form>

    <!-- Option to log out -->
    <form action="LogoutServlet" method="POST">
        <button type="submit">Logout</button>
    </form>
</body>
</html>


