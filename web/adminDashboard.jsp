<%-- 

    Document   : adminDashboard
    Created on : Dec 29, 2024, 9:01:29 PM
    Author     : adamh

<%@page import="dao.AdminDAO"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard | SeniorCareConnect</title>
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
            <a href="adminHome.jsp">Home</a>
            <a href="adminDashboard.jsp">Work</a>
            <form action="LogoutServlet" method="POST">
                <button class="btn" style="width: 100%; margin-top: auto;">Logout</button>
            </form>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Pending Nurse Approvals -->
            <div class="card">
                <h3>Pending Employee Approvals</h3>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");
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
                                    <button type="submit" name="action" value="Approve" class="btn">Approve</button>
                                    <button type="submit" name="action" value="Reject" class="btn btn-danger">Reject</button>
                                </form>
                            </td>
                        </tr>
                        <% 
                            }
                            rsPendingNurses.close();
                            stmtPendingNurses.close();
                        %>
                    </tbody>
                </table>
            </div>

            <hr>

            <!-- Pending Bookings -->
            <div class="card">
                <h3>Pending Bookings</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Patient Name</th>
                            <th>Package Name</th>
                            <th>Booking Date</th>
                            <th>Booking Time</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
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
                    </tbody>
                </table>
            </div>

            <hr>

            <!-- Accepted Bookings -->
            <div class="card">
                <h3>Accepted Bookings</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Nurse Name</th>
                            <th>Patient Name</th>
                            <th>Package</th>
                            <th>Booking Date</th>
                            <th>Booking Time</th>
                        </tr>
                    </thead>
                    <tbody>
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
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <hr>

    <!-- Main Content -->
        <div class="main-content">
            <!-- Package Management -->
            <h3>Package Management</h3>
            <table>
                <tr>
                    <th>Package ID</th>
                    <th>Package Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
                <% 
                    
                    String queryPackages = "SELECT p.Package_ID, p.Package_Name, p.Package_Description, p.Package_Price FROM Package p";
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

            <!-- Your Information Section -->
            <h3>Your Information</h3>
            <%
                // Fetch admin's certification from the database using DAO
                AdminDAO adminDAO = new AdminDAO();
                int empID = (int) session.getAttribute("emp_id"); // Assuming empID is stored in session after login
                String certification = adminDAO.getAdminCertification(empID);

                if (certification != null) {
            %>
            <p>Certification: <%= certification %></p>
            <%
                } else {
            %>
            <p>Certification: Not Available</p>
            <%
                }
            %>

            <!-- Button to Edit Admin Info -->
            <form action="editAdminInfo.jsp" method="GET">
                <button type="submit" class="btn">Edit Admin Info</button>
            </form>

            <hr>

            <!-- Delete Rejected Employees -->
            <form action="deleteEmployee.jsp" method="POST">
                <button type="submit" class="btn">Delete Rejected Employees</button>
            </form>

            <hr>

        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Senior Care Connect</p>
    </footer>
</body>
</html>

--%>
<%@page import="dao.AdminDAO"%>

<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.lang.ClassNotFoundException"%>

<!DOCTYPE html>
<html>
<head>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Admin Dashboard | SeniorCareConnect</title>
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
            <a href="adminHome.jsp">Home</a>
            <a href="adminDashboard.jsp">Work</a>
            <form action="LogoutServlet" method="POST">
                <button class="btn" style="width: 100%; margin-top: auto;">Logout</button>
            </form>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Pending Nurse Approvals -->
            <div class="card">
                <h3>Pending Employee Approvals</h3>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>Role</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            Connection conn = null;
                            try {
                                // Load Oracle JDBC Driver
                                Class.forName("oracle.jdbc.driver.OracleDriver");

                                // Connect to Oracle DB
                                String dbURL = "jdbc:oracle:thin:@localhost:1521:xe"; // Update with actual URL, SID, or service name
                                String dbUsername = "SeniorCare";  // Update with actual Oracle DB username
                                String dbPassword = "system";  // Update with actual Oracle DB password

                                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                                // Query to get pending nurses
                                String queryPendingNurses = "SELECT Emp_ID, Emp_Name, Emp_Email, Emp_Gender, Emp_Role FROM Employee WHERE Status = 'Pending'";
                                PreparedStatement stmtPendingNurses = conn.prepareStatement(queryPendingNurses);
                                ResultSet rsPendingNurses = stmtPendingNurses.executeQuery();
                                while (rsPendingNurses.next()) {
                        %>
                        <tr>
                            <td><%= rsPendingNurses.getInt("Emp_ID") %></td>
                            <td><%= rsPendingNurses.getString("Emp_Name") %></td>
                            <td><%= rsPendingNurses.getString("Emp_Email") %></td>
                            <td><%= rsPendingNurses.getString("Emp_Gender") %></td>
                            <td><%= rsPendingNurses.getString("Emp_Role") %></td>
                            <td>
                                <form action="ApproveRejectServlet" method="POST">
                                    <input type="hidden" name="empID" value="<%= rsPendingNurses.getInt("Emp_ID") %>">
                                    <button type="submit" name="action" value="Approve" class="btn">Approve</button>
                                    <button type="submit" name="action" value="Reject" class="btn btn-danger">Reject</button>
                                </form>
                            </td>
                        </tr>
                        <% 
                                }
                                rsPendingNurses.close();
                                stmtPendingNurses.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            } catch (ClassNotFoundException e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    if (conn != null) {
                                        conn.close();
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <hr>

            <!-- Pending Bookings -->
            <div class="card">
                <h3>Pending Bookings</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Patient Name</th>
                            <th>Package Name</th>
                            <th>Booking Date</th>
                            <th>Booking Time</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            Connection connBookings = null;
                            try {
                                // Connect to Oracle DB
                                connBookings = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SeniorCare", "system");

                                // Query to get pending bookings
                                String queryBookings = "SELECT b.Booking_ID, p.Patient_FName || ' ' || p.Patient_LName AS PatientName, " +
                                                       "pk.Package_Name, b.Booking_Date, b.Booking_Time, b.Status " +
                                                       "FROM Booking b " +
                                                       "JOIN Patient p ON b.Patient_ID = p.Patient_ID " +
                                                       "JOIN Package pk ON b.Package_ID = pk.Package_ID " +
                                                       "WHERE b.Status = 'Pending'";

                                PreparedStatement stmtBookings = connBookings.prepareStatement(queryBookings);
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
                            } catch (SQLException e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    if (connBookings != null) {
                                        connBookings.close();
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <hr>

            <!-- Accepted Bookings -->
            <div class="card">
                <h3>Accepted Bookings</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Patient Name</th>
                            <th>Package Name</th>
                            <th>Booking Date</th>
                            <th>Booking Time</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            Connection connAccepted = null;
                            try {
                                connAccepted = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SeniorCare", "system");

                                // Query to get accepted bookings
                                String queryAccepted = "SELECT b.Booking_ID, p.Patient_FName || ' ' || p.Patient_LName AS PatientName, " +
                                                       "pk.Package_Name, b.Booking_Date, b.Booking_Time, b.Status " +
                                                       "FROM Booking b " +
                                                       "JOIN Patient p ON b.Patient_ID = p.Patient_ID " +
                                                       "JOIN Package pk ON b.Package_ID = pk.Package_ID " +
                                                       "WHERE b.Status = 'Accept'";

                                PreparedStatement stmtAccepted = connAccepted.prepareStatement(queryAccepted);
                                ResultSet rsAccepted = stmtAccepted.executeQuery();
                                while (rsAccepted.next()) {
                        %>
                        <tr>
                            <td><%= rsAccepted.getInt("Booking_ID") %></td>
                            <td><%= rsAccepted.getString("PatientName") %></td>
                            <td><%= rsAccepted.getString("Package_Name") %></td>
                            <td><%= rsAccepted.getDate("Booking_Date") %></td>
                            <td><%= rsAccepted.getTime("Booking_Time") %></td>
                            <td><%= rsAccepted.getString("Status") %></td>
                        </tr>
                        <% 
                                }
                                rsAccepted.close();
                                stmtAccepted.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    if (connAccepted != null) {
                                        connAccepted.close();
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
                    
              <!-- Main Content -->
        <div class="main-content">
            <!-- Package Management -->
            <div class="card">
                <h3>Package Management</h3>
                <table>
                    <tr>
                        <th>Package ID</th>
                        <th>Package Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                    <% 
                        Connection connPackages = null;
                        try {
                            // Connect to Oracle DB
                            connPackages = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SeniorCare", "system");

                            // Query to fetch package details
                            String queryPackages = "SELECT p.Package_ID, p.Package_Name, p.Package_Description, p.Package_Price FROM Package p";
                            PreparedStatement stmtPackages = connPackages.prepareStatement(queryPackages);
                            ResultSet rsPackages = stmtPackages.executeQuery();
                            while (rsPackages.next()) {
                    %>
                    <tr>
                        <td><%= rsPackages.getInt("Package_ID") %></td>
                        <td><%= rsPackages.getString("Package_Name") %></td>
                        <td><%= rsPackages.getString("Package_Description") %></td>
                        <td><%= rsPackages.getDouble("Package_Price") %></td>
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
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (connPackages != null) {
                                connPackages.close();
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    %>
                </table>
            </div>

            <hr>

            <!-- Reports and Statistics -->
            <div class="card">
                <h3>Reports and Statistics</h3>
                <%
                    Connection connStats = null;
                    try {
                        // Connect to Oracle DB
                        connStats = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SeniorCare", "system");

                        // Query for statistics
                        String queryStats = "SELECT COUNT(*) AS TotalBookings, SUM(pk.Package_Price) AS TotalRevenue " +
                                            "FROM Booking b " +
                                            "JOIN Package pk ON b.Package_ID = pk.Package_ID";
                        PreparedStatement stmtStats = connStats.prepareStatement(queryStats);
                        ResultSet rsStats = stmtStats.executeQuery();
                        if (rsStats.next()) {
                %>
                <p>Total Bookings: <%= rsStats.getInt("TotalBookings") %></p>
                <p>Total Revenue: $<%= rsStats.getDouble("TotalRevenue") %></p>
                <% 
                    }
                    rsStats.close();
                    stmtStats.close();
                    connStats.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                %>
            </div>
            
            
            
            

            <hr>

            <!-- Your Information Section -->
            <div class="card">
                <h3>Your Information</h3>
                <%
                    // Fetch admin's certification from the database using DAO
                    AdminDAO adminDAO = new AdminDAO();
                    int empID = (int) session.getAttribute("emp_id"); // Assuming empID is stored in session after login
                    String certification = adminDAO.getAdminCertification(empID);

                    if (certification != null) {
                %>
                <p>Certification: <%= certification %></p>
                <%
                    } else {
                %>
                <p>Certification: Not Available</p>
                <%
                    }
                %>

                <!-- Button to Edit Admin Info -->
                <form action="editAdminInfo.jsp" method="GET">
                    <button type="submit" class="btn">Edit Admin Info</button>
                </form>
            </div>

            <hr>

            <!-- Delete Rejected Employees -->
            <div class="card">
                <form action="deleteEmployee.jsp" method="POST">
                    <button type="submit" class="btn">Delete Rejected Employees</button>
                </form>
            </div>

            <hr>       
            
             <canvas id="packageBookingChart" width="400" height="200"></canvas>

             
             
    <%-- The existing Java code to fetch package names and booking counts --%>
    <%
        Connection connGraph = null;
        StringBuilder packageNames = new StringBuilder();
        StringBuilder bookingCounts = new StringBuilder();
        boolean isFirst = true;

        try {
            connGraph = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SeniorCare", "system");

            // Query to get the count of bookings per package
            String queryGraph = "SELECT pk.Package_Name, COUNT(b.Booking_ID) AS BookingCount " +
                                "FROM Booking b " +
                                "JOIN Package pk ON b.Package_ID = pk.Package_ID " +
                                "GROUP BY pk.Package_Name " +
                                "ORDER BY BookingCount DESC";
            PreparedStatement stmtGraph = connGraph.prepareStatement(queryGraph);
            ResultSet rsGraph = stmtGraph.executeQuery();

            while (rsGraph.next()) {
                if (!isFirst) {
                    packageNames.append(", ");
                    bookingCounts.append(", ");
                }
                packageNames.append("'").append(rsGraph.getString("Package_Name")).append("'"); 
                bookingCounts.append(rsGraph.getInt("BookingCount"));
                isFirst = false;
            }

            // Log to confirm data generation
            System.out.println("Package Names: " + packageNames.toString());
            System.out.println("Booking Counts: " + bookingCounts.toString());

            rsGraph.close();
            stmtGraph.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connGraph != null) {
                    connGraph.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const ctx = document.getElementById('packageBookingChart').getContext('2d');

            // Use the Java variables safely within JavaScript
            const packageNames = [<%= packageNames.toString() %>];
            const bookingCounts = [<%= bookingCounts.toString() %>];

            console.log("Package Names:", packageNames);
            console.log("Booking Counts:", bookingCounts);

            // Define an array of colors to assign to each package
            const packageColors = [
                'rgba(54, 162, 235, 0.7)', // Blue for Basic Package
                'rgba(255, 99, 132, 0.7)', // Red for Package A
                'rgba(75, 192, 192, 0.7)', // Green for Package B
                'rgba(153, 102, 255, 0.7)' // Purple for Package D
            ];

            // Map the colors dynamically based on the package names (optional if you want to map specific colors)
            const colors = packageNames.map((pkg, index) => {
                // Example: Custom color logic based on package name (you can tweak this)
                switch(pkg) {
                    case "Basic Package":
                        return 'rgba(54, 162, 235, 0.7)';
                    case "Package A":
                        return 'rgba(255, 99, 132, 0.7)';
                    case "Package B":
                        return 'rgba(75, 192, 192, 0.7)';
                    case "Package C":
                        return 'rgba(153, 102, 255, 0.7)';
                    default:
                        return 'rgba(169, 169, 169, 0.7)'; // Default gray if not recognized
                }
            });

            if (packageNames.length > 0 && bookingCounts.length > 0) {
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: packageNames,
                        datasets: [{
                            label: 'Number of Bookings',
                            data: bookingCounts,
                            backgroundColor: colors, // Assigning colors dynamically
                            borderColor: colors.map(color => color.replace('0.7', '1')), // Matching border color with the background
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                display: true,
                                position: 'top',
                            },
                            tooltip: {
                                callbacks: {
                                    label: function(context) {
                                        return `${context.label}: ${context.raw}`;
                                    }
                                }
                            }
                        },
                        scales: {
                            x: {
                                title: {
                                    display: true,
                                    text: 'Packages'
                                }
                            },
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Number of Bookings'
                                }
                            }
                        }
                    }
                });
            } else {
                console.error("No data available for the chart.");
            }
        });

    </script>

                    
        </div>
    </div>

  
</body>
</html>
