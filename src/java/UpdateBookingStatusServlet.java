import dao.BookingDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author adamh
 */

@WebServlet("/UpdateBookingStatusServlet")
public class UpdateBookingStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingID"));
        String action = request.getParameter("action"); // Accept or Reject

        // Check if employeeId exists in the session
        Integer employeeId = (Integer) request.getSession().getAttribute("employeeId");
        if (employeeId == null) {
            request.setAttribute("errorMessage", "Employee not logged in.");
            request.getRequestDispatcher("employeeLogin.jsp").forward(request, response);
            return;
        }

        BookingDAO bookingDao = new BookingDAO();
        boolean isUpdated = bookingDao.updateBookingStatus(bookingId, action, employeeId);

        if (isUpdated && action.equalsIgnoreCase("Accept")) {
            response.sendRedirect("nurseDashboard.jsp"); // Redirect to nurse dashboard after accepting
        } else if (isUpdated) {
            response.sendRedirect("nurseDashboard.jsp"); // Refresh nurse dashboard for rejected bookings
        } else {
            request.setAttribute("errorMessage", "Failed to update booking status.");
            request.getRequestDispatcher("nurseDashboard.jsp").forward(request, response);
        }
    }
}




