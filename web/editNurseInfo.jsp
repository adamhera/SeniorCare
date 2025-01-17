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
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }
        form {
            width: 50%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"], select {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #007BFF; /* Matches the button color in nurse dashboard */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #0056b3; /* Darker shade for hover */
        }
        p {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }
        .note {
            font-size: 14px;
            color: #666;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Edit Nurse Information</h2>

    <form action="UpdateNurseInfoServlet" method="POST">
        <label for="nurse_certification">Certification:</label>
        <input type="text" name="nurse_certification" value="<%= nurseInfo.getNurseCertification() %>" required>

        <label for="nurse_shift">Shift:</label>
        <input type="text" name="nurse_shift" value="<%= nurseInfo.getNurseShift() %>" required>

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
