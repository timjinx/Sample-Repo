#include <string>
#include <string.h>
#include <fstream>
#include <iostream>
using namespace std;
// Author Tim Jinkerson
// Created 2015
// This is a simple program to demostrate file handling and command line parameters

int main ( int argc, char *argv[] )
{
   string filename;
   string ofilename;
   string fromname;
   string name;
   string line;

   if ( argc != 7 ) {
      printf( "usage: %s filename\n", argv[0] );
      return -1;
   }
   int i = 0;
   while ( i < argc ) {
      if ( strcmp(argv[i], "-f" ) == 0 ) {
         i++;
         if ( i < argc ) {
            filename.assign(argv[i]);
            ofilename.assign(filename + ".out");
         } else {
            cout << "No file name specified" << endl;
            return -1;
         }
      }
      if ( strcmp(argv[i], "-n" ) == 0 ) {
         i++;
         if ( i < argc ) {
            name.assign(argv[i]);
         } else {
            cout << "No new name specified" << endl;
            return -1;
         }
      }
      if ( strcmp(argv[i], "-c" ) == 0 ) {
         i++;
         if ( i < argc ) {
            fromname.assign(argv[i]);
         } else {
            cout << "No name to change specified" << endl;
            return -1;
         }
      }
      i++;
   }
   if ( filename.size() == 0 ) {
      cout << "No file name specified" << endl;
      return -1;
   }
   if ( name.size() == 0 ) {
      cout << "No new name specified" << endl;
      return -1;
   }
   if ( fromname.size() == 0 ) {
      cout << "No name to change specified" << endl;
      return -1;
   }
   cout << "File Name: " << filename << endl;
   cout << "Output File Name: " <<  ofilename << endl;
   cout << "Name: " << name << endl;

   ifstream iptr;
   iptr.open(filename.c_str(), std::ifstream::in);
   if ( ! iptr ) {
      cout << "Unable to read " << filename << endl;
      return -1;
   }
   ofstream optr;
   optr.open (ofilename.c_str(), std::ofstream::out);
   if ( ! optr ) {
      cout << "Unable to write to " << ofilename << endl;
      return -1;
   }
   while ( ! iptr.eof() ) {
      getline( iptr, line);
      while ( line.find(fromname) < line.length() ) {
         line.assign(line.substr(0,line.find(fromname)) + name
              + line.substr(line.find(fromname) + fromname.length()));
      }
      optr << line << endl;
   }
   iptr.close();
   optr.close();
}
