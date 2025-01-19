<%-- 
    Document   : register
    Created on : Dec 28, 2024, 4:47:18 PM
    Author     : adamh


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Registration</title>
</head>
<body>
    <h1>Register Patient</h1>
    <form action="RegisterPatientServlet" method="post">
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" required><br><br>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" required><br><br>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required><br><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Register">
    </form>
</body>
</html>

--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Registration | SeniorCareConnect</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            overflow: hidden; /* Prevent scrolling */
        }

        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url("image/login.jpg"); /* Your background image */
            background-size: cover;
            background-position: center;
            filter: blur(8px);
            z-index: 1; /* Behind the content */
        }

        .container {
            position: relative;
            max-width: 600px;
            width: 90%;
            padding: 30px;
            background-color: #d8c8b7; /* Soft cream background */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border: 4px solid #c1a28b; /* Light brown border */
            z-index: 2; /* Above the background */
        }

        h1 {
            text-align: center;
            color: #5c4033; /* Dark brown for heading */
            font-size: 1.8em;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #4a3c2b; /* Rich brown for labels */
        }

        input {
            padding: 12px;
            border: 2px solid #c1a28b; /* Soft brown solid border */
            border-radius: 6px;
            font-size: 16px;
            width: 100%;
            background-color: #fff7e6; /* Very light brown/cream background for input fields */
            color: #3e2723; /* Darker brown for text */
            box-sizing: border-box;
        }

        input:focus {
            outline: none;
            border-color: #8e735b; /* Slightly darker brown on focus */
            box-shadow: 0 0 8px rgba(139, 69, 19, 0.5); /* Soft brown glow */
        }

        button {
            padding: 12px;
            background-color: #735445; /* Light brown */
            color: #fff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #c2a68c; /* Slightly darker brown */
        }
    </style>
</head>
<body>
    <div class="background"></div>
    <div class="container">
        <h1>Register Patient</h1>
        <form action="RegisterPatientServlet" method="post">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required>
            </div>

            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>

            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>