<%-- --%>
    Document   : adminDashboard
    Created on : Dec 29, 2024, 9:01:29 PM
    Author     : adamh


<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f8f9fa;
        }

        h2, h3 {
            color: #007bff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #ffffff;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #dee2e6;
        }

        th {
            background-color: #007bff;
            color: #ffffff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        button {
            padding: 5px 10px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        form {
            display: inline;
        }

        hr {
            border: none;
            border-top: 2px solid #007bff;
            margin: 20px 0;
        }

        .logout-button {
            padding: 10px 15px;
            background-color: #dc3545;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .logout-button:hover {
            background-color: #bd2130;
        }

        input[type="text"], input[type="password"] {
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ced4da;
            border-radius: 4px;
            width: 100%;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: inline-block;
        }
    </style>
</head>
<body>
    <h2>Admin Dashboard</h2>

    <!-- Section for Nurse Approvals -->
    <h3>Pending Nurse Approvals</h3>
    <table>
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
    <table>
        <tr>
            <th>Booking ID</th>
            <th>Patient Name</th>
            <th>Package Name</th>
            <th>Booking Date</th>
            <th>Booking Time</th>
            <th>Status</th>
        </tr>
        <%
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
        </tr>
        <% 
            }
            rsBookings.close();
            stmtBookings.close();
        %>
    </table>

    <hr>

    <!-- Section for Accepted Bookings -->
    <h3>Accepted Bookings</h3>
    <table>
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
                "p.Patient_FName, p.Patient_LName, pk.Package_Name, " +
                "b.Booking_Date, b.Booking_Time " +
                "FROM Booking b " +
                "LEFT JOIN Employee e ON b.emp_id = e.Emp_ID " +
                "LEFT JOIN Patient p ON b.Patient_ID = p.Patient_ID " +
                "LEFT JOIN Package pk ON b.Package_ID = pk.Package_ID " +
                "WHERE b.Status = 'Accept'";

            PreparedStatement stmtAcceptedBookings = conn.prepareStatement(queryAcceptedBookings);
            ResultSet rsAcceptedBookings = stmtAcceptedBookings.executeQuery();

            while (rsAcceptedBookings.next()) {
        %>
        <tr>
            <td><%= rsAcceptedBookings.getInt("Booking_ID") %></td>
            <td><%= rsAcceptedBookings.getString("NurseName") != null ? rsAcceptedBookings.getString("NurseName") : "N/A" %></td>
            <td><%= (rsAcceptedBookings.getString("Patient_FName") != null ? rsAcceptedBookings.getString("Patient_FName") : "") + 
                     " " + (rsAcceptedBookings.getString("Patient_LName") != null ? rsAcceptedBookings.getString("Patient_LName") : "") %></td>
            <td><%= rsAcceptedBookings.getString("Package_Name") != null ? rsAcceptedBookings.getString("Package_Name") : "N/A" %></td>
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

    <!-- Package Management -->
    <h3>Package Management</h3>
    <table>
        <tr>
            <th>Package ID</th>
            <th>Package Name</th>
            <th>Description</th>
            <th>Price</th>
            <!--<th>Nurse Name</th>-->
            <th>Action</th>
        </tr>
        <%
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
            <%-- <td><%= rsPackages.getString("emp_Name") != null ? rsPackages.getString("emp_Name") : "No nurse assigned" %></td>--%>
            <td>
                <form action="EditPackageServlet" method="POST">
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

    <!-- Reports and Statistics -->
    <h3>Reports and Statistics</h3>
    <%
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
        <button type="submit" class="logout-button">Logout</button>
    </form>

</body>
</html>




<%--
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        /* Header Styles */
        .header {
            background-color: #5e2a8c; /* Purple-ish */
            color: white;
            padding: 15px 20px;
            text-align: left;
        }

        .header-right {
            float: right;
        }

        .update-profile-btn, .logout-btn {
            background-color: #7f39b3; /* Lighter purple */
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin: 5px;
        }

        .update-profile-btn:hover, .logout-btn:hover {
            background-color: #9b4bcd;
        }

        /* Dropdown Menu Styles */
        .dropdown {
            position: relative;
            display: inline-block;
            margin-top: 10px;
        }

        .dropdown-btn {
            background-color: #7f39b3; /* Lighter purple */
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            width: 200px;
            text-align: left;
        }

        .dropdown-btn:hover {
            background-color: #9b4bcd;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 200px;
            box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
            z-index: 1;
            border: 1px solid #ddd;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Statistics Box */
        .statistics {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .stat-box {
            background-color: white;
            border: 1px solid #ddd;
            padding: 20px;
            text-align: center;
            width: 23%;
        }

        .stat-box h3 {
            margin: 0 0 10px;
        }

        .stat-box p {
            font-size: 18px;
            font-weight: bold;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Button to toggle sections visibility */
        .toggle-btn {
            background-color: #7f39b3; /* Lighter purple */
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin: 5px;
        }

        .toggle-btn:hover {
            background-color: #9b4bcd;
        }

        /* Hidden Sections */
        .hidden {
            display: none;
        }

        /* Responsive Styling */
        @media (max-width: 768px) {
            .statistics {
                flex-direction: column;
                align-items: center;
            }

            .stat-box {
                width: 80%;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>

    <div class="header">
        <h2>Admin Dashboard</h2>
        <div class="header-right">
            <button class="update-profile-btn">Update Profile</button>
            <button class="logout-btn">Logout</button>
        </div>
    </div>

    <!-- Total Customers, Nurses, and Appointments -->
    <div class="statistics">
        <div class="stat-box">
            <h3>Total Customers</h3>
            <p>
                <% 
                    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");
                    String queryCustomers = "SELECT COUNT(*) AS TotalCustomers FROM Patient";
                    PreparedStatement stmtCustomers = conn.prepareStatement(queryCustomers);
                    ResultSet rsCustomers = stmtCustomers.executeQuery();
                    if (rsCustomers.next()) {
                %>
                <%= rsCustomers.getInt("TotalCustomers") %>
                <% 
                    }
                    rsCustomers.close();
                    stmtCustomers.close();
                %>
            </p>
        </div>
        <div class="stat-box">
            <h3>Total Nurses</h3>
            <p>
                <% 
                    String queryNurses = "SELECT COUNT(*) AS TotalNurses FROM Employee WHERE Emp_Role = 'Nurse'";
                    PreparedStatement stmtNurses = conn.prepareStatement(queryNurses);
                    ResultSet rsNurses = stmtNurses.executeQuery();
                    if (rsNurses.next()) {
                %>
                <%= rsNurses.getInt("TotalNurses") %>
                <% 
                    }
                    rsNurses.close();
                    stmtNurses.close();
                %>
            </p>
        </div>
        <div class="stat-box">
            <h3>Total Appointments</h3>
            <p>
                <% 
                    String queryAppointments = "SELECT COUNT(*) AS TotalAppointments FROM Booking";
                    PreparedStatement stmtAppointments = conn.prepareStatement(queryAppointments);
                    ResultSet rsAppointments = stmtAppointments.executeQuery();
                    if (rsAppointments.next()) {
                %>
                <%= rsAppointments.getInt("TotalAppointments") %>
                <% 
                    }
                    rsAppointments.close();
                    stmtAppointments.close();
                %>
            </p>
        </div>
        <div class="stat-box">
            <h3>Total Revenue</h3>
            <p>
                <% 
                    String queryStats = "SELECT SUM(pk.Package_Price) AS TotalRevenue FROM Booking b JOIN Package pk ON b.Package_ID = pk.Package_ID";
                    PreparedStatement stmtStats = conn.prepareStatement(queryStats);
                    ResultSet rsStats = stmtStats.executeQuery();
                    if (rsStats.next()) {
                %>
                $<%= rsStats.getDouble("TotalRevenue") %>
                <% 
                    }
                    rsStats.close();
                    stmtStats.close();
                    conn.close();
                %>
            </p>
        </div>
    </div>

    <hr>

    <!-- Pending Nurse Approvals -->
    <div class="dropdown">
        <button class="dropdown-btn">Pending Nurse Approvals</button>
        <div class="dropdown-content hidden">
            <button class="toggle-btn" onclick="toggleSection('nurseApproval')">View</button>
            <div id="nurseApproval" class="hidden">
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Gender</th>
                        <th>Action</th>
                    </tr>
                    <% 
                        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");

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
            </div>
        </div>
    </div>

    <!-- Pending Bookings -->
    <div class="dropdown">
        <button class="dropdown-btn">Pending Bookings</button>
        <div class="dropdown-content hidden">
            <button class="toggle-btn" onclick="toggleSection('pendingBookings')">View</button>
            <div id="pendingBookings" class="hidden">
                <!-- Content for Pending Bookings (table, etc.) -->
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
            </div>
        </div>
    </div>

    <!-- Accepted Bookings -->
    <div class="dropdown">
        <button class="dropdown-btn">Accepted Bookings</button>
        <div class="dropdown-content hidden">
            <button class="toggle-btn" onclick="toggleSection('acceptedBookings')">View</button>
            <div id="acceptedBookings" class="hidden">
                <!-- Content for Accepted Bookings (table, etc.) -->
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

            </div>
        </div>
    </div>

    <!-- Package Management -->
    <div class="dropdown">
        <button class="dropdown-btn">Package Management</button>
        <div class="dropdown-content hidden">
            <button class="toggle-btn" onclick="toggleSection('packageManagement')">View</button>
            <div id="packageManagement" class="hidden">
                <!-- Content for Package Management (table, etc.) -->
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
            </div>
        </div>
    </div>

    <script>
        function toggleSection(sectionId) {
            var section = document.getElementById(sectionId);
            if (section.style.display === "none" || section.style.display === "") {
                section.style.display = "block";
            } else {
                section.style.display = "none";
            }
        }
    </script>

</body>
</html>

--%>