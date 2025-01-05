<%-- 
    Document   : booking
    Created on : Dec 30, 2024, 5:19:08 PM
    Author     : adamh
--%>
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<%@page import="java.sql.*"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
    <title>Book a Package</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        h2 {
            color: #4CAF50;
        }
        form {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        label {
            font-weight: bold;
        }
        input[type="date"],
        input[type="time"],
        input[type="submit"] {
            display: block;
            margin: 10px 0 20px;
            padding: 10px;
            width: 100%;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Book a Package</h2>

    <% 
        // Check if the patient is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("patientID") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
        }

        // Retrieve the patient ID and package ID
        String patientID = session.getAttribute("patientID").toString();
        String packageID = request.getParameter("packageID"); // Passed from the "Book Now" button

        // Initialize variables for package details
        String packageName = "";
        String packagePrice = "";

        try {
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");

            // Retrieve package details using the packageID
            String query = "SELECT Package_Name, Price FROM Package WHERE Package_ID = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, packageID);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                packageName = rs.getString("Package_Name");
                packagePrice = rs.getString("Price");
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>

    <!-- Booking Form -->
    <form action="BookingServlet" method="POST">
        <!-- Hidden inputs to pass patient ID and package ID -->
        <input type="hidden" name="patientID" value="<%= patientID %>">
        <input type="hidden" name="packageID" value="<%= packageID %>">

        <!-- Display package details -->
        <p><strong>Package Name:</strong> <%= packageName %></p>
        <p><strong>Price:</strong> RM <%= packagePrice %></p>

        <!-- Date selection -->
        <label for="date">Select Date:</label>
        <input type="date" id="date" name="date" required>

        <!-- Time selection -->
        <label for="time">Select Time:</label>
        <input type="time" id="time" name="time" required>

        <!-- Submit button -->
        <input type="submit" value="Confirm Booking">
    </form>
</body>
</html>
