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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1e8e3;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            font-weight: bold;
            color: #555;
        }
        input[type="text"], 
        input[type="date"], 
        input[type="time"], 
        select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px 15px;
            background-color: #735445;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #604138;
        }
        .back-link {
            display: inline-block;
            margin-top: 15px;
            text-align: center;
            text-decoration: none;
            color: #735445;
            font-size: 14px;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Booking</h2>
        <form action="EditBookingServlet" method="POST">
            <input type="hidden" name="bookingID" value="<%= request.getAttribute("bookingID") %>">

            <label for="bookingDate">Date:</label>
            <input 
                type="date" 
                name="bookingDate" 
                id="bookingDate" 
                value="<%= request.getAttribute("bookingDate") %>" 
                required
            >

            <label for="bookingTime">Time:</label>
            <input 
                type="time" 
                name="bookingTime" 
                id="bookingTime" 
                value="<%= request.getAttribute("bookingTime") %>" 
                required
            >

            <label for="packageName">Package:</label>
            <select name="packageName" id="packageName" required>
                <option value="Basic Package" <%= "Basic Package".equals(request.getAttribute("packageName")) ? "selected" : "" %>>Basic Package</option>
                <option value="Package A" <%= "Package A".equals(request.getAttribute("packageName")) ? "selected" : "" %>>Package A</option>
                <option value="Package B" <%= "Package B".equals(request.getAttribute("packageName")) ? "selected" : "" %>>Package B</option>
                <option value="Package C" <%= "Package C".equals(request.getAttribute("packageName")) ? "selected" : "" %>>Package C</option>
                <option value="Package D" <%= "Package D".equals(request.getAttribute("packageName")) ? "selected" : "" %>>Package D</option>
            </select>

            <button type="submit">Save Changes</button>
            <div style="text-align: center;">
                <a href="patientHome.jsp" class="back-link">Back to Home</a>
            </div>
        </form>
    </div>
</body>
</html>
