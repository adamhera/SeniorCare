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
    <title>Patient Registration</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9; /* Light neutral background */
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Full viewport height */
  }

  .container {
    max-width: 600px; /* Increased width */
    width: 90%; /* Responsive design for smaller screens */
    margin: 0 auto;
    padding: 30px;
    background-color: #ffeaa7; /* Soft sunny yellow */
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* More pronounced shadow */
    border: 4px solid #ffab91; /* Peachy border */
  }

  h1 {
    text-align: center;
    color: #555; /* Medium gray for text */
    font-size: 1.8em; /* Slightly larger font */
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
    color: #ff6f61; /* Warm coral for labels */
  }

  input {
    padding: 12px;
    border: 2px solid #ffab91; /* Peachy solid border */
    border-radius: 6px;
    font-size: 16px;
    width: 100%;
    background-color: #fff3e0; /* Soft creamy background */
    color: #333; /* Dark text for readability */
    box-sizing: border-box;
  }

  input:focus {
    outline: none;
    border-color: #ff6f61; /* Coral border on focus */
    box-shadow: 0 0 8px rgba(255, 111, 97, 0.5); /* Soft glow */
  }

  button {
    padding: 12px;
    background-color: #81c784; /* Calm green */
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
  }

  button:hover {
    background-color: #66bb6a; /* Slightly darker green */
  }
</style>
</head>
<body>
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
