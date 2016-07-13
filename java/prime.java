import java.io.*;
import static java.lang.System.*;
import java.util.*;
import java.util.ArrayList;
import java.util.Scanner;
class prime {
 public static void main (String str[]) {
   Scanner scan = new Scanner ( System.in );
   System.out.println("This program finds the largest prime number small than a given number");
   System.out.println("What is the largest number to be considered?");
   long maxno = scan.nextLong();
   if ( maxno < 3 ) {
     System.out.println("The minimum useable number is 3");
     exit(0);
   }
   Date sdate = new Date();
   System.out.println("Finding the largest prime number smaller than " + maxno );
   ArrayList<Long> numbers = new ArrayList<Long>();
   numbers.add((long) 2);
   for ( long i = 3; i <= maxno; i+=2) {
     numbers.add(i);
   }
   System.out.println("Numbers range from " + numbers.get(0) + " to "+  numbers.get(numbers.size() - 1));
   
   ArrayList<Long> result = new ArrayList<Long>();
   while ( numbers.size() > 0 ) {
     result.add(numbers.get(0));
     long curr = (long) numbers.get(0);
     for ( int n=numbers.size() - 1; n>=0; n--) {
       if ( numbers.get(n) % curr == 0 ) {
         numbers.remove(n);
       }
     }
  }
  System.out.println(result.get(result.size() - 1) + " is a prime number");
  if ( result.get(result.size() - 1) < maxno ) {
    System.out.println("There are " + result.size() + " prime numbers smaller than " + maxno);
  } else {
    System.out.println("There are " + result.size() + " prime numbers up to, and including " + maxno);
  }
  Date edate = new Date();
  System.out.println("Start time\t" + sdate.toString());
  System.out.println("End time\t" + edate.toString());
  System.out.println("Searching for prome pairs");
  int i = 1;
  int pp=0;
  long lpp=0;
  while ( i < result.size() ) {
    if ( result.get(i) == result.get(i - 1) +2 ) {
      /* System.out.println(result.get(i - 1) + " and " + result.get(i) + " are a prime pair"); */
      pp++;
      lpp=result.get(i);
    }
    i++;
  }
  System.out.println("We discovered " + pp + " prime pairs");
  System.out.println("Last Prime Pair was " + lpp + " and " + (lpp - 2));
 }
}
