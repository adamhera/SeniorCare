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
    <title>Patient Dashboard | SeniorCareConnect</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4ede4; /* Soft brown background */
        }

        /* Navbar Styling */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #8b6a59; /* Soft brown */
            padding: 10px 20px;
            color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            padding: 8px 16px;
            border-radius: 5px;
        }

        .navbar a:hover {
            background-color: #735445; /* Darker soft brown */
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        header {
            text-align: center;
            margin-bottom: 20px;
        }

        header h1 {
            font-size: 28px;
            color: #4a3a2a; /* Dark brown text */
        }

        /* Card Layout for Sections */
        .section {
            margin-bottom: 100px;
        }

        .section h2 {
            font-size: 24px;
            color: #8b6a59; /* Soft brown */
            margin-bottom: 15px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .card {
            background-color: #f9f5f1; /* Light brownish white */
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .card h3 {
            font-size: 20px;
            color: #4a3a2a; /* Dark brown text */
            margin-bottom: 10px;
        }

        .card p {
            margin: 5px 0;
            color: #5e4a3a; /* Medium brown */
        }

        .card button {
            display: inline-block;
            padding: 8px 12px;
            background-color: #8b6a59; /* Soft brown */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .card button:hover {
            background-color: #735445; /* Darker soft brown */
        }

        .card form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            width: 100px;
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #8b6a59; /* Soft brown */
            color: white;
         
        }
        table td {
        align-items: center;
        gap: 50px; /* Spacing between buttons/forms */
   
        }

        td form {
            display: inline-block; /* Prevents forms from overflowing */
        }
        table tr:hover {
            background-color: #f1e8e3; /* Very light brown */
        }

        .btn {
            padding: 8px 12px;
            background-color: #8b6a59; /* Soft brown */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn:hover {
            background-color: #735445; /* Darker soft brown */
        }

        .btn.cancel {
            background-color: #c75c5c; /* Soft red */
        }

        .btn.cancel:hover {
            background-color: #a94e4e; /* Darker red */
        }

        @media (max-width: 768px) {
            .navbar h1 {
                font-size: 20px;
            }

            .cards {
                grid-template-columns: 1fr;
            }
        }
             .cannot-cancel {
            color: red; /* Text color */
            font-weight: bold; /* Bold text */
             }
            .cannot-edit {
            color: gray; /* Neutral color for disabled messages */
            font-size: 14px; /* Adjust font size */
            font-style: italic; /* Italicize text for distinction */
            padding: 2px 5px; /* Add some padding */
        }
          footer {
                margin-top: 20px;
                text-align: center;
                padding: 10px;
                background-color: #6e4a38; /* Matches the footer color from the provided screenshot */
                color: white;
                border-radius: 8px;
            }
    </style>
</head>
<body>
<div class="navbar">
    <div style="display: flex; align-items: center;">
        <!-- Logo with White Background -->
        <div style="background-color: none; border-radius: 50px; padding: 3px; margin-right: 5px;">
            <img src="image/logo.png" alt="Logo" style="height: 60px; vertical-align: middle;">
        </div>
        <h1 style="margin: 0; font-size: 24px; color: white;">Senior Care Connect</h1>
    </div>
    <div>
        <a href="patientHome.jsp">Home</a>
        <a href="patientDasboard.jsp">Booking</a>
                <form action="EditPatientInfoServlet" method="GET" style="display: inline;">
            <button type="submit" class="btn" style="background: none; border: none; color: white; cursor: pointer;">Edit My Information</button>
        </form>
        <a href="home.jsp">Logout</a>
    </div>
</div>

    <div class="container">
        <!-- Welcome Header -->
        <header>
            <h1>Welcome to Senior Care Connect, <%= patientFirstName %>!</h1>
        </header>

        <!-- Available Packages Section -->
        <div class="section">
            <h2>Available Packages</h2>
            <div class="cards">
                <%
                    try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
                        String queryPackages = "SELECT Package_ID, Package_Name, Package_Description, Package_Price FROM Package";
                        try (PreparedStatement stmt = conn.prepareStatement(queryPackages)) {
                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                %>
                <div class="card">
                    <h3><%= rs.getString("Package_Name") %></h3>
                    <p><%= rs.getString("Package_Description") %></p>
                    <p>Price: $<%= rs.getDouble("Package_Price") %></p>
                    <form action="BookingServlet" method="POST">
                        <input type="hidden" name="packageID" value="<%= rs.getInt("Package_ID") %>">
                        <label for="bookingDate">Date:</label>
                        <input type="date" name="bookingDate" required>
                        <label for="bookingTime">Time:</label>
                        <input type="time" name="bookingTime" required>
                        <button type="submit">Book Now</button>
                    </form>
                </div>
                <%
                            }
                            rs.close();
                        }
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    }
                %>
            </div>
        </div>

        <!-- Your Bookings Section -->
        <div class="section">
            <h2>Your Bookings</h2>
            <table>
                <tr>
                    <th>Package Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Amount to Pay</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                <%
                    try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
                        String queryBookings = "SELECT b.Booking_ID, p.Package_Name, b.Booking_Date, b.Booking_Time, p.Package_Price AS Amount_To_Pay, b.status FROM Booking b JOIN Package p ON b.Package_ID = p.Package_ID WHERE b.Patient_ID = ?";
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
                    <td>$<%= rsBooking.getDouble("Amount_To_Pay") %></td>
                    <td><%= rsBooking.getString("Status") %></td>
                    <td>
              
                            <form action="EditBookingServlet" method="GET" style="display:inline;">
                            <input type="hidden" name="bookingID" value="<%= bookingID %>">
                            <% if (!"Accept".equalsIgnoreCase(rsBooking.getString("Status"))) { %>
                                <button type="submit" class="btn">Edit</button>
                            <% } else { %>
                                <span class="cannot-edit">Cannot edit</span>
                            <% } %>
                             </form>
                             
                            <% if ("Pending".equals(rsBooking.getString("Status"))) { %>
                            <form action="CancelBookingServlet" method="POST" style="display:inline;">
                                <input type="hidden" name="bookingID" value="<%= bookingID %>">
                                <button type="submit" class="btn logout" onclick="return confirm('Are you sure you want to cancel this booking?');">Cancel</button>
                            </form>
                                <% } else { %>
                                    <span class="cannot-cancel">Cannot cancel</span>
                                <% } %>
                        </td>
                
                </tr>
                <%
                            }
                            rsBooking.close();
                        }
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    }
                %>
            </table>
        </div>
    </div>


            <script>
        function toggleDropdown(dropdownId) {
            const content = document.getElementById(dropdownId);
            content.style.display = content.style.display === "block" ? "none" : "block";
        }
    </script>
    <footer>
    <p>&copy; 2025 Senior Care Connect</p>
</footer>
</body>
</html>