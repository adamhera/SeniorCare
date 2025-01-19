package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class employeeRegister_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <title>Employee Registration | SeniorCareConnect</title>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: Arial, sans-serif;\n");
      out.write("            background-color: #f4f1e1; /* Light soft brown background */\n");
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
      out.write("            margin: 0 auto;\n");
      out.write("            padding: 30px;\n");
      out.write("            background-color: #d8c8b7; /* Soft cream background */\n");
      out.write("            border-radius: 10px;\n");
      out.write("            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);\n");
      out.write("            border: 4px solid #c1a28b; /* Light brown border */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h1 {\n");
      out.write("            text-align: center;\n");
      out.write("            color: #5c4033; /* Dark brown for heading */\n");
      out.write("            font-size: 1.8em;\n");
      out.write("        }\n");
      out.write("\n");
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
      out.write("        input, select {\n");
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
      out.write("        input:focus, select:focus {\n");
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
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h1>Register Employee</h1>\n");
      out.write("        <form action=\"EmployeeRegisterServlet\" method=\"POST\">\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"name\">Name:</label>\n");
      out.write("                <input type=\"text\" id=\"name\" name=\"name\" required>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"email\">Email:</label>\n");
      out.write("                <input type=\"email\" id=\"email\" name=\"email\" required>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"role\">Role:</label>\n");
      out.write("                <select id=\"role\" name=\"role\">\n");
      out.write("                    <option value=\"Nurse\">Nurse</option>\n");
      out.write("                    <option value=\"Admin\">Admin</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"gender\">Gender:</label>\n");
      out.write("                <select id=\"gender\" name=\"gender\">\n");
      out.write("                    <option value=\"Male\">Male</option>\n");
      out.write("                    <option value=\"Female\">Female</option>\n");
      out.write("                </select>\n");
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
      out.write("</html>");
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
