/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



/**
 *
 * @author adamh
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditDeletePackageServlet")
public class EditDeletePackageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int packageID = Integer.parseInt(request.getParameter("packageID"));

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
            String query = "SELECT * FROM Package WHERE Package_ID = ?";

            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, packageID);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("packageID", rs.getInt("Package_ID"));
                request.setAttribute("packageName", rs.getString("Package_Name"));
                request.setAttribute("packageDescription", rs.getString("Package_Description"));
                request.setAttribute("packagePrice", rs.getDouble("Package_Price"));
            }

            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unable to fetch package details.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("editDeletePackage.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int packageID = Integer.parseInt(request.getParameter("packageID"));

        if ("Edit".equalsIgnoreCase(action)) {
            String packageName = request.getParameter("packageName");
            String packageDescription = request.getParameter("packageDescription");
            double packagePrice = Double.parseDouble(request.getParameter("packagePrice"));

            try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
                String query = "UPDATE Package SET Package_Name = ?, Package_Description = ?, Package_Price = ? WHERE Package_ID = ?";

                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, packageName);
                stmt.setString(2, packageDescription);
                stmt.setDouble(3, packagePrice);
                stmt.setInt(4, packageID);

                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    request.setAttribute("successMessage", "Package updated successfully.");
                } else {
                    request.setAttribute("errorMessage", "Failed to update package.");
                }

                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while updating the package.");
            }

        } else if ("Delete".equalsIgnoreCase(action)) {
            try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
                String query = "DELETE FROM Package WHERE Package_ID = ?";

                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setInt(1, packageID);

                int rowsDeleted = stmt.executeUpdate();
                if (rowsDeleted > 0) {
                    request.setAttribute("successMessage", "Package deleted successfully.");
                } else {
                    request.setAttribute("errorMessage", "Failed to delete package.");
                }

                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while deleting the package.");
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.jsp");
        dispatcher.forward(request, response);
    }
}
