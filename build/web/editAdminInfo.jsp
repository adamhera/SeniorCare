<%-- 
    Document   : editAdminInfo
    Created on : Jan 18, 2025, 11:17:42 AM
    Author     : adamh
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Admin Info</title>
</head>
<body>
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
        ><br>

        <!-- New Password -->
        <label for="password">New Password:</label>
        <input 
            type="password" 
            id="password" 
            name="password" 
            placeholder="Enter new password"
            minlength="4" 
            required 
        ><br>

        <!-- Confirm Password -->
        <label for="confirmPassword">Confirm Password:</label>
        <input 
            type="password" 
            id="confirmPassword" 
            name="confirmPassword" 
            placeholder="Re-enter your password"
            required 
        ><br>

        <button type="submit">Save Changes</button>
    </form>
</body>
</html>