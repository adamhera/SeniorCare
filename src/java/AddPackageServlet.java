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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddPackageServlet")
public class AddPackageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String packageName = request.getParameter("packageName");
        String packageDescription = request.getParameter("packageDescription");
        String packagePriceStr = request.getParameter("packagePrice");

        // Validate input fields
        if (packageName == null || packageDescription == null || packagePriceStr == null ||
            packageName.isEmpty() || packageDescription.isEmpty() || packagePriceStr.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("editAddPackage.jsp");
            dispatcher.forward(request, response);
            return;
        }

        double packagePrice;
        try {
            packagePrice = Double.parseDouble(packagePriceStr);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid price format.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("editAddPackage.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareDB", "app", "app")) {
            String query = "INSERT INTO Package (Package_Name, Package_Description, Package_Price) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, packageName);
            stmt.setString(2, packageDescription);
            stmt.setDouble(3, packagePrice);
            stmt.executeUpdate();
            stmt.close();
            request.setAttribute("successMessage", "Package added successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while adding the package.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("adminDasboard.jsp");
        dispatcher.forward(request, response);
    }
}
