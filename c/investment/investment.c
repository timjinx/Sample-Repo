#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
void helptext(char* p_name)
{
   printf("Usage: %s -a <amount> -i <interest rate> -d <duration> [ -c number of times a year to capitalize] \n", p_name);
}
int main(int argc, char** argv)
{
   double principle=0;
   int duration=0;
   double interest_rate=0;
   int capitalize=1;
   if ( argc < 6 ) {
      helptext(argv[0]);
      exit(-1);
   }
   int i=1;
   double amount;
   while (i < argc ) {
      if ( strcmp(argv[i], "-a")==0 ) {
         i++;
         principle=atof(argv[i]);
      }
      if ( strcmp(argv[i], "-i")==0 ) {
         i++;
         interest_rate=atof(argv[i]);
      }
      if ( strcmp(argv[i], "-d")==0 ) {
         i++;
         duration=atoi(argv[i]);
      }
      if ( strcmp(argv[i], "-c")==0 ) {
         i++;
         capitalize=atoi(argv[i]);
      }
      i++;
   }
   if ( amount == 0 || interest_rate == 0 || duration == 0 ) {
      helptext(argv[0]);
      exit(-1);
   }
   printf("Principle=£%.2f\nInterest=%5.2f%%\nDuration=%d years\n", principle, interest_rate, duration);
   printf("Capitialized %d times a year\n", capitalize);
   amount=principle * ( pow( 1 + ( (interest_rate/100) / capitalize ), (capitalize * duration) ) );
   printf("After %d years your investment will be worth £%.2f\n", duration, amount);
   exit(0);
}
