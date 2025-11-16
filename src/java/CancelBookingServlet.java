/**
 *
 * @author adamh
 */
import dao.BookingDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get bookingID from the request
        String bookingIDStr = request.getParameter("bookingID");

        if (bookingIDStr == null || bookingIDStr.isEmpty()) {
            
            request.setAttribute("error", "Invalid booking ID.");
            request.getRequestDispatcher("BookingDashboard.jsp").forward(request, response);
            return;
        }

        int bookingID = Integer.parseInt(bookingIDStr);
        BookingDAO bookingDAO = new BookingDAO();

        // Attempt to delete the booking
        boolean isDeleted = bookingDAO.deleteBooking(bookingID);

        if (isDeleted) {
            // If successful, redirect to the dashboard with a success message
            request.setAttribute("message", "Booking canceled successfully.");
        } else {
            // If failed, redirect with an error message
            request.setAttribute("error", "Failed to cancel booking. Please try again.");
        }

        
        request.getRequestDispatcher("patientDasboard.jsp").forward(request, response);
    }
}
