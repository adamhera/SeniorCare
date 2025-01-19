package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class pendingApproval_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Registration Pending</title>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: Arial, sans-serif;\n");
      out.write("            background-color: #f9f9f9; /* Light neutral background */\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            align-items: center;\n");
      out.write("            height: 100vh;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .container {\n");
      out.write("            max-width: 600px;\n");
      out.write("            width: 90%;\n");
      out.write("            padding: 30px;\n");
      out.write("            background-color: #d8c8b7; /* Soft cream background */\n");
      out.write("            border-radius: 10px;\n");
      out.write("            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);\n");
      out.write("            border: 4px solid #c1a28b; /* Light brown border */\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h2 {\n");
      out.write("            color: #5c4033; /* Dark brown for heading */\n");
      out.write("            font-size: 2em;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        p {\n");
      out.write("            color: #4a3c2b; /* Rich brown for paragraph text */\n");
      out.write("            font-size: 1.2em;\n");
      out.write("            margin: 20px 0;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        a {\n");
      out.write("            color: #fff;\n");
      out.write("            background-color: #735445; /* Light brown for the link */\n");
      out.write("            font-size: 1.1em;\n");
      out.write("            text-decoration: none;\n");
      out.write("            padding: 12px 20px;\n");
      out.write("            border-radius: 6px;\n");
      out.write("            transition: background-color 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        a:hover {\n");
      out.write("            background-color: #c2a68c; /* Slightly darker brown on hover */\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h2>Registration Pending</h2>\n");
      out.write("        <p>Your registration is pending approval from the admin. Please wait until it is reviewed.</p>\n");
      out.write("        <a href=\"home.jsp\">Return to Homepage</a>\n");
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
