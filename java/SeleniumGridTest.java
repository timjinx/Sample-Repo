import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import java.io.*;

import java.net.MalformedURLException;
import java.net.URL;

public class SeleniumGridTest {
    public static void main(String[] args) throws MalformedURLException {

        String p_f = null;
        int i = 0;
        while (i < args.length ) {
            // Process -f
            if ( args[i].compareTo("-f") == 0 ) {
               i++;
               if ( i < args.length ) {
                   p_f=args[i];
               } else {
                   System.out.println("No file name specified");
                   System.exit(-1);
               }
            }
            i++;
        }
        if ( p_f == null ) {
            System.out.println("No file name specified");
            System.exit(-1);
        }
        System.out.println("File: " + p_f);
        String GRIDURL = "";
        String TESTURL = "";

        try {
            FileReader ifile = new FileReader(p_f);
            BufferedReader buffer = new BufferedReader(ifile);
            String line = "";
            while (( line = buffer.readLine() ) != null ){
                String[] myArray = line.split(",");
                if ( myArray[0].equals( new String("GRIDURL")) ) {
                    GRIDURL = myArray[1];
                }
                if ( myArray[0].equals( new String("TESTURL")) ) {
                    TESTURL = myArray[1];
                }
            }
            System.err.println("Grid URL:\t" + GRIDURL);
            System.err.println("Test URL:\t" + TESTURL);
            buffer.close();
        }
        catch ( IOException e) {
            System.out.println("A file error occured");
            System.exit(-1);
        }

        // Set the desired capabilities
        DesiredCapabilities capabilities = new DesiredCapabilities();
        capabilities.setBrowserName("chrome");

        // Create a new instance of the remote WebDriver
        WebDriver driver = new RemoteWebDriver(new URL(GRIDURL), capabilities);


        // Navigate to a website
        driver.get(TESTURL);

        // Perform any actions or assertions
        System.out.println("Title: " + driver.getTitle());

        // Close the browser
        driver.quit();
    }
}
