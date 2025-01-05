/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import bean.LoginBeanEmployee;
import dao.LoginDaoEmployee;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/NurseLoginServlet")
public class NurseLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        
        LoginBeanEmployee loginBean = new LoginBeanEmployee();
        loginBean.setUsername(username);
        loginBean.setPassword(password);
        loginBean.setRole("Nurse");

        LoginDaoEmployee loginDao = new LoginDaoEmployee();
        try {
            String result = loginDao.authenticateEmployee(loginBean);
            if ("SUCCESS".equals(result)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", username);
                session.setAttribute("role", "Admin");
                response.sendRedirect("nurseDashboard.jsp");
            } else {
                request.setAttribute("errorMessage", result);
                request.getRequestDispatcher("nurseLogin.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error during nurse login.", e);
        }
    }
}
