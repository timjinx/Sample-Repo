#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
void helptext(char* p_name)
{
   printf("Usage: %s -a <amount> -i <interest rate> -d <duration>\n", p_name);
}
int main(int argc, char** argv)
{
   int amount=0;
   int duration=0;
   double interest_rate, rm, dm;
   double top_line, bottom_line, mp, ap;
   if ( argc < 6 ) {
      helptext(argv[0]);
      exit(-1);
   }
   int i=1;
   while (i < argc ) {
      if ( strcmp(argv[i], "-a")==0 ) {
         i++;
         amount=atoi(argv[i]);
      }
      if ( strcmp(argv[i], "-i")==0 ) {
         i++;
         interest_rate=atof(argv[i]);
      }
      if ( strcmp(argv[i], "-d")==0 ) {
         i++;
         duration=atoi(argv[i]);
      }
      i++;
   }
   if ( amount == 0 || interest_rate == 0 || duration == 0 ) {
      helptext(argv[0]);
      exit(-1);
   }
   printf("Amount=£%d\nInterest=%5.2f%%\nDuration=%d years\n", amount, interest_rate, duration);

   rm = interest_rate / 12;
   dm = duration * 12;

   top_line = ( amount * rm * pow(( 1 + ( rm / 100 )),dm) );
   bottom_line = 100 * ( pow((1 + ( rm / 100 )),dm) -1);

   mp = top_line / bottom_line;
   ap = mp * 12;
   printf("Annual replayments will be £%8.2f\n", ap);
   printf("Monthly replayments will be £%7.2f\n", mp);
   printf("Total cost of loan is £%8.2f\n", (ap * duration));
   exit(0);
}
