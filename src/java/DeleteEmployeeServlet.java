/**
 *
 * @author adamh
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBConnection;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the employee ID from the request
        String empIdParam = request.getParameter("emp_id");

        // Check if empId is null or empty
        if (empIdParam == null || empIdParam.isEmpty()) {
            System.out.println("empId is null or empty");
            response.sendRedirect("deleteEmployee.jsp");
            return;
        }

        try {
            // Parse the empId as an integer
            int empId = Integer.parseInt(empIdParam);

            // Establish database connection and delete employee
            try (Connection conn = DBConnection.createConnection();
                 PreparedStatement stmt = conn.prepareStatement("DELETE FROM Employee WHERE Emp_ID = ?")) {

                // Set the empId parameter in the query
                stmt.setInt(1, empId);

                // Execute the delete query
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Employee deleted successfully!");
                } else {
                    System.out.println("Failed to delete employee.");
                }
            }
        } catch (NumberFormatException e) {
            // Handle invalid number format
            e.printStackTrace();
        } catch (SQLException e) {
            // Handle SQL errors
            e.printStackTrace();
        }

        // Redirect back to the deleteEmployee.jsp page after deletion
        response.sendRedirect("deleteEmployee.jsp");
    }
}

