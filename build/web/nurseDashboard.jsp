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
    <title>Nurse Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        h2, h3 {
            color: #2c3e50;
        }

        a {
            color: #3498db;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        header {
            background-color: #2c3e50;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header a {
            color: #fff;
            font-size: 14px;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .info {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #ecf0f1;
            border-left: 4px solid #3498db;
        }

        .btn {
            background-color: #3498db;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #3498db;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .actions button {
            margin-right: 5px;
        }

        .logout-btn {
            display: inline-block;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h2>Nurse Dashboard</h2>
        <a href="LogoutServlet">Logout</a>
    </header>

    <div class="container">
        <!-- Nurse Details Section -->
        <h3>Your Information</h3>
        <div class="info">
            <p><strong>Certification:</strong> <%= nurseInfo != null ? nurseInfo.getNurseCertification() : "Not Available" %></p>
            <p><strong>Shift:</strong> <%= nurseInfo != null ? nurseInfo.getNurseShift() : "Not Available" %></p>
            <p><strong>Selected Package:</strong>
                <%= nurseInfo.getNursePackage() != null && !nurseInfo.getNursePackage().isEmpty() ? nurseInfo.getNursePackage() : "No enrolled package" %>
            </p>
        </div>

        <a href="editNurseInfo.jsp">
            <button class="btn">Edit My Information</button>
        </a>

        <!-- Pending Bookings Section (if nurse has a selected package) -->
        <% if (selectedPackage != null && !selectedPackage.isEmpty()) { %>
            <h3>List of Pending Bookings</h3>
            <table>
                <tr>
                    <th>Booking ID</th>
                    <th>Patient Name</th>
                    <th>Package Name</th>
                    <th>Booking Date</th>
                    <th>Booking Time</th>
                    <th>Action</th>
                </tr>
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
                    <td class="actions">
                        <form action="UpdateBookingStatusServlet" method="POST" style="display:inline;">
                            <input type="hidden" name="bookingID" value="<%= booking.getBookingId() %>">
                            <button class="btn" type="submit" name="action" value="Accept">Accept</button>
                            <button class="btn" type="submit" name="action" value="Reject" style="background-color: #e74c3c;">Reject</button>
                        </form>
                    </td>
                </tr>
                <% 
                    }
                %>
            </table>
        <% } else { %>
            <p>No package selected. Please select a package in the <a href="editNurseInfo.jsp">Edit My Information</a> page.</p>
        <% } %>
        
        <hr>
        
        <!-- Section for Accepted Bookings -->
        <h3>Accepted Bookings</h3>
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Patient Name</th>
                <th>Package</th>
                <th>Booking Date</th>
                <th>Booking Time</th>
            </tr>
            <%
                // Ensure we use the logged-in nurse's emp_id to filter bookings
                String queryAcceptedBookings = 
                    "SELECT b.Booking_ID, " +
                    "p.Patient_FName, p.Patient_LName, pk.Package_Name, " +
                    "b.Booking_Date, b.Booking_Time " +
                    "FROM Booking b " +
                    "LEFT JOIN Patient p ON b.Patient_ID = p.Patient_ID " +
                    "LEFT JOIN Package pk ON b.Package_ID = pk.Package_ID " +
                    "WHERE b.Status = 'Accept' AND b.emp_id = ?";

                try (Connection conn = DBConnection.createConnection();
                     PreparedStatement stmtAcceptedBookings = conn.prepareStatement(queryAcceptedBookings)) {

                    // Set the emp_id for the current nurse
                    stmtAcceptedBookings.setInt(1, empId); // Use the empId from the session
                    ResultSet rsAcceptedBookings = stmtAcceptedBookings.executeQuery();

                    // Iterate through the result set and display accepted bookings
                    while (rsAcceptedBookings.next()) {
            %>
            <tr>
                <td><%= rsAcceptedBookings.getInt("Booking_ID") %></td>
                <td><%= (rsAcceptedBookings.getString("Patient_FName") != null ? rsAcceptedBookings.getString("Patient_FName") : "") + 
                         " " + (rsAcceptedBookings.getString("Patient_LName") != null ? rsAcceptedBookings.getString("Patient_LName") : "") %></td>
                <td><%= rsAcceptedBookings.getString("Package_Name") != null ? rsAcceptedBookings.getString("Package_Name") : "N/A" %></td>
                <td><%= rsAcceptedBookings.getDate("Booking_Date") %></td>
                <td><%= rsAcceptedBookings.getTime("Booking_Time") %></td>
            </tr>
            <%
                    }
                    rsAcceptedBookings.close();
                } catch (Exception e) {
                    e.printStackTrace();
            %>
            <tr>
                <td colspan="5">Error fetching accepted bookings. Please try again later.</td>
            </tr>
            <%
                }
            %>
        </table>

        <!-- Logout button -->
        <form action="LogoutServlet" method="POST" class="logout-btn">
            <button class="btn" type="submit">Logout</button>
        </form>
    </div>
</body>
</html>