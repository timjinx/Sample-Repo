#include <iostream>
#include <cstdlib>
#include <string>
#include <time.h>

using namespace std;
class Coin
{
    protected :
       int side;
    public :
       Coin(void);
       void setValue (int);
       int getValue (void);
       string toString (void);
       void flip (void);
       ~Coin (void);
};
Coin::Coin (void) { 
    this -> flip();
};
void Coin::flip(void) {
    this -> side = (rand() % 2);
};
int Coin::getValue(void) {
    return side;
};
void Coin::setValue (int v_side) {
    this -> side = v_side;
};
string Coin::toString(void) {
    string myString = "Tails";
    if ( side == 0 ) {
        myString = "Heads";
    } 
    return myString;
};