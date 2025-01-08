<%-- 
    Document   : editBooking
    Created on : Jan 8, 2025, 8:22:10 PM
    Author     : adamh
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Booking</title>
</head>
<body>
    <h1>Edit Booking</h1>
    <form action="EditBookingServlet" method="POST">
        <input type="hidden" name="bookingID" value="<%= request.getAttribute("bookingID") %>">

        <label for="bookingDate">Date:</label>
        <input type="date" name="bookingDate" value="<%= request.getAttribute("bookingDate") %>" required><br>

        <label for="bookingTime">Time:</label>
        <input type="time" name="bookingTime" value="<%= request.getAttribute("bookingTime") %>" required><br>

        

        <label for="packageID">Package ID:</label>
        <input type="number" name="packageID" value="<%= request.getAttribute("packageID") %>" required><br>

        <button type="submit">Save Changes</button>
    </form>
</body>
</html>
