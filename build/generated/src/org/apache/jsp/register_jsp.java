package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Patient Registration</title>\n");
      out.write("<style>\n");
      out.write("  body {\n");
      out.write("    font-family: Arial, sans-serif;\n");
      out.write("    background-color: #f9f9f9; /* Light neutral background */\n");
      out.write("    margin: 0;\n");
      out.write("    padding: 0;\n");
      out.write("    display: flex;\n");
      out.write("    justify-content: center;\n");
      out.write("    align-items: center;\n");
      out.write("    height: 100vh; /* Full viewport height */\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  .container {\n");
      out.write("    max-width: 600px; /* Increased width */\n");
      out.write("    width: 90%; /* Responsive design for smaller screens */\n");
      out.write("    margin: 0 auto;\n");
      out.write("    padding: 30px;\n");
      out.write("    background-color: #ffeaa7; /* Soft sunny yellow */\n");
      out.write("    border-radius: 10px;\n");
      out.write("    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* More pronounced shadow */\n");
      out.write("    border: 4px solid #ffab91; /* Peachy border */\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  h1 {\n");
      out.write("    text-align: center;\n");
      out.write("    color: #555; /* Medium gray for text */\n");
      out.write("    font-size: 1.8em; /* Slightly larger font */\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  form {\n");
      out.write("    display: flex;\n");
      out.write("    flex-direction: column;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  .form-group {\n");
      out.write("    margin-bottom: 20px;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  label {\n");
      out.write("    font-weight: bold;\n");
      out.write("    margin-bottom: 5px;\n");
      out.write("    color: #ff6f61; /* Warm coral for labels */\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  input {\n");
      out.write("    padding: 12px;\n");
      out.write("    border: 2px solid #ffab91; /* Peachy solid border */\n");
      out.write("    border-radius: 6px;\n");
      out.write("    font-size: 16px;\n");
      out.write("    width: 100%;\n");
      out.write("    background-color: #fff3e0; /* Soft creamy background */\n");
      out.write("    color: #333; /* Dark text for readability */\n");
      out.write("    box-sizing: border-box;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  input:focus {\n");
      out.write("    outline: none;\n");
      out.write("    border-color: #ff6f61; /* Coral border on focus */\n");
      out.write("    box-shadow: 0 0 8px rgba(255, 111, 97, 0.5); /* Soft glow */\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  button {\n");
      out.write("    padding: 12px;\n");
      out.write("    background-color: #81c784; /* Calm green */\n");
      out.write("    color: #fff;\n");
      out.write("    border: none;\n");
      out.write("    border-radius: 6px;\n");
      out.write("    cursor: pointer;\n");
      out.write("    font-size: 16px;\n");
      out.write("    transition: background-color 0.3s ease;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  button:hover {\n");
      out.write("    background-color: #66bb6a; /* Slightly darker green */\n");
      out.write("  }\n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h1>Register Patient</h1>\n");
      out.write("        <form action=\"RegisterPatientServlet\" method=\"post\">\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"firstName\">First Name:</label>\n");
      out.write("                <input type=\"text\" id=\"firstName\" name=\"firstName\" required>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"lastName\">Last Name:</label>\n");
      out.write("                <input type=\"text\" id=\"lastName\" name=\"lastName\" required>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"phone\">Phone:</label>\n");
      out.write("                <input type=\"text\" id=\"phone\" name=\"phone\" required>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"address\">Address:</label>\n");
      out.write("                <input type=\"text\" id=\"address\" name=\"address\" required>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"email\">Email:</label>\n");
      out.write("                <input type=\"email\" id=\"email\" name=\"email\" required>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"password\">Password:</label>\n");
      out.write("                <input type=\"password\" id=\"password\" name=\"password\" required>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <button type=\"submit\">Register</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
