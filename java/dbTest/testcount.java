import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.io.*;
import java.util.*;
import java.lang.Math.*;
import java.text.*;

public class testcount {
    public static void main(String[] args) {
        String default_port = "3306";
        String url = "jdbc:mysql://url:port/mydb";
        String p_url = null;
        String p_port = null;
        String p_username = null;
        String p_password = null;
        String p_database = null;
        String countlower = "0";
        String countupper = "0";
        // Connection c1 = null;
        int i = 0;
        while (i < args.length) {

            // Process --url
            if (args[i].compareTo("--url") == 0) {
                i++;
                if (i < args.length) {
                    p_url = args[i];
                } else {
                    System.out.println("No url specified");
                    System.exit(-1);
                }
            }
            // Process --port
            if (args[i].compareTo("--port") == 0) {
                i++;
                if (i < args.length) {
                    p_port = args[i];
                } else {
                    System.out.println("no port specified");
                    System.exit(-1);
                }
            }
            // Process --user
            if (args[i].compareTo("--user") == 0) {
                i++;
                if (i < args.length) {
                    p_username = args[i];
                } else {
                    System.out.println("No username specified");
                    System.exit(-1);
                }
            }
            if (args[i].compareTo("--password") == 0) {
                i++;
                if (i < args.length) {
                    p_password = args[i];
                } else {
                    System.out.println("No password specified");
                    System.exit(-1);
                }
            }
            if (args[i].compareTo("--database") == 0) {
                i++;
                if (i < args.length) {
                    p_database = args[i];
                } else {
                    System.out.println("No database specified");
                    System.exit(-1);
                }
            }
            i++;
        }
        if (p_port == null) {
            p_port = default_port;
        }
        String full_url = url.replace("url", p_url);
        full_url = full_url.replace("port", p_port);
        full_url = full_url.replace("mydb", p_database);
        System.out.println(full_url);
        // try to establish the connection to the database
        Connection c1;
        try {
           c1 = DriverManager.getConnection(full_url, p_username, p_password);
        }
        catch (SQLException e) {
            throw new IllegalStateException("Unable to connect to the database. " + e.getMessage());
        }

        System.out.println("Connection established successfully!");
        Statement stmt;
        try { 
            stmt  = c1.createStatement();
        }
        catch (SQLException e) {
            throw new IllegalStateException("create statement. " + e.getMessage());
        }
        String sql = "SELECT COUNT(*) FROM TOKENDATA WHERE ID LIKE 'temp_BusinessLogicTest%';";
        ResultSet rs;
        try {
           rs = stmt.executeQuery(sql);
        }
        catch (SQLException e) {
            throw new IllegalStateException("count lower. " + e.getMessage());
        }
        try {        
           while (rs.next()) {
              countlower = rs.getString(1);
              break;
           }
        }
        catch (SQLException e) {
            throw new IllegalStateException("get results for lower " + e.getMessage());
        }
        sql = "SELECT COUNT(*) FROM TOKENDATA WHERE ID LIKE 'TEMP_BusinessLogicTest%';";
        try {
           rs = stmt.executeQuery(sql);
        }
        catch (SQLException e) {
            throw new IllegalStateException("count upper. " + e.getMessage());
        }
        try {        
           while (rs.next()) {
              countupper = rs.getString(1);
              break;
           }
        }
        catch (SQLException e) {
            throw new IllegalStateException("get results for upper " + e.getMessage());
        }
        System.out.printf("Found %s lower and %s upper\n", countlower, countupper );
        try {
            c1.close();
        }
        catch (SQLException e) {
            throw new IllegalStateException("Unable to close database " + e.getMessage());
        }
    }
}
