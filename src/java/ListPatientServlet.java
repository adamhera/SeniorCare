/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = {"/ListPatientServlet"})
public class ListPatientServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Patient List</title></head>");
        out.println("<body>");
        out.println("<h1>Patient List</h1>");
        out.println("<table border='1' cellpadding='5'>");
        out.println("<tr>");
        out.println("<th>ID</th>");
        out.println("<th>First Name</th>");
        out.println("<th>Last Name</th>");
        out.println("<th>Phone</th>");
        out.println("<th>Address</th>");
        out.println("<th>Email</th>");
        out.println("</tr>");
        
        try {
            // Establish database connection
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app");
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM PATIENT"; // Make sure this matches the actual table name in DB
            ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
                int patientId = rs.getInt("PATIENT_ID"); // Ensure correct column names from DB
                String firstName = rs.getString("FIRST_NAME");
                String lastName = rs.getString("LAST_NAME");
                String phone = rs.getString("PHONE");
                String address = rs.getString("ADDRESS");
                String email = rs.getString("EMAIL");

                out.println("<tr>");
                out.println("<td>" + patientId + "</td>");
                out.println("<td>" + firstName + "</td>");
                out.println("<td>" + lastName + "</td>");
                out.println("<td>" + phone + "</td>");
                out.println("<td>" + address + "</td>");
                out.println("<td>" + email + "</td>");
                out.println("</tr>");
            }
            
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error retrieving patient data: " + e.getMessage() + "</p>");
        }
        
        out.println("</table>");
        out.println("<br>");
        out.println("<a href='add_patient.jsp'>Add New Patient</a>");
        out.println("</body>");
        out.println("</html>");
        
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Lists all patients in the system";
    }
}
