package examples;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.*;
/* Database Stuff */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;


/**
 * Simple Hello servlet.
 */

public final class Hello extends HttpServlet {


    /**
     * Respond to a GET request for the content produced by
     * this servlet.
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are producing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    private Connection my_con;
    private Boolean first_time = new Boolean("True");
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
      throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();        
        writer.println("<html>");
        writer.println("<head>");
        writer.println("<title>Sample Application Servlet Page</title>");
        writer.println("</head>");
        writer.println("<body bgcolor=white>");

        writer.println("<table border=\"0\" cellpadding=\"10\">");
        writer.println("<tr>");
        writer.println("<td>");
        writer.println("<img src=\"images/springsource.png\">");
        writer.println("</td>");
        writer.println("<td>");
        writer.println("<h1>Sample Application Servlet</h1>");
        writer.println("</td>");
        writer.println("</tr>");
        writer.println("</table>");

		writer.println("<p>Now the database!!</p>");
		try {
            if  (first_time) {
                writer.println("Connecting to the database<br>");
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection( "jdbc:mysql://192.168.80.86:3306/mysql?"
                         +"user=jinkersont&password=password1");   
                my_con = con;
                first_time = new Boolean("False");
            } else {
                writer.println("Alreay have a database connection<br>");
            }
            Statement stmt=my_con.createStatement();  
            ResultSet rs=stmt.executeQuery("SELECT host FROM mysql.proxies_priv WHERE host != 'localhost'");
            while(rs.next())  
                writer.println(rs.getString(1));  
        } catch(Exception e) { 
            writer.println("Whoops");
            writer.println(e);
        }

        writer.println("</body>");
        writer.println("</html>");
    }
} 