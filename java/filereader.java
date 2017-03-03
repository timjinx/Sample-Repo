import java.io.*;
public class filereader {
   public static void main (String[] args) {
      String p_f = null;
      String p_n = null;
      String p_c = null;
      String SUFFIX = ".out";
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
         // Process -n
         if ( args[i].compareTo("-n") == 0 ) {
            i++;
            if ( i < args.length ) {
               p_n=args[i];
            } else {
               System.out.println("No new name specified");
               System.exit(-1);
            }
         }
         // Process -c
         if ( args[i].compareTo("-c") == 0 ) {
            i++;
            if ( i < args.length ) {
               p_c=args[i];
            } else {
               System.out.println("No name to change specified");
               System.exit(-1);
            }
         }
         i++;
      }
      if ( p_f == null ) {
         System.out.println("No file name specified");
         System.exit(-1);
      }
      if ( p_n == null) {
         System.out.println("No new name specified");
         System.exit(-1);
      }
      if ( p_c == null) {
         System.out.println("No name to change specified");
         System.exit(-1);
      }
      File infile = new File(p_f);
      if ( ! infile.exists() ) {
         System.out.println("File " + p_f + " not found");
         System.exit(-1);
      }
      try {
         FileReader ifile = new FileReader(p_f);
         FileWriter ofile = new FileWriter(p_f + SUFFIX);
         BufferedReader buffer = new BufferedReader(ifile);
         BufferedWriter obuffer = new BufferedWriter(ofile);
         String line = "";
         while (( line = buffer.readLine() ) != null ){
            obuffer.write(line.replaceAll(p_c,p_n));
            obuffer.newLine();
         }
         buffer.close();
         obuffer.close();
      }
      catch ( IOException e) {
         System.out.println("A file error occured");
      }
   }
}

