<%-- 
    Document   : patientDasboard
    Created on : Jan 6, 2025, 11:23:42 PM
    Author     : adamh


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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        header h1 {
            margin: 0;
            color: #333;
        }
        header .btn-container {
            display: flex;
            gap: 10px;
        }
        .btn {
            padding: 8px 12px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
            border: none;
            font-size: 14px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn.logout {
            background-color: #dc3545;
        }
        .btn.logout:hover {
            background-color: #c82333;
        }
        .dropdown {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .dropdown-header {
            padding: 10px;
            background-color: #f8f8f8;
            cursor: pointer;
            font-size: 18px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .dropdown-header:hover {
            background-color: #eaeaea;
        }
        .dropdown-content {
            display: none;
            padding: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        table th {
            background-color: #f8f8f8;
            color: #333;
        }
        
        .cannot-cancel {
        color: red; /* Text color */
        font-weight: bold; /* Bold text */
        font-size: 14px; /* Font size */
        background-color: #ffe5e5; /* Light red background */
        padding: 5px 10px; /* Padding inside the span */
        border-radius: 5px; /* Rounded corners */
        border: 1px solid #ffcccc; /* Light red border */
        display: inline-block; /* Align nicely in a line */
        text-align: center; /* Center text */
        }
        
        .cannot-edit {
            color: gray; /* Neutral color for disabled messages */
            font-size: 14px; /* Adjust font size */
            font-style: italic; /* Italicize text for distinction */
            padding: 2px 5px; /* Add some padding */
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Welcome, <%= patientFirstName %>!</h1>
            <div class="btn-container">
                <form action="EditPatientInfoServlet" method="GET">
                    <button type="submit" class="btn">Edit My Information</button>
                </form>
                <form action="LogoutServlet" method="POST">
                    <button type="submit" class="btn logout">Logout</button>
                </form>
            </div>
        </header>

        <!-- Available Packages -->
        <div class="dropdown">
            <div class="dropdown-header" onclick="toggleDropdown('packagesDropdown')">
                Available Packages
                <span>&#9660;</span>
            </div>
            <div class="dropdown-content" id="packagesDropdown">
                <table>
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
                                <button type="submit" class="btn">Book</button>
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
            </div>
        </div>

        <!-- Your Bookings -->
        <div class="dropdown">
            <div class="dropdown-header" onclick="toggleDropdown('bookingsDropdown')">
                Your Bookings
                <span>&#9660;</span>
            </div>
            <div class="dropdown-content" id="bookingsDropdown">
                <table>
                    <tr>
                        <th>Package Name</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Amount to Pay</th>
                        <th>Status</th>
                        <!--<th>Nurse Name</th>-->
                        <th>Actions</th>
                    </tr>
                    <%
                        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
                            String queryBookings = "SELECT b.Booking_ID, p.Package_Name, b.Booking_Date, b.Booking_Time, p.Package_Price AS Amount_To_Pay, b.status, e.emp_Name " +
                                                   "FROM Booking b " +
                                                   "JOIN Package p ON b.Package_ID = p.Package_ID " +
                                                   "LEFT JOIN Employee e ON p.emp_id = e.emp_ID " +
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
                        <%-- <td><%= rsBooking.getString("emp_Name") != null ? rsBooking.getString("emp_Name") : "No nurse assigned" %></td> --%>
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
                            out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </table>
            </div>
        </div>
    </div>

    <script>
        function toggleDropdown(dropdownId) {
            const content = document.getElementById(dropdownId);
            content.style.display = content.style.display === "block" ? "none" : "block";
        }
    </script>
</body>
</html>


