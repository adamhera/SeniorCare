/**
 *
 * @author adamh
 */

import bean.LoginBean;
import dao.LoginDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginPatientServlet")
public class LoginPatientServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginBean loginBean = new LoginBean();
        
        loginBean.setEmail(email);
        loginBean.setPassword(password);

        LoginDao loginDao = new LoginDao();

        int patientID = loginDao.authenticatePatient(loginBean);
        
        if (patientID > 0) {
            // Fetch patient details (e.g., first name, last name, email, address)
            String patientFirstName = loginDao.getPatientFirstName(patientID);
            String patientLastName = loginDao.getPatientLastName(patientID);
            String patientEmail = loginDao.getPatientEmail(patientID);
            String patientAddress = loginDao.getPatientAddress(patientID);

            HttpSession session = request.getSession();
            session.setAttribute("patientID", patientID);
            session.setAttribute("patientFirstName", patientFirstName);
            session.setAttribute("patientLastName", patientLastName);
            session.setAttribute("patientEmail", patientEmail);
            session.setAttribute("patientAddress", patientAddress);

            response.sendRedirect("patientDasboard.jsp");
        } else {
            // Authentication failed
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
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
}


