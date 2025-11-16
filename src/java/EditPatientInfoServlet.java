/**
 *
 * @author adamh

* /

/* Using dao*/
import dao.PatientDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EditPatientInfoServlet")
public class EditPatientInfoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer patientID = (Integer) session.getAttribute("patientID");

        if (patientID == null) {
            response.sendRedirect("patientLogin.jsp");
            return;
        }

        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        // Validate input
        if (firstName == null || firstName.trim().isEmpty() ||
            lastName == null || lastName.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            address == null || address.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields except password are required.");
            request.getRequestDispatcher("editPatientinfo.jsp").forward(request, response);
            return;
        }

        // Use PatientDAO to update the patient information
        PatientDAO patientDAO = new PatientDAO();
        boolean isUpdated = patientDAO.updatePatientInfo(patientID, firstName, lastName, email, password, address);

        if (isUpdated) {
            session.setAttribute("patientFirstName", firstName);
            session.setAttribute("patientLastName", lastName);
            session.setAttribute("patientEmail", email);
            session.setAttribute("patientAddress", address);

            request.setAttribute("successMessage", "Information updated successfully.");
            // Redirect to the page with the success message and the 'Back to Dashboard' button
            request.getRequestDispatcher("editPatientinfo.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Failed to update information. Please try again.");
            request.getRequestDispatcher("editPatientinfo.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("editPatientinfo.jsp").forward(request, response);
    }
}

