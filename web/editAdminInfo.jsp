<%-- 
    Document   : editAdminInfo
    Created on : Jan 18, 2025, 11:17:42 AM
    Author     : adamh
--%>

<%-- Document : editAdminInfo Created on : Jan 18, 2025, 11:17:42 AM Author : adamh --%>  
<!DOCTYPE html> 
<html> 
<head> 
    <title>Edit Admin Info</title> 
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1e8e3;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
            font-weight: bold;
            color: #555;
        }
        input[type="text"], 
        input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input::placeholder {
            color: #aaa;
            font-size: 13px;
        }
        button {
            padding: 10px 15px;
            background-color: #735445;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #735445;
        }
        .message {
            text-align: center;
            font-size: 14px;
            margin-top: 10px;
        }
        .message.error {
            color: red;
        }
        .message.success {
            color: green;
        }
        .back-link {
            display: inline-block;
            margin-top: 15px;
            text-align: center;
            text-decoration: none;
            color: #735445;
            font-size: 14px;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head> 
<body> 
    <div class="container">
        <h2>Edit Admin Info</h2>
        <form action="UpdateAdminProfileServlet" method="POST">
            <!-- Admin Certification -->
            <label for="adminCertification">Admin Certification:</label>
            <input 
                type="text" 
                id="adminCertification" 
                name="adminCertification" 
                placeholder="Enter your certification" 
                required 
            >

            <!-- New Password -->
            <label for="password">New Password:</label>
            <input 
                type="password" 
                id="password" 
                name="password" 
                placeholder="Enter new password" 
                minlength="4" 
                required 
            >

            <!-- Confirm Password -->
            <label for="confirmPassword">Confirm Password:</label>
            <input 
                type="password" 
                id="confirmPassword" 
                name="confirmPassword" 
                placeholder="Re-enter your password" 
                required 
            >

            <button type="submit">Save Changes</button>
            <div style="text-align: center;">
                <a href="home.jsp" class="back-link">Back to Home</a>
            </div>
        </form>
    </div>
</body> 
</html>
