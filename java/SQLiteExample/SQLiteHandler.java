import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.SQLException;  
import java.sql.DatabaseMetaData; 
import java.sql.Statement;
import java.sql.ResultSet;

public class SQLiteHandler
{
    private String url;
    private String dblocation = "./databases/";
    Connection conn = null;
    byte[] buffer = new byte[1024];
    void showUrl()
    {
        if ( url != null ) {
            System.out.println(url);
        }
    }
    void setUrl(String v_dbname)
    {
        if ( v_dbname != null ) {
            url = "jdbc:sqlite:" + dblocation + v_dbname;
        }
    }
    void connect() {
        if ( url != null ) {
            // System.out.println("Connecting to " + url);
            try {
                conn = DriverManager.getConnection(url); 
                DatabaseMetaData meta = conn.getMetaData();
                System.out.println("The driver name is " + meta.getDriverName());
                System.out.println("Connection to SQLite has been established."); 
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    void closeConnection() {
        if ( conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            } finally {
                System.out.println("Closed: " + url);
            }
        }
    }
    void executeSQL(String sql) {
        try {
            Statement stmt = conn.createStatement();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ResultSet returnData(String sql) {
        ResultSet resultset = null;
        try {
            Statement stmt = conn.createStatement();
            stmt.execute(sql);
            resultset = stmt.executeQuery(sql);
            return resultset;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return resultset;
        }  
    }
}