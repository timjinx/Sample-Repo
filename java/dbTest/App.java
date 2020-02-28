import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.*;
import java.util.*;
import java.lang.Math.*;
import java.text.*;

public class App {
    public static void main(String[] args) {
        String default_port = "3306";
        String url = "jdbc:mysql://url:port/mydb";
        String p_url = null;
        String p_port = null;
        String p_username = null;
        String p_password = null;
        String p_database = null;
        Connection connection = null;
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
        try {
            connection = DriverManager.getConnection(full_url, p_username, p_password);
            System.out.println("Connection established successfully!");
        }
        // if the connection couldn't be established raise an exception
        catch (SQLException e) {
            throw new IllegalStateException("Unable to connect to the database. " + e.getMessage());
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                /* ignored */}
        }
    }
}
