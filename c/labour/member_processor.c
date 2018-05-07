#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#define HELP_MESSAGE helptext(argv[0])

int helptext(char* pname)
{
    fprintf(stderr, "Usage: %s -f <input file> -o <output file>\n", pname);
    exit(EXIT_FAILURE);
}

int main(int argc, char *argv[])
{
    char *infile, *outfile, *line, *token;
    infile = (char *) malloc(200);
    outfile = (char *) malloc(200);
    line = (char *) malloc(2048);
    FILE *ifptr;
    FILE *ofptr;
    int opt, param_count;
    size_t len = 0;
    ssize_t read;
    const char s[2] = ",";
    param_count = 0; /* Prime Counter */
    while ((opt = getopt(argc, argv, "f:o:h?")) != -1) {
        switch (opt) {
        case 'f':
            strcpy(infile, optarg);
            param_count+=7;
            break;
        case 'o':
            strcpy(outfile, optarg);
            param_count+=11;
            break;
        default: /* '?' */
            HELP_MESSAGE;
        }
   }
   if ( param_count != 18 ) HELP_MESSAGE;
   printf("Input file is %s, output file is %s\n", infile, outfile);
   if (strcmp(infile,outfile)==0) {
      puts("Input and output file may not be the same");
      HELP_MESSAGE;
      exit(EXIT_FAILURE);
   }

   while ((ifptr = fopen(infile,"r")) == NULL) {
      puts("Input file can not be opened");
      HELP_MESSAGE;
      exit(EXIT_FAILURE);
   }
   while ((ofptr = fopen(outfile,"w")) == NULL) {
      puts("Output file can not be opened");
      HELP_MESSAGE;
      exit(EXIT_FAILURE);
   }
   while ((read = getline(&line, &len, ifptr)) != -1) {
      token = strtok (line,s);
      while (token != NULL) {
         printf("%s\n",token);
         token = strtok(NULL, s);
      }
      fprintf(ofptr,"%s\n",line);
   }
   fclose(ifptr);
   fclose(ofptr);
   free(infile);
   free(outfile);
   free(line);
   exit(EXIT_SUCCESS);
}

