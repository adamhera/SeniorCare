package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Patient Login | SeniorCareConnect</title>\n");
      out.write("    <style>\n");
      out.write("        /* General Styles */\n");
      out.write("        body {\n");
      out.write("            font-family: Arial, sans-serif;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            align-items: center;\n");
      out.write("            min-height: 100vh;\n");
      out.write("            overflow: hidden; /* Prevent scrolling */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .background {\n");
      out.write("            position: absolute;\n");
      out.write("            top: 0;\n");
      out.write("            left: 0;\n");
      out.write("            width: 100%;\n");
      out.write("            height: 100%;\n");
      out.write("            background-image: url(\"image/login.jpg\");\n");
      out.write("            background-size: cover;\n");
      out.write("            background-position: center;\n");
      out.write("            filter: blur(8px);\n");
      out.write("            z-index: 1; /* Behind the content */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .container {\n");
      out.write("            position: relative; /* Position relative to allow z-index */\n");
      out.write("            max-width: 500px;\n");
      out.write("            width: 90%;\n");
      out.write("            padding: 30px;\n");
      out.write("            background-color: #d8c8b7; /* Soft cream background */\n");
      out.write("            border-radius: 10px;\n");
      out.write("            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);\n");
      out.write("            border: 4px solid #c1a28b; /* Light brown border */\n");
      out.write("            z-index: 2; /* Above the background */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h2 {\n");
      out.write("            text-align: center;\n");
      out.write("            color: #5c4033; /* Dark brown for heading */\n");
      out.write("            font-size: 1.8em;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Form Styles */\n");
      out.write("        form {\n");
      out.write("            display: flex;\n");
      out.write("            flex-direction: column;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-group {\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        label {\n");
      out.write("            font-weight: bold;\n");
      out.write("            margin-bottom: 5px;\n");
      out.write("            color: #4a3c2b; /* Rich brown for labels */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        input {\n");
      out.write("            padding: 12px;\n");
      out.write("            border: 2px solid #c1a28b; /* Soft brown solid border */\n");
      out.write("            border-radius: 6px;\n");
      out.write("            font-size: 16px;\n");
      out.write("            width: 100%;\n");
      out.write("            background-color: #fff7e6; /* Very light brown/cream background for input fields */\n");
      out.write("            color: #3e2723; /* Darker brown for text */\n");
      out.write("            box-sizing: border-box;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        input:focus {\n");
      out.write("            outline: none;\n");
      out.write("            border-color: #8e735b; /* Slightly darker brown on focus */\n");
      out.write("            box-shadow: 0 0 8px rgba(139, 69, 19, 0.5); /* Soft brown glow */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        button {\n");
      out.write("            padding: 12px;\n");
      out.write("            background-color: #735445; /* Light brown */\n");
      out.write("            color: #fff;\n");
      out.write("            border: none;\n");
      out.write("            border-radius: 6px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            font-size: 16px;\n");
      out.write("            transition: background-color 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        button:hover {\n");
      out.write("            background-color: #c2a68c; /* Slightly darker brown */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .alert {\n");
      out.write("            color: #f44336; /* Red for error messages */\n");
      out.write("            font-weight: bold;\n");
      out.write("            margin-top: 20px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        a {\n");
      out.write("            text-decoration: none;\n");
      out.write("            font-weight: bold;\n");
      out.write("            color: #3b8d99; /* Soft teal for links */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        a:hover {\n");
      out.write("            color: #1d6b77; /* Darker teal on hover */\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"background\"></div>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h2>Patient Login</h2>\n");
      out.write("\n");
      out.write("        ");
 
            // Invalidate the session to ensure clean login
            if (session != null) {
                session.invalidate();
            }
        
      out.write("\n");
      out.write("\n");
      out.write("        <form action=\"LoginPatientServlet\" method=\"POST\">\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"email\">Email:</label>\n");
      out.write("                <input type=\"email\" id=\"email\" name=\"email\" required />\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"password\">Password:</label>\n");
      out.write("                <input type=\"password\" id=\"password\" name=\"password\" required />\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <button type=\"submit\">Login</button>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <div class=\"alert\">\n");
      out.write("            ");
      out.print( request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" );
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <p>Don't have an account? <a href=\"register.jsp\">Register here</a>.</p>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
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
