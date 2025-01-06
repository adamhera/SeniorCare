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
            conn.close();
        %>
    </table>
</body>
</html>
