<%-- 
    Document   : employeeRegister
    Created on : Dec 30, 2024, 4:43:53 PM
    Author     : adamh
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee Registration | SeniorCareConnect</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f1e1; /* Light soft brown background */
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
            margin: 0 auto;
            padding: 30px;
            background-color: #d8c8b7; /* Soft cream background */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border: 4px solid #c1a28b; /* Light brown border */
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

        input, select {
            padding: 12px;
            border: 2px solid #c1a28b; /* Soft brown solid border */
            border-radius: 6px;
            font-size: 16px;
            width: 100%;
            background-color: #fff7e6; /* Very light brown/cream background for input fields */
            color: #3e2723; /* Darker brown for text */
            box-sizing: border-box;
        }

        input:focus, select:focus {
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
    <div class="container">
        <h1>Register Employee</h1>
        <form action="EmployeeRegisterServlet" method="POST">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="role">Role:</label>
                <select id="role" name="role">
                    <option value="Nurse">Nurse</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>

            <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender" name="gender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
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