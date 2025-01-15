import com.seniorcare.model.NurseInfo;
import dao.NurseInfoDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateNurseInfoServlet")
public class UpdateNurseInfoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the session to fetch the emp_id
        HttpSession session = request.getSession();
        Integer empId = (Integer) session.getAttribute("emp_id");  // Retrieve emp_id from session
        if (empId == null) {
            response.sendRedirect("employeeLogin.jsp");
            return;
        }

        // Get the new data from the form
        String nurseCertification = request.getParameter("nurse_certification");
        String nurseShift = request.getParameter("nurse_shift");
        String nursePackage = request.getParameter("nurse_package");  // Get the package selected by the nurse

        // Create NurseInfo object and update it
        NurseInfo updatedNurseInfo = new NurseInfo();
        updatedNurseInfo.setEmpId(empId); // Use emp_id from session
        updatedNurseInfo.setNurseCertification(nurseCertification);
        updatedNurseInfo.setNurseShift(nurseShift);
        updatedNurseInfo.setNursePackage(nursePackage);  // Set the package

        // Call the DAO to update nurse info
        NurseInfoDao dao = new NurseInfoDao();
        boolean updateSuccess = dao.updateNurseInfo(updatedNurseInfo);

        // Handle the result
        if (updateSuccess) {
            response.sendRedirect("nurseDashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to update your information.");
            request.getRequestDispatcher("editNurseInfo.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}



