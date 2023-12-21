import java.io.*;
import java.util.*;
import java.sql.ResultSet;
import java.lang.Class;
import java.sql.SQLException;
import java.sql.Statement;
public class runRevisionExtractor {
    public static void main (String[] args) {
        SQLiteHandler re = new SQLiteHandler();
        re.setUrl("extract.db");
        re.showUrl();
        re.connect();
        String sql = null;
        sql = "CREATE TABLE IF NOT EXISTS employees (\n"  
        + " id integer PRIMARY KEY,\n"  
        + " name text NOT NULL,\n"  
        + " capacity real\n"  
        + ");";  
        re.executeSQL(sql);
        sql = "INSERT INTO employees (id, name, capacity) \n" 
        + " VALUES (1, 'Tim', 95.8);";
        re.executeSQL(sql);

        // Query the database
        sql = "SELECT id, name, capacity FROM employees;";
        try {
            ResultSet rs = re.returnData(sql);
            // System.out.println(rs.getClass());
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                System.out.println("ID: "+ id + "\t Name: " + name);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        re.closeConnection();
    }
}
