<%-- 
    Document   : login
    Created on : Dec 28, 2024, 9:06:14 PM
    Author     : adamh
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Login | SeniorCareConnect</title>
    <style>
        /* General Styles */
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
            background-image: url("image/login.jpg");
            background-size: cover;
            background-position: center;
            filter: blur(8px);
            z-index: 1; /* Behind the content */
        }

        .container {
            position: relative; /* Position relative to allow z-index */
            max-width: 500px;
            width: 90%;
            padding: 30px;
            background-color: #d8c8b7; /* Soft cream background */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border: 4px solid #c1a28b; /* Light brown border */
            z-index: 2; /* Above the background */
        }

        h2 {
            text-align: center;
            color: #5c4033; /* Dark brown for heading */
            font-size: 1.8em;
        }

        /* Form Styles */
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

        .alert {
            color: #f44336; /* Red for error messages */
            font-weight: bold;
            margin-top: 20px;
        }

        a {
            text-decoration: none;
            font-weight: bold;
            color: #3b8d99; /* Soft teal for links */
        }

        a:hover {
            color: #1d6b77; /* Darker teal on hover */
        }
    </style>
</head>
<body>
    <div class="background"></div>
    <div class="container">
        <h2>Patient Login</h2>

        <% 
            // Invalidate the session to ensure clean login
            if (session != null) {
                session.invalidate();
            }
        %>

        <form action="LoginPatientServlet" method="POST">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required />
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required />
            </div>

            <button type="submit">Login</button>
        </form>

        <div class="alert">
            <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
        </div>

        <p>Don't have an account? <a href="register.jsp">Register here</a>.</p>
    </div>
</body>
</html>

