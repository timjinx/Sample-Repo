#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void helptext(char* p_name)
{
   printf("Usage: %s [--dos2unix,--unix2dos] -i <input file> -o <output file>\n", p_name);
}

void strip(char* line)
{
   printf("Line is %s", line);
}

int main(int argc, char** argv)
{
   int dos2unix=0;
   int unix2dos=0;
   char *infile;
   char *outfile;
   char *terminator;
   FILE *ifptr;
   FILE *ofptr;
   char * line = NULL;
   size_t len = 0;
   ssize_t read;
   char *pos;

   if ( argc < 5 ) {
      helptext(argv[0]);
      exit(EXIT_FAILURE);
   }
   int i=1;
   while (i < argc ) {
      if ( strcmp(argv[i], "--dos2unix")==0 ) {
         dos2unix=1;
         terminator="\x0a\x00";
      }
      if ( strcmp(argv[i], "-unix2dos")==0 ) {
         unix2dos=1;
         terminator="\x0d\x0a\x00";
      }
      if ( strcmp(argv[i], "-i")==0 ) {
         i++;
         infile=argv[i];
      }
      if ( strcmp(argv[i], "-o")==0 ) {
         i++;
         outfile=argv[i];
      }
      i++;
   }
   /* Check that in input file and the output file are not the same */
   if (strcmp(infile,outfile)==0) {
      puts("Input and output file may not be the same");
      helptext(argv[0]);
      exit(EXIT_FAILURE);
   }
   while ((ifptr = fopen(infile,"r")) == NULL) {
      puts("Input file can not be opened");
      helptext(argv[0]);
      exit(EXIT_FAILURE);
   }
   while ((ofptr = fopen(outfile,"w")) == NULL) {
      puts("Output file can not be opened");
      helptext(argv[0]);
      exit(EXIT_FAILURE);
   }
   while ((read = getline(&line, &len, ifptr)) != -1) {
      /* printf("Retrieved line of length %zu :\n", read); */
      if (len > 0 && line[len-1] == '\n') line[--len] = '\0';
      if (len > 0 && line[len-1] == '\r') line[--len] = '\0'; 
      strip(&line);
      puts(line);
      /* fputs(terminator, ofptr); */
   }

   fclose(ifptr);
   fclose(ofptr);
   if (line) free(line);
   exit(EXIT_SUCCESS);
}
