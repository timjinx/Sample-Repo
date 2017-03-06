import java.io.*;
import java.util.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
public class filereader {
   public static void main (String[] args) {
      String p_f = null;
      boolean p_v = false;
      ArrayList<Student> studentArray = new ArrayList<Student>(10);
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
         // Process -v
         if ( args[i].compareTo("-v") == 0 ) {
            p_v = true;
         }
         i++;
      }
      if ( p_f == null ) {
         System.out.println("No file name specified");
         System.exit(-1);
      }
      File infile = new File(p_f);

      if ( ! infile.exists() ) {
         System.out.println("File " + p_f + " not found");
         System.exit(-1);
      }
      try {
         FileReader ifile = new FileReader(p_f);
         BufferedReader buffer = new BufferedReader(ifile);
         String line = "";
         while (( line = buffer.readLine() ) != null ){
           if ( p_v ) {
              System.out.println(line);
           }
           String[] parts = line.split(",");
           Float score = new Float(parts[2]);
           Student s = new Student(parts[1], parts[0], score);
           studentArray.ensureCapacity(5);
           studentArray.add(s);
         }
         buffer.close();
         studentArray.trimToSize();
         Collections.sort(studentArray);
         int j = 0;
         while ( j < studentArray.size() )
         {
           System.out.println("Student " + j + " is " + studentArray.get(j));
           j++;
         }
      }
      catch ( IOException e) {
         System.out.println("A file error occured");
      }
   }
}