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
</head>
<body>
    <h2>Edit Nurse Information</h2>

<form action="UpdateNurseInfoServlet" method="POST">
    <label for="nurse_certification">Certification:</label>
    <input type="text" name="nurse_certification" value="<%= nurseInfo.getNurseCertification() %>"><br>

    <label for="nurse_shift">Shift:</label>
    <input type="text" name="nurse_shift" value="<%= nurseInfo.getNurseShift() %>"><br>

    <label for="nurse_package">Select Package:</label>
    <select name="nurse_package">
        <% 
            for (String packageName : packageNames) {
        %>
            <option value="<%= packageName %>" <%= packageName.equals(nurseInfo.getNursePackage()) ? "selected" : "" %>><%= packageName %></option>
        <% 
            }
        %>
    </select><br>

    <button type="submit">Update Information</button>
</form>


    <p>
        <% if (selectedPackage == null || selectedPackage.isEmpty()) { %>
            No enrolled package.
        <% } else { %>
            Currently enrolled in: <%= selectedPackage %>
        <% } %>
    </p>

</body>
</html>