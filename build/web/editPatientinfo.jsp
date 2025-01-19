<%-- 
    Document   : editPatientinfo
    Created on : Jan 6, 2025, 11:25:36 PM
    Author     : adamh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    if (session.getAttribute("patientID") == null) {
        response.sendRedirect("patientLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Patient Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1e8e3 ;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-size: 1.1em;
            color: #333;
        }

        input[type="text"], input[type="email"], input[type="password"] {
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
            background-color: white ;
        }

        input[type="submit"] {
            background-color: #735445;
            color: white;
            padding: 12px 20px;
            font-size: 1.1em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #735445;
        }

        small {
            font-size: 0.9em;
            color: #777;
        }

        .message {
            text-align: center;
            font-weight: bold;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button-container input {
            width: 48%;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Edit Your Information</h2>
    <form action="EditPatientInfoServlet" method="POST">
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" value="<%= session.getAttribute("patientFirstName") %>" required><br>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" value="<%= session.getAttribute("patientLastName") %>" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= session.getAttribute("patientEmail") %>" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br>
        <small>(Leave blank if you don't want to change it)</small><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%= session.getAttribute("patientAddress") %>" required><br>

        <input type="submit" value="Update"><br>
    </form>

    <div>
        <!-- Button to go back to patient dashboard -->
        <form action="patientDasboard.jsp" method="GET">
            <input type="submit" value="Back to Dashboard">
        </form>
    </div>

    <!-- Display error or success messages -->
    <div class="message">
        <p class="error"><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %></p>
        <p class="success"><%= request.getAttribute("successMessage") != null ? request.getAttribute("successMessage") : "" %></p>
    </div>
</div>

</body>
</html>