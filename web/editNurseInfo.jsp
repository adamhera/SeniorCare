<%-- 
    Document   : editNurseInfo
    Created on : Jan 11, 2025, 7:07:18 PM
    Author     : adamh
--%>

<%@page import="com.seniorcare.model.NurseInfo"%>
<%@page import="dao.NurseInfoDao"%>
<%@page import="dao.PackageDAO"%>
<%@page import="java.util.List"%>
<%@page session="true" %>

<%
    // Get the list of all available package names from the database
    PackageDAO packageDao = new PackageDAO();
    List<String> packageNames = packageDao.getAllPackageNames();
    Integer empId = (Integer) session.getAttribute("emp_id");

    // Get the nurse's current selected package
    NurseInfoDao nurseInfoDao = new NurseInfoDao();
    NurseInfo nurseInfo = nurseInfoDao.getNurseInfoById(empId);
    String selectedPackage = nurseInfo != null ? nurseInfo.getNursePackage() : null; // Assuming nurse package info is stored
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Nurse Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f5f0; /* Cream background */
            color: #4a3c2b; /* Rich brown text */
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            color: #5c4033; /* Dark brown for headings */
        }

        form {
            width: 50%;
            margin: 30px auto;
            background-color: #e9e0d8; /* Soft cream background */
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #4a3c2b;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #d9d2c6; /* Light brown border */
            border-radius: 5px;
            background-color: #f6f0eb; /* Light cream */
            color: #4a3c2b; /* Dark brown text */
        }

        input[type="text"]::placeholder, select option {
            color: #8b6a59; /* Soft brown for placeholders */
        }

        button {
            width: 100%;
            background-color: #735445; /* Soft brown button */
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #5c4033; /* Darker brown for hover */
        }

        p {
            text-align: center;
            margin-top: 20px;
            color: #5c4033;
        }

        .note {
            text-align: center;
            font-size: 14px;
            color: #8b6a59; /* Subtle brown text */
        }
    </style>
</head>
<body>
    <h2>Edit Nurse Information</h2>

    <form action="UpdateNurseInfoServlet" method="POST">
        <label for="nurse_certification">Certification:</label>
        <input type="text" name="nurse_certification" value="<%= nurseInfo.getNurseCertification() %>" placeholder="Enter your certification" required>

        <label for="nurse_shift">Shift:</label>
        <input type="text" name="nurse_shift" value="<%= nurseInfo.getNurseShift() %>" placeholder="Enter your shift" required>

        <label for="nurse_package">Select Package:</label>
        <select name="nurse_package">
            <% 
                for (String packageName : packageNames) {
            %>
                <option value="<%= packageName %>" <%= packageName.equals(nurseInfo.getNursePackage()) ? "selected" : "" %>><%= packageName %></option>
            <% 
                }
            %>
        </select>

        <button type="submit">Update Information</button>
    </form>

    <p>
        <% if (selectedPackage == null || selectedPackage.isEmpty()) { %>
            No enrolled package.
        <% } else { %>
            Currently enrolled in: <strong><%= selectedPackage %></strong>
        <% } %>
    </p>
</body>
</html>
