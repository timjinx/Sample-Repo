import java.io.*;
import java.util.*;
import java.lang.Math.*;
import java.text.*;
public class mortgage {
  public static void main (String[] args) {
    String p_a = null;
    String p_r = null;
    String p_d = null;
    double a = 0; // Loan amount
    double r = 0; // Interest rate
    Integer d = 0; // Load duration
    int i = 0;
    while (i < args.length ) {
       
      // Process -a - loan amount
      if ( args[i].compareTo("-a") == 0 ) {
         i++;
         if ( i < args.length ) {
             p_a=args[i];
         } else {
             System.out.println("No amount specified");
             System.exit(-1);
         }
      }
      // Process -r - loan amount
      if ( args[i].compareTo("-r") == 0 ) {
         i++;
         if ( i < args.length ) {
             p_r=args[i];
         } else {
             System.out.println("No interest rate specified");
             System.exit(-1);
         }
      }
      // Process -d - duration
      if ( args[i].compareTo("-d") == 0 ) {
         i++;
         if ( i < args.length ) {
             p_d=args[i];
         } else {
             System.out.println("No amount specified");
             System.exit(-1);
         }
      }  
      i++;
    }
    a = Double.parseDouble(p_a);
    r = Double.parseDouble(p_r);
    d = Integer.valueOf(p_d);
    double top_line = ( a * r * Math.pow(( 1 + ( r / 100 )),d) );
    double bottom_line = 100 * (( Math.pow((1 + ( r / 100 )),d)) -1);
    double ap = top_line / bottom_line;
    double mp = ap / 12;
    DecimalFormat f = new DecimalFormat("###,###");
    DecimalFormat f2 = new DecimalFormat("###,###.00");
    System.out.println("The amount borrowed is £" + f.format(a));
    System.out.println("The interest rate is " + f.format(r) + "%");
    System.out.println("The loan duration is " + f.format(d) + " years");
    System.out.println("Annual replayments will be £" + f2.format(ap));
    System.out.println("Monthly replayments will be £" + f2.format(mp));
    System.out.println("Total cost of loan is £" + f2.format(( ap * d )));
  }
}