<%-- 
    Document   : pendingApproval
    Created on : Jan 5, 2025, 11:01:16 PM
    Author     : adamh
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Pending</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9; /* Light neutral background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            max-width: 600px;
            width: 90%;
            padding: 30px;
            background-color: #d8c8b7; /* Soft cream background */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border: 4px solid #c1a28b; /* Light brown border */
            text-align: center;
        }

        h2 {
            color: #5c4033; /* Dark brown for heading */
            font-size: 2em;
        }

        p {
            color: #4a3c2b; /* Rich brown for paragraph text */
            font-size: 1.2em;
            margin: 20px 0;
        }

        a {
            color: #fff;
            background-color: #735445; /* Light brown for the link */
            font-size: 1.1em;
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #c2a68c; /* Slightly darker brown on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registration Pending</h2>
        <p>Your registration is pending approval from the admin. Please wait until it is reviewed.</p>
        <a href="home.jsp">Return to Homepage</a>
    </div>
</body>
</html>

