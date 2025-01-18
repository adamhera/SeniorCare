/**
 *
 * @author adamh

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

@WebServlet("/EditPackageServlet")
public class EditPackageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String packageID = request.getParameter("packageID");

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
            String query = "SELECT * FROM Package WHERE Package_ID = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(packageID));
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("packageID", rs.getInt("Package_ID"));
                request.setAttribute("packageName", rs.getString("Package_Name"));
                request.setAttribute("packageDescription", rs.getString("Package_Description"));
                request.setAttribute("packagePrice", rs.getDouble("Package_Price"));
            } else {
                request.setAttribute("errorMessage", "Package not found.");
            }

            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving package details.");
        }

        // Forward to the JSP page to edit the package
        RequestDispatcher dispatcher = request.getRequestDispatcher("editPackage.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String packageID = request.getParameter("packageID");
        String packageName = request.getParameter("packageName");
        String packageDescription = request.getParameter("packageDescription");
        double packagePrice = Double.parseDouble(request.getParameter("packagePrice"));

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
            String updateQuery = "UPDATE Package SET Package_Name = ?, Package_Description = ?, Package_Price = ? WHERE Package_ID = ?";
            PreparedStatement stmt = conn.prepareStatement(updateQuery);
            stmt.setString(1, packageName);
            stmt.setString(2, packageDescription);
            stmt.setDouble(3, packagePrice);
            stmt.setInt(4, Integer.parseInt(packageID));

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                request.setAttribute("successMessage", "Package updated successfully.");
            } else {
                request.setAttribute("errorMessage", "Error updating package.");
            }

            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating package.");
        }

        // Forward back to the edit page with messages
        RequestDispatcher dispatcher = request.getRequestDispatcher("editPackage.jsp");
        dispatcher.forward(request, response);
    }
}
*/


/* guna dao*/
import dao.PackageDAO;
import com.seniorcare.model.Package;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditPackageServlet")
public class EditPackageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            PackageDAO packageDAO = new PackageDAO();

            if ("Edit".equals(action)) {
                // Retrieve package details for editing
                int packageId = Integer.parseInt(request.getParameter("packageID"));
                Package pkg = packageDAO.getPackageById(packageId);

                if (pkg != null) {
                    // Set package details as request attributes
                    request.setAttribute("packageID", pkg.getId());
                    request.setAttribute("packageName", pkg.getName());
                    request.setAttribute("packageDescription", pkg.getDescription());
                    request.setAttribute("packagePrice", pkg.getPrice());
                }

                // Forward to JSP to display the package details for editing
                RequestDispatcher dispatcher = request.getRequestDispatcher("editPackage.jsp");
                dispatcher.forward(request, response);

            } else if ("Save".equals(action)) {
                // Process save changes
                int packageId = Integer.parseInt(request.getParameter("packageID"));
                String packageName = request.getParameter("packageName");
                String packageDescription = request.getParameter("packageDescription");
                double packagePrice = Double.parseDouble(request.getParameter("packagePrice"));

                Package updatedPackage = new Package(packageId, packageName, packageDescription, packagePrice);

                boolean isUpdated = packageDAO.updatePackage(updatedPackage);

                if (isUpdated) {
                    request.setAttribute("successMessage", "Package updated successfully!");
                } else {
                    request.setAttribute("errorMessage", "Failed to update package.");
                }

                // Forward back to the edit page or dashboard
                RequestDispatcher dispatcher = request.getRequestDispatcher("editPackage.jsp");
                dispatcher.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }
}


