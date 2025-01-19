package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Senior Care</title>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: Arial, sans-serif;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            background-color: #735445; /* Cream background */\n");
      out.write("        }\n");
      out.write("        header {\n");
      out.write("            background-color: #3e2723; /* Chocolate color */\n");
      out.write("            color: white;\n");
      out.write("            padding: 20px;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("        nav {\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: space-between;\n");
      out.write("            align-items: center;\n");
      out.write("            background-color: #735445; /* Chocolate color */\n");
      out.write("            padding: 10px 20px;\n");
      out.write("        }\n");
      out.write("        .nav-links {\n");
      out.write("            display: flex;\n");
      out.write("            gap: 20px;\n");
      out.write("        }\n");
      out.write("        nav a {\n");
      out.write("            color: white;\n");
      out.write("            padding: 10px 15px;\n");
      out.write("            text-decoration: none;\n");
      out.write("            border-radius: 5px;\n");
      out.write("        }\n");
      out.write("        nav a:hover {\n");
      out.write("            background-color: #6d4c41; /* Light chocolate color */\n");
      out.write("        }\n");
      out.write("        .login-buttons {\n");
      out.write("        display: flex;\n");
      out.write("        gap: 10px;\n");
      out.write("        }\n");
      out.write("        .login-btn {\n");
      out.write("            background-color: #3e2723; /* Chocolate color */\n");
      out.write("            color: white;\n");
      out.write("            padding: 10px 20px;\n");
      out.write("            text-decoration: none;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            font-size: 1em;\n");
      out.write("        }\n");
      out.write("        .login-btn:hover {\n");
      out.write("            background-color: #6d4c41; /* Light chocolate color */\n");
      out.write("        }\n");
      out.write("        .hero {\n");
      out.write("        position: relative; /* To position overlay and text correctly */\n");
      out.write("        background: url('image/home.jpg') no-repeat center center/cover;\n");
      out.write("        height: 500px;\n");
      out.write("        display: flex;\n");
      out.write("        justify-content: center;\n");
      out.write("        align-items: center;\n");
      out.write("        text-align: center;\n");
      out.write("        color: white;\n");
      out.write("    }\n");
      out.write("        .hero-overlay {\n");
      out.write("        position: absolute;\n");
      out.write("        top: 0;\n");
      out.write("        left: 0;\n");
      out.write("        width: 100%;\n");
      out.write("        height: 100%;\n");
      out.write("        background-color: rgba(0, 0, 0, 0.5); /* Dark overlay with transparency */\n");
      out.write("        backdrop-filter: blur(4px); /* Blur effect */\n");
      out.write("        z-index: 1; /* Ensures overlay is below text */\n");
      out.write("    }\n");
      out.write("    .hero h1 {\n");
      out.write("        position: relative;\n");
      out.write("        z-index: 2; /* Ensures text is above overlay */\n");
      out.write("        font-size: 3.5em; /* Increased size for visibility */\n");
      out.write("        font-weight: bold;\n");
      out.write("        text-shadow: 3px 3px 10px rgba(0, 0, 0, 0.8); /* Enhances text readability */\n");
      out.write("    }\n");
      out.write("        .section {\n");
      out.write("            padding: 50px;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("        .services, .testimonials {\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: space-around;\n");
      out.write("            flex-wrap: wrap;\n");
      out.write("        }\n");
      out.write("        .service, .testimonial {\n");
      out.write("            background-color: white;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            padding: 20px;\n");
      out.write("            width: 250px;\n");
      out.write("            margin: 10px;\n");
      out.write("            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);\n");
      out.write("        }\n");
      out.write("        .service h3, .testimonial p {\n");
      out.write("            color: #3e2723; /* Chocolate color */\n");
      out.write("        }\n");
      out.write("        .service p, .testimonial strong {\n");
      out.write("            color: #6d4c41; /* Light chocolate color */\n");
      out.write("        }\n");
      out.write("        input[type=\"text\"], input[type=\"email\"], input[type=\"submit\"] {\n");
      out.write("            padding: 10px;\n");
      out.write("            font-size: 1em;\n");
      out.write("            border: 1px solid #6d4c41; /* Light chocolate color */\n");
      out.write("            border-radius: 5px;\n");
      out.write("            width: 100%;\n");
      out.write("            box-sizing: border-box;\n");
      out.write("            background-color: #f5f5f1; /* Cream background */\n");
      out.write("            color: #3e2723; /* Chocolate color */\n");
      out.write("        }\n");
      out.write("        input[type=\"submit\"] {\n");
      out.write("            background-color: #3e2723; /* Chocolate color */\n");
      out.write("            color: white;\n");
      out.write("            cursor: pointer;\n");
      out.write("            transition: background-color 0.3s;\n");
      out.write("        }\n");
      out.write("        input[type=\"submit\"]:hover {\n");
      out.write("            background-color: #6d4c41; /* Light chocolate color */\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<header>\n");
      out.write("    <h1>Welcome to The SeniorCareConnect</h1>\n");
      out.write("    <p>We provide premium nursing care in an environment that feels like home</p>\n");
      out.write("</header>\n");
      out.write("\n");
      out.write("<nav>\n");
      out.write("    <div class=\"nav-links\">\n");
      out.write("        <a href=\"home.jsp\">Home</a>\n");
      out.write("        <a href=\"about.jsp\">About</a>\n");
      out.write("        <a href=\"services.jsp\">Services</a>\n");
      out.write("        <a href=\"location.jsp\">Location</a>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"login-buttons\">\n");
      out.write("        <a href=\"employeeLogin.jsp\" class=\"login-btn\">Employee Login</a>\n");
      out.write("        <a href=\"login.jsp\" class=\"login-btn\">Patient Login</a>\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
      out.write("\n");
      out.write("<div class=\"hero\">\n");
      out.write("    <div class=\"hero-overlay\"></div> <!-- Added overlay -->\n");
      out.write("    <h1>The Right Choice for Your Loved Ones</h1>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div class=\"section services\">\n");
      out.write("    <div class=\"service\">\n");
      out.write("        <h3>Assisted Living</h3>\n");
      out.write("        <p>Comprehensive care with support for daily living activities.</p>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"service\">\n");
      out.write("        <h3>Long Term Nursing Care</h3>\n");
      out.write("        <p>For individuals who need continuous medical attention.</p>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"service\">\n");
      out.write("        <h3>Dementia Care</h3>\n");
      out.write("        <p>Specialized care to support cognitive decline.</p>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div class=\"section testimonials\">\n");
      out.write("    <div class=\"testimonial\">\n");
      out.write("        <p>\"The Senior Care is a wonderful place for my father. The staff are amazing, and the atmosphere feels like home!\"</p>\n");
      out.write("        <strong>Family of Mr. Eu</strong>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"testimonial\">\n");
      out.write("        <p>\"We were so happy with the care provided. It truly was a home away from home for our mother.\"</p>\n");
      out.write("        <strong>Ms. Tan</strong>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div class=\"section\">\n");
      out.write("    <h2>Contact Us</h2>\n");
      out.write("    <p>For more information or inquiries, please reach out to us!</p>\n");
      out.write("    <form action=\"#\">\n");
      out.write("        <label for=\"name\">Name:</label><br>\n");
      out.write("        <input type=\"text\" id=\"name\" name=\"name\"><br>\n");
      out.write("        <label for=\"email\">Email:</label><br>\n");
      out.write("        <input type=\"email\" id=\"email\" name=\"email\"><br><br>\n");
      out.write("        <input type=\"submit\" value=\"Submit\">\n");
      out.write("    </form>\n");
      out.write("</div>\n");
      out.write("\n");
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
