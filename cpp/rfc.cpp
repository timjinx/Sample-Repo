#include <iostream>
#include <cmath>
#include <math.h>
#include <string>
#include <string.h>
#include <stdlib.h>
using namespace std;

void help(char *name)
{
	printf("%s -c <value> -lu <unit> -c <value> -cu <unit>\n", name);
	printf("Valid units of capacitance are F, mF, uF, nF or pF\n");
	printf("Valid units of inductance are H, mH, uH, nH, pH\n");
	printf("Defaults are uF and uH\n");
}

double scalec(int value, char *unit)
{
	double scale;

	if ( strcmp(unit, "F" ) == 0 )
		scale = 1; 
	else if ( strcmp(unit, "mF" ) ==0 )
		scale = pow(10, -3);
	else if ( strcmp(unit, "uF" ) == 0 )
		scale = pow(10, -6);
	else if ( strcmp(unit, "nF" ) == 0 )
		scale = pow(10, -9);
	else if ( strcmp(unit, "pF" ) == 0 )
		scale = pow(10, -12);
	else {	
		// Shouldn't get here
		printf("Invalid capacitance unit - %s", unit);
		exit(2);
	}
	return(value * scale);
}

double scalei(int value, char *unit)
{
	double scale;
	if ( strcmp(unit, "H" ) == 0 )
		scale = 1; 
	else if ( strcmp(unit, "mH" ) ==0 )
		scale = pow(10, -3);
	else if ( strcmp(unit, "uH" ) == 0 )
		scale = pow(10, -6);
	else if ( strcmp(unit, "nH" ) == 0 )
		scale = pow(10, -9);
	else if ( strcmp(unit, "pH" ) == 0 )
		scale = pow(10, -12);
	else {	
		// Shouldn't get here
		printf("Invalid inductance unit - %s", unit);
		exit(2);
	}
	return(value * scale);
} 

double calculateValue(double c, double l) {
	const float PI = 3.141592654;
	double freq = 0;
	freq = 1 / (2 * PI * (sqrt(c * l)));
	return freq;
}

void stringFrequency(char* hrfreq, float f)  {
	const char *punits;
	double pvalue;
	
	if (f > (float) pow(10, 9)) {
		pvalue = f / pow(10, 9);
		punits = "Ghz";
	} else if (f >  (float) pow(10, 6)) {
		pvalue = f / pow(10, 6);
		punits = "Mhz";
	} else if (f >  (float) pow(10, 3) ) {
		pvalue = f / pow(10, 3);
		punits = "khz";
	} else {
		pvalue = f;
		punits = "hz";
	}
	sprintf(hrfreq, "%4.3f%s", pvalue, punits);
}

int main(int argc, char** argv)
{
	int linp = 0;
	int cinp = 0;
	char cu[2];
	char lu[2];
	char * hrfreq;
	hrfreq = (char*) malloc(40);
	strcpy(cu,"uF");
	strcpy(lu,"uH");
	int i=1;
	char * programName;
	programName = (char*) malloc(40);
	strcpy( programName, argv[0]);
	
	while (i < argc ) {
		if ( strcmp(argv[i], "-h")==0 ) {
   	    	help(programName);
        	exit(EXIT_SUCCESS);
     	}
		if ( strcmp(argv[i], "-l")==0 ) {
   	    	i++;
        	linp=atoi(argv[i]);
     	}
     	if ( strcmp(argv[i], "-c")==0 ) {
   	    	i++;
        	cinp=atol(argv[i]);
     	}
     	if ( strcmp(argv[i], "-cu")==0 ) {
   	    	i++;
        	strcpy(cu,argv[i]);
     	}
     	if ( strcmp(argv[i], "-lu")==0 ) {
   	    	i++;
        	strcpy(lu, argv[i]);
     	}
     	i++;
	}
	
	if ( linp == 0 || cinp == 0 ) {
		printf("You must enter values for the capacitor and the inductor\n\n");
		help(programName);
		exit(0);
	}
	
	double capacitance=scalec(cinp, cu);
	double inductance=scalei(linp, lu);
	
	float frequency = calculateValue(capacitance, inductance);
	
	printf("Frequency = %.0fHz\n", frequency);

	stringFrequency(hrfreq, frequency);
	printf("Human Readable Frequency = %s\n", hrfreq);
	
	free(programName);
	free(hrfreq);
	
	return 0;
}
