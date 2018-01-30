#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void helptext(char* p_name)
{
   printf("Usage: %s [--dos2unix,--unix2dos] -i <input file> -o <output file>\n", p_name);
}

void strip(char* v_line)
{
   int len;
   int pos=0; 
   len = strlen(v_line);
   for (pos=len-1; pos>0; pos--) {
      if ( v_line[pos] == '\x0a' || v_line[pos] == '\x0d') {
         v_line[pos]='\x00';
      }
   }
}

int main(int argc, char** argv)
{
   int dos2unix=0;
   int unix2dos=0;
   char *infile;
   char *outfile;
   FILE *ifptr;
   FILE *ofptr;
   char * line = NULL;
   size_t len = 0;
   ssize_t read;
   char *pos;
   unsigned char cr = 0x0d;
   unsigned char lf = 0x0a;

   if ( argc < 5 ) {
      helptext(argv[0]);
      exit(EXIT_FAILURE);
   }
   int i=1;
   while (i < argc ) {
      if ( strcmp(argv[i], "--dos2unix")==0 ) {
         dos2unix=1;
      }
      if ( strcmp(argv[i], "--unix2dos")==0 ) {
         unix2dos=1;
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
   // Check that only one flag is set
   if ( ( dos2unix + unix2dos ) != 1 )  {
      puts("Select either dos2unix or unix2dos");
      helptext(argv[0]);
      exit(EXIT_FAILURE);
   }
   // Check that in input file and the output file are not the same 
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
      strip(line);
      fprintf(ofptr,"%s",line);
      if ( dos2unix == 1 ) {
         fprintf(ofptr, "%c", lf);
      } else {
         fprintf(ofptr, "%c%c", cr, lf);
      }
   }

   fclose(ifptr);
   fclose(ofptr);
   if (line) free(line);
   exit(EXIT_SUCCESS);
}
