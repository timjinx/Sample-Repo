#include <iostream>
#include <unistd.h>
#include <stdio.h>
#include <string>
#include <ctime>
#include "clist.hpp"

using namespace std;

int main (int argc, char *argv[])
{
    srand (time(NULL));
    int opt;
    int ccount = 0;
    int fcount = 0;

    while ((opt = getopt(argc, argv, "c:f:?")) != -1) {
        switch (opt) {
        case 'c':
            ccount = atoi(optarg);
            break;
        case 'f':
            fcount = atoi(optarg);
            break;
        default: /* '?' */
            fprintf(stderr, "Usage: %s -c <no. of coins> -f <no. of flips> \n", argv[0]);
            exit(EXIT_FAILURE);
        }
   }
   if (optind > argc) {
        fprintf(stderr, "Expected argument after options\n");
        exit(EXIT_FAILURE);
   }

   Clist* cl1 = new Clist(ccount);
   int CountArray[ccount+1];
   // Set the count array to zero
   for (int i=0; i<ccount+1; i++) {
       CountArray[i]=0;
   }
   time_t t_start = time(0);
   // Flip the coins
   for (int i=0; i<fcount; i++) {
       cl1->flipCoins();
       CountArray[cl1->countHeads()]++;
   }
   time_t t_end = time(0);
   // Display the results
   for (int i=0; i<ccount+1; i++) {
       if ( CountArray[i] > 0 ) {
           cout << "Head Count " << i << "\toccurs " << CountArray[i] << " times" << endl;
       }
   }
   cout << "Run time was " << t_end - t_start << " seconds" << endl;
}