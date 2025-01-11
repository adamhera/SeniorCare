/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.BookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author adamh
 */
@WebServlet("/ApproveBookingServlet")
public class ApproveBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingID"));

        BookingDAO bookingDao = new BookingDAO();
        boolean isApproved = bookingDao.approveBooking(bookingId);

        if (isApproved) {
            response.sendRedirect("adminDashboard.jsp"); // Refresh admin dashboard
        } else {
            request.setAttribute("errorMessage", "Failed to approve booking.");
            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
        }
    }
}