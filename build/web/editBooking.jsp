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

        <label for="packageName">Package:</label>
        <select name="packageName" required>
            <option value="Basic Package" <%= "Basic Package".equals(request.getAttribute("packageName")) ? "selected" : "" %>>Basic Package</option>
            <option value="Package A" <%= "Package A".equals(request.getAttribute("packageName")) ? "selected" : "" %>>Package A</option>
            <option value="Package B" <%= "Package B".equals(request.getAttribute("packageName")) ? "selected" : "" %>>Package B</option>
            <option value="Package C" <%= "Package C".equals(request.getAttribute("packageName")) ? "selected" : "" %>>Package C</option>
        </select><br>

        <button type="submit">Save Changes</button>
    </form>
</body>
</html>

