import java.io.*;
import static java.lang.System.*;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.*;

public class CList
{
    private static ArrayList<Coin> coins = new ArrayList<Coin>();
    public static void Coins()
    {
      coins.add(new Coin());
    }
    public static void Coins(int size)
    {
        if (size <= 0) size=1;
        for (int i=0; i<size; i++)
            coins.add(new Coin());
    }
    public static void flipCoins ()
    {
        for (int i=0; i<coins.size(); i++)
            coins.get(i).flip();
    }
    public static int countHeads ()
    {
        int headcount=0;
        for (int i=0; i<coins.size(); i++) {
            if ( coins.get(i).getValue() == 1) headcount++;
        }
        return headcount;
    }


    public static void main (String str[]) {
        Scanner scan = new Scanner (System.in);
        System.out.println("How many coins?");
        int ccount = scan.nextInt();
        System.out.println("How many flips?");
        int fcount = scan.nextInt();
        
        Date sdate = new Date();

        int CountArray[] = new int[ccount+1];
        for (int i=0; i<CountArray.length; i++) CountArray[i]=0;

        Coins(ccount);
        for (int i=0; i<fcount; i++) {
          flipCoins();
          CountArray[countHeads()]++;
        }
        for (int i=0; i<CountArray.length; i++) {
          if ( CountArray[i] > 0 ) 
              System.out.println("Head Count " + i + "\toccurs " + CountArray[i] + " times");
        }
        Date edate = new Date();
        System.out.println("Start date " + sdate.toString());
        System.out.println("End date " + edate.toString());
    }
}
