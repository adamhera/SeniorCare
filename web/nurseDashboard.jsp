<%-- 
    Document   : nurseDashboard
    Created on : Dec 28, 2024, 9:20:15 PM
    Author     : adamh
--%>

<%@page import="com.seniorcare.model.NurseInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.seniorcare.model.Booking"%>
<%@page import="dao.BookingDAO"%>
<%@page import="dao.NurseInfoDao"%> <!-- Import the NurseInfoDao -->
<%@page session="true" %>

<%
    if (session.getAttribute("employeeID") == null) {
        response.sendRedirect("employeeLogin.jsp");
        return;
    }

    // Fetch pending bookings using the DAO
    BookingDAO bookingDao = new BookingDAO();
    List<Booking> bookings = bookingDao.getPendingBookings();

    // Get the emp_id from session to fetch nurse details
    Integer empId = (Integer) session.getAttribute("employeeId"); // Assuming empId is stored in session

    // Fetch nurse information from the database using the empId
    NurseInfoDao nurseInfoDao = new NurseInfoDao();
    NurseInfo nurseInfo = nurseInfoDao.getNurseInfoById(empId);
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
    <p><strong>Certification:</strong> <%= nurseInfo.getNurseCertification() %></p>
    <p><strong>Shift:</strong> <%= nurseInfo.getNurseShift() %></p>

    <form action="UpdateNurseInfoServlet" method="POST">
        <button type="submit">Edit My Information</button>
    </form>

    <!-- Pending Bookings Section -->
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

    <form action="LogoutServlet" method="POST">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
