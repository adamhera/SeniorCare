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
    //private BookingDAO bookingDao = new BookingDAO(); // Instance of BookingDao

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingID = Integer.parseInt(request.getParameter("bookingID"));
        BookingDAO bookingDao = new BookingDAO();
        // Check if the booking is pending
        String status = bookingDao.getBookingStatus(bookingID);
        if ("Pending".equalsIgnoreCase(status)) {
            // Delete the booking
            bookingDao.deleteBooking(bookingID);
            request.setAttribute("message", "Booking cancelled successfully.");
        } else {
            request.setAttribute("error", "Only pending bookings can be cancelled.");
        }

        // Redirect to the patient dashboard
        request.getRequestDispatcher("patientDasboard.jsp").forward(request, response);
    }
}
