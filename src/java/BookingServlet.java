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

/*using dao*/
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int packageID = Integer.parseInt(request.getParameter("packageID"));
        int patientID = (int) request.getSession().getAttribute("patientID");
        String bookingDate = request.getParameter("bookingDate");
        String bookingTime = request.getParameter("bookingTime");
        
        
         // Debugging output
        System.out.println("Booking Date: " + bookingDate);
        System.out.println("Booking Time: " + bookingTime);
        
        // Ensure bookingTime is in the correct format (HH:mm:ss)
        if (bookingTime != null && !bookingTime.isEmpty()) {
            if (bookingTime.length() == 5) {  // Format HH:mm
                bookingTime = bookingTime + ":00";  // Add seconds as ":00"
            }
        }

        // Debugging after fixing time format
        System.out.println("Updated Booking Time: " + bookingTime);
        
        BookingDAO bookingDAO = new BookingDAO();
        boolean isBooked = bookingDAO.createBooking(patientID, packageID, bookingDate, bookingTime);

        if (isBooked) {
            request.setAttribute("message", "Booking successful!");
        } else {
            request.setAttribute("message", "Failed to book the package.");
        }

        request.getRequestDispatcher("patientDasboard.jsp").forward(request, response);
    }
}