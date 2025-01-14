<%-- 
    Document   : login
    Created on : Dec 28, 2024, 9:06:14 PM
    Author     : adamh

<!DOCTYPE html>
<html>
<head>
    <title>Patient Login</title>
</head>
<body>
    <h2>Patient Login</h2>

    <% 
        // Invalidate the session to ensure clean login
        if (session != null) {
            session.invalidate();
        }
    %>

    <form action="LoginPatientServlet" method="POST">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="Login">
    </form>

    <div style="color: red; font-weight: bold;">
        <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
    </div>

    <p>Don't have an account? <a href="register.jsp">Register here</a>.</p>
</body>
</html>

--%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Login</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: url("loginBG.jpg");
            background-size: cover;
        }

        .container {
            max-width: 800px;
            width: 500px;
            padding: 40px;
            background-color: #ffeaa7;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #555;
            margin-bottom: 30px;
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
            color: #ff6f61;
        }

        input {
            padding: 10px;
            border: 2px solid #ffab91;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
            background-color: #fff3e0;
            color: #333;
        }

        button {
            padding: 10px 20px;
            background-color: #81c784;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #66bb6a;
        }

        .alert {
            color: #e57373;
            font-weight: bold;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            font-weight: bold;
            color: #64b5f6;
        }

        a:hover {
            color: #42a5f5;
        }
    </style>
</head>
<body>
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
