<%-- 
    Document   : adminDashboard
    Created on : Dec 29, 2024, 9:01:29 PM
    Author     : adamh
--%>

<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h2>Admin Dashboard</h2>

    <!-- Section for Nurse Approvals -->
    <h3>Pending Nurse Approvals</h3>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Gender</th>
            <th>Action</th>
        </tr>
        <% 
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");

            // Query for pending nurse approvals
            String queryPendingNurses = "SELECT Emp_ID, Emp_Name, Emp_Email, Emp_Gender FROM Employee WHERE Status = 'Pending'";
            PreparedStatement stmtPendingNurses = conn.prepareStatement(queryPendingNurses);
            ResultSet rsPendingNurses = stmtPendingNurses.executeQuery();

            while (rsPendingNurses.next()) {
        %>
        <tr>
            <td><%= rsPendingNurses.getInt("Emp_ID") %></td>
            <td><%= rsPendingNurses.getString("Emp_Name") %></td>
            <td><%= rsPendingNurses.getString("Emp_Email") %></td>
            <td><%= rsPendingNurses.getString("Emp_Gender") %></td>
            <td>
                <form action="ApproveRejectServlet" method="POST">
                    <input type="hidden" name="empID" value="<%= rsPendingNurses.getInt("Emp_ID") %>">
                    <button type="submit" name="action" value="Approve">Approve</button>
                    <button type="submit" name="action" value="Reject">Reject</button>
                </form>
            </td>
        </tr>
        <% 
            }
            rsPendingNurses.close();
            stmtPendingNurses.close();
        %>
    </table>

    <hr>

    <!-- Section for Pending Bookings -->
    <h3>Pending Bookings</h3>
    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>Patient Name</th>
            <th>Package Name</th>
            <th>Booking Date</th>
            <th>Booking Time</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            // Query for all pending bookings
            String queryBookings = "SELECT b.Booking_ID, p.Patient_FName || ' ' || p.Patient_LName AS PatientName, " +
                                   "pk.Package_Name, b.Booking_Date, b.Booking_Time, b.Status " +
                                   "FROM Booking b " +
                                   "JOIN Patient p ON b.Patient_ID = p.Patient_ID " +
                                   "JOIN Package pk ON b.Package_ID = pk.Package_ID " +
                                   "WHERE b.Status = 'Pending'";

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
            <td><%= rsBookings.getString("Status") %></td>
            <td>
                <form action="ApproveBookingServlet" method="POST">
                    <input type="hidden" name="bookingID" value="<%= rsBookings.getInt("Booking_ID") %>">
                    <button type="submit" name="action" value="Approve">Approve</button>
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
    
    <hr>
   <h3>Accepted Bookings</h3>
<table border="1">
    <tr>
        <th>Booking ID</th>
        <th>Nurse Name</th>
        <th>Patient Name</th>
        <th>Package</th>
        <th>Booking Date</th>
        <th>Booking Time</th>
    </tr>
    <%
        String queryAcceptedBookings = 
            "SELECT b.Booking_ID, e.Emp_Name AS NurseName, " +
            "p.Patient_FName || ' ' || p.Patient_LName AS PatientName, " +
            "pk.Package_Name, b.Booking_Date, b.Booking_Time " +
            "FROM Booking b " +
            "JOIN Employee e ON b.emp_id = e.Emp_ID " +
            "JOIN Patient p ON b.Patient_ID = p.Patient_ID " +
            "JOIN Package pk ON b.Package_ID = pk.Package_ID " +
            "WHERE b.Status = 'Accept'";

        PreparedStatement stmtAcceptedBookings = conn.prepareStatement(queryAcceptedBookings);
        ResultSet rsAcceptedBookings = stmtAcceptedBookings.executeQuery();

        while (rsAcceptedBookings.next()) {
    %>
    <tr>
        <td><%= rsAcceptedBookings.getInt("Booking_ID") %></td>
        <td><%= rsAcceptedBookings.getString("NurseName") %></td>
        <td><%= rsAcceptedBookings.getString("PatientName") %></td>
        <td><%= rsAcceptedBookings.getString("Package_Name") %></td>
        <td><%= rsAcceptedBookings.getDate("Booking_Date") %></td>
        <td><%= rsAcceptedBookings.getTime("Booking_Time") %></td>
    </tr>
    <% 
        }
        rsAcceptedBookings.close();
        stmtAcceptedBookings.close();
    %>
</table>



    
    
    <hr>
    
    <!-- Package Management Section -->
    <h3>Package Management</h3>
    <table border="1">
        <tr>
            <th>Package ID</th>
            <th>Package Name</th>
            <th>Description</th>
            <th>Price</th>
             <th>Nurse Name</th> <!-- New Column for Nurse Name -->
            <th>Action</th>
        </tr>
        <%
            // Query for packages
            String queryPackages = "SELECT p.Package_ID, p.Package_Name, p.Package_Description, p.Package_Price, e.emp_Name " +
                               "FROM Package p " +
                               "LEFT JOIN Employee e ON p.emp_id = e.emp_ID";
            PreparedStatement stmtPackages = conn.prepareStatement(queryPackages);
            ResultSet rsPackages = stmtPackages.executeQuery();

            while (rsPackages.next()) {
        %>
        <tr>
            <td><%= rsPackages.getInt("Package_ID") %></td>
            <td><%= rsPackages.getString("Package_Name") %></td>
            <td><%= rsPackages.getString("Package_Description") %></td>
            <td><%= rsPackages.getDouble("Package_Price") %></td>
            <td><%= rsPackages.getString("emp_Name") != null ? rsPackages.getString("emp_Name") : "No nurse assigned" %></td> <!-- Nurse Name -->
            <td>
                <form action="EditPackageServlet" method="POST">
    <!-- Action parameter to specify "Edit" -->
    <input type="hidden" name="action" value="Edit">
    <input type="hidden" name="packageID" value="<%= rsPackages.getInt("Package_ID") %>">
    <button type="submit">Edit</button>
</form>
            </td>
        </tr>
        <% 
            }
            rsPackages.close();
            stmtPackages.close();
        %>
    </table>

    <hr>

    <!-- Reports and Statistics Section -->
    <h3>Reports and Statistics</h3>
    <%
        // Query for total bookings and revenue
        String queryStats = "SELECT COUNT(*) AS TotalBookings, SUM(pk.Package_Price) AS TotalRevenue " +
                            "FROM Booking b " +
                            "JOIN Package pk ON b.Package_ID = pk.Package_ID";

        PreparedStatement stmtStats = conn.prepareStatement(queryStats);
        ResultSet rsStats = stmtStats.executeQuery();

        if (rsStats.next()) {
    %>
    <p>Total Bookings: <%= rsStats.getInt("TotalBookings") %></p>
    <p>Total Revenue: $<%= rsStats.getDouble("TotalRevenue") %></p>
    <% 
        }
        rsStats.close();
        stmtStats.close();
        conn.close();
    %>

    <hr>

    <!-- Admin Profile Settings -->
    <h3>Admin Profile Settings</h3>
    <form action="UpdateAdminProfileServlet" method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <button type="submit">Update Profile</button>
    </form>
    
    <hr>

    <!-- Logout -->
    <form action="LogoutServlet" method="POST">
        <button type="submit">Logout</button>
    </form>

</body>
</html>

