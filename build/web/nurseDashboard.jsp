<%-- 
    Document   : nurseDashboard
    Created on : Dec 28, 2024, 9:20:15 PM
    Author     : adamh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection"%>
<%@page import="com.seniorcare.model.NurseInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.seniorcare.model.Booking"%>
<%@page import="dao.BookingDAO"%>
<%@page import="dao.NurseInfoDao"%>
<%@page import="dao.PackageDAO"%> <!-- Import PackageDAO to fetch packages -->
<%@page session="true" %>

<%
    // Check if the user is logged in; if not, redirect to login page
    if (session.getAttribute("employeeId") == null) {
        response.sendRedirect("employeeLogin.jsp");
        return;
    }

    // Get the emp_id from session to fetch nurse details
    Integer empId = (Integer) session.getAttribute("employeeId");

    // Fetch nurse information from the database using the empId
    NurseInfoDao nurseInfoDao = new NurseInfoDao();
    NurseInfo nurseInfo = nurseInfoDao.getNurseInfoById(empId);
    String selectedPackage = nurseInfo != null ? nurseInfo.getNursePackage() : null; // Handle null case
%>

<!DOCTYPE html>
<html>
<head>
    <title>Nurse Dashboard | SeniorCareConnect</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f0eb; /* Light cream */
            color: #4a3c2b; /* Rich brown */
        }

        h1, h2, h3 {
            margin: 0;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* Layout */
        .dashboard {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 240px;
            background-color: #6e4a38; /* Deep brown */
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar h1 {
            margin-bottom: 30px;
            font-size: 22px;
        }

        .sidebar a {
            margin-bottom: 20px;
            padding: 10px 15px;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover {
            background-color: #563626; /* Slightly darker brown */
        }

        .main-content {
            flex: 1;
            padding: 30px;
        }

        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        .card h3 {
            margin-bottom: 15px;
            color: #5c4033;
        }

        /* Tables */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        table th, table td {
            padding: 10px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #6e4a38; /* Deep brown */
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f5f0;
        }

        table tr:hover {
            background-color: #f5e7de; /* Light beige */
        }

        /* Buttons */
        .btn {
            display: inline-block;
            background-color: #735445; /* Medium brown */
            color: white;
            padding: 8px 15px;
            margin-top: 10px;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #5c4033;
        }

        .btn-danger {
            background-color: #e74c3c;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        footer {
            margin-top: 20px;
            text-align: center;
            padding: 10px;
            background-color: #6e4a38;
            color: white;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <!-- Sidebar -->
        <div class="sidebar">
            <h1>Senior Care Connect</h1>
            <a href="nurseHome.jsp">Home</a>
            <a href="nurseDashboard.jsp">Work</a>
            
            <form action="LogoutServlet" method="POST">
                <button class="btn" style="width: 100%; margin-top: auto;">Logout</button>
            </form>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Nurse Information -->
            <div class="card">
                <h3>Your Information</h3>
                <p><strong>Certification:</strong> <%= nurseInfo != null ? nurseInfo.getNurseCertification() : "Not Available" %></p>
                <p><strong>Shift:</strong> <%= nurseInfo != null ? nurseInfo.getNurseShift() : "Not Available" %></p>
                <p><strong>Selected Package:</strong>
                    <%= selectedPackage != null && !selectedPackage.isEmpty() ? selectedPackage : "No enrolled package" %>
                </p>
                <a href="editNurseInfo.jsp" class="btn">Edit My Information</a>
            </div>

            <!-- Pending Bookings -->
            <% if (selectedPackage != null && !selectedPackage.isEmpty()) { %>
            <div class="card">
                <h3>Pending Bookings</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Patient Name</th>
                            <th>Package</th>
                            <th>Booking Date</th>
                            <th>Booking Time</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            BookingDAO bookingDao = new BookingDAO();
                            List<Booking> bookings = bookingDao.getPendingBookingsByPackage(selectedPackage);
                            for (Booking booking : bookings) {
                        %>
                        <tr>
                            <td><%= booking.getBookingId() %></td>
                            <td><%= booking.getPatientName() %></td>
                            <td><%= booking.getPackageName() %></td>
                            <td><%= booking.getBookingDate() %></td>
                            <td><%= booking.getBookingTime() %></td>
                            <td>
                                <form action="UpdateBookingStatusServlet" method="POST" style="display:inline;">
                                    <input type="hidden" name="bookingID" value="<%= booking.getBookingId() %>">
                                    <button class="btn" name="action" value="Accept">Accept</button>
                                    <button class="btn btn-danger" name="action" value="Reject">Reject</button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <% } else { %>
            <div class="card">
                <h3>Pending Bookings</h3>
                <p>No package selected. Please update your information on the <a href="editNurseInfo.jsp">Edit My Information</a> page.</p>
            </div>
            <% } %>

            <!-- Accepted Bookings -->
            <div class="card">
                <h3>Accepted Bookings</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Patient Name</th>
                            <th>Package</th>
                            <th>Booking Date</th>
                            <th>Booking Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            String queryAcceptedBookings = "SELECT b.Booking_ID, p.Patient_FName, p.Patient_LName, pk.Package_Name, b.Booking_Date, b.Booking_Time FROM Booking b LEFT JOIN Patient p ON b.Patient_ID = p.Patient_ID LEFT JOIN Package pk ON b.Package_ID = pk.Package_ID WHERE b.Status = 'Accept' AND b.emp_id = ?";
                            try (Connection conn = DBConnection.createConnection();
                                 PreparedStatement stmt = conn.prepareStatement(queryAcceptedBookings)) {
                                stmt.setInt(1, empId);
                                ResultSet rs = stmt.executeQuery();
                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("Booking_ID") %></td>
                            <td><%= rs.getString("Patient_FName") + " " + rs.getString("Patient_LName") %></td>
                            <td><%= rs.getString("Package_Name") %></td>
                            <td><%= rs.getDate("Booking_Date") %></td>
                            <td><%= rs.getTime("Booking_Time") %></td>
                        </tr>
                        <% }
                            } catch (Exception e) { %>
                        <tr>
                            <td colspan="5">Error fetching data.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <footer>
        ? 2025 Senior Care Connect. All Rights Reserved.
    </footer>
</body>
</html>
