<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection"%>
<%@page session="true" %>

<%
    // Check if the user is logged in; if not, redirect to login page
    if (session.getAttribute("employeeId") == null) {
        response.sendRedirect("employeeLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>adminHome | SeniorCareConnect</title>
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
            <!-- Vision -->
            <div class="card">
                <h2>Our Vision</h2>
                <p>To be the leading provider of compassionate and comprehensive care for seniors, enhancing their quality of life through innovative services and dedicated support.</p>
            </div>

            <!-- Mission -->
            <div class="card">
                <h2>Our Mission</h2>
                <p>At Senior Care Connect, our mission is to create a nurturing environment for seniors, offering a wide range of activities like knitting, weaving, singing, and more to promote physical, emotional, and social well-being.</p>
            </div>

            <!-- Objectives -->
            <div class="card">
                <h2>Our Objectives</h2>
                <ul>
                    <li>To provide personalized care plans tailored to each senior's needs and preferences.</li>
                    <li>To foster a community where seniors feel valued, respected, and engaged.</li>
                    <li>To offer a diverse range of recreational and therapeutic activities.</li>
                    <li>To ensure the safety, dignity, and independence of every individual in our care.</li>
                </ul>
            </div>
        </div>
    </div>

    <footer>
        © 2025 Senior Care Connect. All Rights Reserved.
    </footer>
</body>
</html>
