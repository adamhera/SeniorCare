package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dao.AdminDAO;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.lang.ClassNotFoundException;

public final class adminDashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("      <script src=\"https://cdn.jsdelivr.net/npm/chart.js\"></script>\n");
      out.write("    <title>Admin Dashboard | SeniorCareConnect</title>\n");
      out.write("    <style>\n");
      out.write("        /* Global Styles */\n");
      out.write("        body {\n");
      out.write("            font-family: 'Arial', sans-serif;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            background-color: #f4f0eb; /* Light cream */\n");
      out.write("            color: #4a3c2b; /* Rich brown */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h1, h2, h3 {\n");
      out.write("            margin: 0;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        a {\n");
      out.write("            text-decoration: none;\n");
      out.write("            color: inherit;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Layout */\n");
      out.write("        .dashboard {\n");
      out.write("            display: flex;\n");
      out.write("            min-height: 100vh;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .sidebar {\n");
      out.write("            width: 240px;\n");
      out.write("            background-color: #6e4a38; /* Deep brown */\n");
      out.write("            color: white;\n");
      out.write("            padding: 20px;\n");
      out.write("            display: flex;\n");
      out.write("            flex-direction: column;\n");
      out.write("            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .sidebar h1 {\n");
      out.write("            margin-bottom: 30px;\n");
      out.write("            font-size: 22px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .sidebar a {\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("            padding: 10px 15px;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            color: white;\n");
      out.write("            font-size: 16px;\n");
      out.write("            transition: background-color 0.3s;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .sidebar a:hover {\n");
      out.write("            background-color: #563626; /* Slightly darker brown */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .main-content {\n");
      out.write("            flex: 1;\n");
      out.write("            padding: 30px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .card {\n");
      out.write("            background-color: white;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);\n");
      out.write("            padding: 20px;\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .card h3 {\n");
      out.write("            margin-bottom: 15px;\n");
      out.write("            color: #5c4033;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Tables */\n");
      out.write("        table {\n");
      out.write("            width: 100%;\n");
      out.write("            border-collapse: collapse;\n");
      out.write("            margin-top: 15px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        table th, table td {\n");
      out.write("            padding: 10px 15px;\n");
      out.write("            text-align: left;\n");
      out.write("            border: 1px solid #ddd;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        table th {\n");
      out.write("            background-color: #6e4a38; /* Deep brown */\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        table tr:nth-child(even) {\n");
      out.write("            background-color: #f9f5f0;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        table tr:hover {\n");
      out.write("            background-color: #f5e7de; /* Light beige */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Buttons */\n");
      out.write("        .btn {\n");
      out.write("            display: inline-block;\n");
      out.write("            background-color: #735445; /* Medium brown */\n");
      out.write("            color: white;\n");
      out.write("            padding: 8px 15px;\n");
      out.write("            margin-top: 10px;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            text-align: center;\n");
      out.write("            cursor: pointer;\n");
      out.write("            text-decoration: none;\n");
      out.write("            transition: background-color 0.3s;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn:hover {\n");
      out.write("            background-color: #5c4033;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-danger {\n");
      out.write("            background-color: #e74c3c;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-danger:hover {\n");
      out.write("            background-color: #c0392b;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        footer {\n");
      out.write("            margin-top: 20px;\n");
      out.write("            text-align: center;\n");
      out.write("            padding: 10px;\n");
      out.write("            background-color: #6e4a38;\n");
      out.write("            color: white;\n");
      out.write("            border-radius: 8px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"dashboard\">\n");
      out.write("        <!-- Sidebar -->\n");
      out.write("        <div class=\"sidebar\">\n");
      out.write("            <h1>Senior Care Connect</h1>\n");
      out.write("            <a href=\"adminHome.jsp\">Home</a>\n");
      out.write("            <a href=\"adminDashboard.jsp\">Work</a>\n");
      out.write("            <form action=\"LogoutServlet\" method=\"POST\">\n");
      out.write("                <button class=\"btn\" style=\"width: 100%; margin-top: auto;\">Logout</button>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Main Content -->\n");
      out.write("        <div class=\"main-content\">\n");
      out.write("            <!-- Pending Nurse Approvals -->\n");
      out.write("            <div class=\"card\">\n");
      out.write("                <h3>Pending Employee Approvals</h3>\n");
      out.write("                <table>\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>ID</th>\n");
      out.write("                            <th>Name</th>\n");
      out.write("                            <th>Email</th>\n");
      out.write("                            <th>Gender</th>\n");
      out.write("                            <th>Role</th>\n");
      out.write("                            <th>Action</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");
 
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
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>");
      out.print( rsPendingNurses.getInt("Emp_ID") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsPendingNurses.getString("Emp_Name") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsPendingNurses.getString("Emp_Email") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsPendingNurses.getString("Emp_Gender") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsPendingNurses.getString("Emp_Role") );
      out.write("</td>\n");
      out.write("                            <td>\n");
      out.write("                                <form action=\"ApproveRejectServlet\" method=\"POST\">\n");
      out.write("                                    <input type=\"hidden\" name=\"empID\" value=\"");
      out.print( rsPendingNurses.getInt("Emp_ID") );
      out.write("\">\n");
      out.write("                                    <button type=\"submit\" name=\"action\" value=\"Approve\" class=\"btn\">Approve</button>\n");
      out.write("                                    <button type=\"submit\" name=\"action\" value=\"Reject\" class=\"btn btn-danger\">Reject</button>\n");
      out.write("                                </form>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
 
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
                        
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <hr>\n");
      out.write("\n");
      out.write("            <!-- Pending Bookings -->\n");
      out.write("            <div class=\"card\">\n");
      out.write("                <h3>Pending Bookings</h3>\n");
      out.write("                <table>\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Booking ID</th>\n");
      out.write("                            <th>Patient Name</th>\n");
      out.write("                            <th>Package Name</th>\n");
      out.write("                            <th>Booking Date</th>\n");
      out.write("                            <th>Booking Time</th>\n");
      out.write("                            <th>Status</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");
 
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
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>");
      out.print( rsBookings.getInt("Booking_ID") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsBookings.getString("PatientName") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsBookings.getString("Package_Name") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsBookings.getDate("Booking_Date") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsBookings.getTime("Booking_Time") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsBookings.getString("Status") );
      out.write("</td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
 
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
                        
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <hr>\n");
      out.write("\n");
      out.write("            <!-- Accepted Bookings -->\n");
      out.write("            <div class=\"card\">\n");
      out.write("                <h3>Accepted Bookings</h3>\n");
      out.write("                <table>\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Booking ID</th>\n");
      out.write("                            <th>Patient Name</th>\n");
      out.write("                            <th>Package Name</th>\n");
      out.write("                            <th>Booking Date</th>\n");
      out.write("                            <th>Booking Time</th>\n");
      out.write("                            <th>Status</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");
 
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
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>");
      out.print( rsAccepted.getInt("Booking_ID") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsAccepted.getString("PatientName") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsAccepted.getString("Package_Name") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsAccepted.getDate("Booking_Date") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsAccepted.getTime("Booking_Time") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rsAccepted.getString("Status") );
      out.write("</td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
 
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
                        
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("                    \n");
      out.write("              <!-- Main Content -->\n");
      out.write("        <div class=\"main-content\">\n");
      out.write("            <!-- Package Management -->\n");
      out.write("            <div class=\"card\">\n");
      out.write("                <h3>Package Management</h3>\n");
      out.write("                <table>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Package ID</th>\n");
      out.write("                        <th>Package Name</th>\n");
      out.write("                        <th>Description</th>\n");
      out.write("                        <th>Price</th>\n");
      out.write("                        <th>Action</th>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
 
                        Connection connPackages = null;
                        try {
                            // Connect to Oracle DB
                            connPackages = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SeniorCare", "system");

                            // Query to fetch package details
                            String queryPackages = "SELECT p.Package_ID, p.Package_Name, p.Package_Description, p.Package_Price FROM Package p";
                            PreparedStatement stmtPackages = connPackages.prepareStatement(queryPackages);
                            ResultSet rsPackages = stmtPackages.executeQuery();
                            while (rsPackages.next()) {
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( rsPackages.getInt("Package_ID") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rsPackages.getString("Package_Name") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rsPackages.getString("Package_Description") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rsPackages.getDouble("Package_Price") );
      out.write("</td>\n");
      out.write("                        <td>\n");
      out.write("                            <form action=\"EditPackageServlet\" method=\"POST\">\n");
      out.write("                                <input type=\"hidden\" name=\"action\" value=\"Edit\">\n");
      out.write("                                <input type=\"hidden\" name=\"packageID\" value=\"");
      out.print( rsPackages.getInt("Package_ID") );
      out.write("\">\n");
      out.write("                                <button type=\"submit\">Edit</button>\n");
      out.write("                            </form>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
 
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
                    
      out.write("\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <hr>\n");
      out.write("\n");
      out.write("            <!-- Reports and Statistics -->\n");
      out.write("            <div class=\"card\">\n");
      out.write("                <h3>Reports and Statistics</h3>\n");
      out.write("                ");

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
                
      out.write("\n");
      out.write("                <p>Total Bookings: ");
      out.print( rsStats.getInt("TotalBookings") );
      out.write("</p>\n");
      out.write("                <p>Total Revenue: $");
      out.print( rsStats.getDouble("TotalRevenue") );
      out.write("</p>\n");
      out.write("                ");
 
                    }
                    rsStats.close();
                    stmtStats.close();
                    connStats.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("\n");
      out.write("            <hr>\n");
      out.write("\n");
      out.write("            <!-- Your Information Section -->\n");
      out.write("            <div class=\"card\">\n");
      out.write("                <h3>Your Information</h3>\n");
      out.write("                ");

                    // Fetch admin's certification from the database using DAO
                    AdminDAO adminDAO = new AdminDAO();
                    int empID = (int) session.getAttribute("emp_id"); // Assuming empID is stored in session after login
                    String certification = adminDAO.getAdminCertification(empID);

                    if (certification != null) {
                
      out.write("\n");
      out.write("                <p>Certification: ");
      out.print( certification );
      out.write("</p>\n");
      out.write("                ");

                    } else {
                
      out.write("\n");
      out.write("                <p>Certification: Not Available</p>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("\n");
      out.write("                <!-- Button to Edit Admin Info -->\n");
      out.write("                <form action=\"editAdminInfo.jsp\" method=\"GET\">\n");
      out.write("                    <button type=\"submit\" class=\"btn\">Edit Admin Info</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <hr>\n");
      out.write("\n");
      out.write("            <!-- Delete Rejected Employees -->\n");
      out.write("            <div class=\"card\">\n");
      out.write("                <form action=\"deleteEmployee.jsp\" method=\"POST\">\n");
      out.write("                    <button type=\"submit\" class=\"btn\">Delete Rejected Employees</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <hr>       \n");
      out.write("            \n");
      out.write("             <canvas id=\"packageBookingChart\" width=\"400\" height=\"200\"></canvas>\n");
      out.write("\n");
      out.write("             \n");
      out.write("             \n");
      out.write("    ");
      out.write("\n");
      out.write("    ");

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
    
      out.write("\n");
      out.write("\n");
      out.write("    <script>\n");
      out.write("        document.addEventListener(\"DOMContentLoaded\", function() {\n");
      out.write("            const ctx = document.getElementById('packageBookingChart').getContext('2d');\n");
      out.write("\n");
      out.write("            // Use the Java variables safely within JavaScript\n");
      out.write("            const packageNames = [");
      out.print( packageNames.toString() );
      out.write("];\n");
      out.write("            const bookingCounts = [");
      out.print( bookingCounts.toString() );
      out.write("];\n");
      out.write("\n");
      out.write("            console.log(\"Package Names:\", packageNames);\n");
      out.write("            console.log(\"Booking Counts:\", bookingCounts);\n");
      out.write("\n");
      out.write("            // Define an array of colors to assign to each package\n");
      out.write("            const packageColors = [\n");
      out.write("                'rgba(54, 162, 235, 0.7)', // Blue for Basic Package\n");
      out.write("                'rgba(255, 99, 132, 0.7)', // Red for Package A\n");
      out.write("                'rgba(75, 192, 192, 0.7)', // Green for Package B\n");
      out.write("                'rgba(153, 102, 255, 0.7)' // Purple for Package D\n");
      out.write("            ];\n");
      out.write("\n");
      out.write("            // Map the colors dynamically based on the package names (optional if you want to map specific colors)\n");
      out.write("            const colors = packageNames.map((pkg, index) => {\n");
      out.write("                // Example: Custom color logic based on package name (you can tweak this)\n");
      out.write("                switch(pkg) {\n");
      out.write("                    case \"Basic Package\":\n");
      out.write("                        return 'rgba(54, 162, 235, 0.7)';\n");
      out.write("                    case \"Package A\":\n");
      out.write("                        return 'rgba(255, 99, 132, 0.7)';\n");
      out.write("                    case \"Package B\":\n");
      out.write("                        return 'rgba(75, 192, 192, 0.7)';\n");
      out.write("                    case \"Package C\":\n");
      out.write("                        return 'rgba(153, 102, 255, 0.7)';\n");
      out.write("                    default:\n");
      out.write("                        return 'rgba(169, 169, 169, 0.7)'; // Default gray if not recognized\n");
      out.write("                }\n");
      out.write("            });\n");
      out.write("\n");
      out.write("            if (packageNames.length > 0 && bookingCounts.length > 0) {\n");
      out.write("                new Chart(ctx, {\n");
      out.write("                    type: 'bar',\n");
      out.write("                    data: {\n");
      out.write("                        labels: packageNames,\n");
      out.write("                        datasets: [{\n");
      out.write("                            label: 'Number of Bookings',\n");
      out.write("                            data: bookingCounts,\n");
      out.write("                            backgroundColor: colors, // Assigning colors dynamically\n");
      out.write("                            borderColor: colors.map(color => color.replace('0.7', '1')), // Matching border color with the background\n");
      out.write("                            borderWidth: 1\n");
      out.write("                        }]\n");
      out.write("                    },\n");
      out.write("                    options: {\n");
      out.write("                        responsive: true,\n");
      out.write("                        plugins: {\n");
      out.write("                            legend: {\n");
      out.write("                                display: true,\n");
      out.write("                                position: 'top',\n");
      out.write("                            },\n");
      out.write("                            tooltip: {\n");
      out.write("                                callbacks: {\n");
      out.write("                                    label: function(context) {\n");
      out.write("                                        return `");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${context.label}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(':');
      out.write(' ');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${context.raw}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("`;\n");
      out.write("                                    }\n");
      out.write("                                }\n");
      out.write("                            }\n");
      out.write("                        },\n");
      out.write("                        scales: {\n");
      out.write("                            x: {\n");
      out.write("                                title: {\n");
      out.write("                                    display: true,\n");
      out.write("                                    text: 'Packages'\n");
      out.write("                                }\n");
      out.write("                            },\n");
      out.write("                            y: {\n");
      out.write("                                beginAtZero: true,\n");
      out.write("                                title: {\n");
      out.write("                                    display: true,\n");
      out.write("                                    text: 'Number of Bookings'\n");
      out.write("                                }\n");
      out.write("                            }\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("            } else {\n");
      out.write("                console.error(\"No data available for the chart.\");\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("                    \n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("  \n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
