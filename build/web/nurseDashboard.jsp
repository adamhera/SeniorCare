<%-- 
    Document   : nurseDashboard
    Created on : Dec 28, 2024, 9:20:15 PM
    Author     : adamh
--%>

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
</head>
<body>
    <h2>Welcome, <%= session.getAttribute("employeeName") %>!</h2>
    <a href="LogoutServlet">Logout</a>

    <!-- Nurse Details Section -->
    <h3>Your Information</h3>
    <p><strong>Certification:</strong> <%= nurseInfo != null ? nurseInfo.getNurseCertification() : "Not Available" %></p>
    <p><strong>Shift:</strong> <%= nurseInfo != null ? nurseInfo.getNurseShift() : "Not Available" %></p>
    <p><strong>Selected Package:</strong> 
       <%= nurseInfo.getNursePackage() != null && !nurseInfo.getNursePackage().isEmpty() ? nurseInfo.getNursePackage() : "No enrolled package" %>
    </p>
     <!-- Edit My Information Button -->
    <a href="editNurseInfo.jsp">
        <button>Edit My Information</button>
    </a>
    <!-- Pending Bookings Section (if nurse has a selected package) -->
    <% if (selectedPackage != null && !selectedPackage.isEmpty()) { %>
        <h3>List of Pending Bookings</h3>
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
                // Fetch and display bookings matching the nurse's selected package
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
                    <form action="UpdateBookingStatusServlet" method="POST">
                        <input type="hidden" name="bookingID" value="<%= booking.getBookingId() %>">
                        <button type="submit" name="action" value="Accept">Accept</button>
                        <button type="submit" name="action" value="Reject">Reject</button>
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

    <!-- Logout button -->
    <form action="LogoutServlet" method="POST">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
