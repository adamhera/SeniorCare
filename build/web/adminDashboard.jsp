<%-- 
    Document   : adminDashboard
    Created on : Dec 29, 2024, 9:01:29 PM
    Author     : adamh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h2>Admin Dashboard</h2>

    <!-- Section for Pending Nurse Approvals -->
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

    <!-- Section for Patient List and Their Bookings -->
    <h3>List of Patients and Their Bookings</h3>
    <table border="1">
        <tr>
            <th>Patient ID</th>
            <th>Patient Name</th>
            <th>Package Name</th>
            <th>Package Description</th>
        </tr>
        <%
            // Query for patients and their package bookings
            String queryPatients = "SELECT p.Patient_ID, " +
                       "p.Patient_FName || ' ' || p.Patient_LName AS PatientName, " +
                       "pk.Package_Name, pk.Package_Description " +
                       "FROM Patient p " +
                       "JOIN Booking b ON p.Patient_ID = b.Patient_ID " +
                       "JOIN Package pk ON b.Package_ID = pk.Package_ID";

            PreparedStatement stmtPatients = conn.prepareStatement(queryPatients);
            ResultSet rsPatients = stmtPatients.executeQuery();

            while (rsPatients.next()) {
        %>
        <tr>
            <td><%= rsPatients.getInt("Patient_ID") %></td>
            <td><%= rsPatients.getString("PatientName") %></td>
            <td><%= rsPatients.getString("Package_Name") %></td>
            <td><%= rsPatients.getString("Package_Description") %></td>
        </tr>
        <% 
            }
            rsPatients.close();
            stmtPatients.close();
        %>
    </table>

    <hr>

    <!-- Booking Management Section -->
    <h3>Booking Management</h3>
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
            // Query for all bookings
            String queryBookings = "SELECT b.Booking_ID, p.Patient_FName || ' ' || p.Patient_LName AS PatientName, " +
                                   "pk.Package_Name, b.Booking_Date, b.Booking_Time " +
                                   "FROM Booking b " +
                                   "JOIN Patient p ON b.Patient_ID = p.Patient_ID " +
                                   "JOIN Package pk ON b.Package_ID = pk.Package_ID";

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
                <form action="CancelRescheduleServlet" method="POST">
                    <input type="hidden" name="bookingID" value="<%= rsBookings.getInt("Booking_ID") %>">
                    <button type="submit" name="action" value="Cancel">Cancel</button>
                    <button type="submit" name="action" value="Reschedule">Reschedule</button>
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

    <!-- Package Management Section -->
    <h3>Package Management</h3>
    <table border="1">
        <tr>
            <th>Package ID</th>
            <th>Package Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        <%
            // Query for packages
            String queryPackages = "SELECT * FROM Package";
            PreparedStatement stmtPackages = conn.prepareStatement(queryPackages);
            ResultSet rsPackages = stmtPackages.executeQuery();

            while (rsPackages.next()) {
        %>
        <tr>
            <td><%= rsPackages.getInt("Package_ID") %></td>
            <td><%= rsPackages.getString("Package_Name") %></td>
            <td><%= rsPackages.getString("Package_Description") %></td>
            <td><%= rsPackages.getDouble("Package_Price") %></td>
            <td>
                <form action="EditDeletePackageServlet" method="POST">
                    <input type="hidden" name="packageID" value="<%= rsPackages.getInt("Package_ID") %>">
                    <button type="submit" name="action" value="Edit">Edit</button>
                    <button type="submit" name="action" value="Delete">Delete</button>
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

    <!-- Reports and Statistics -->
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
</body>
</html>
