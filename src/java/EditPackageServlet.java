/**
 *
 * @author adamh

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


