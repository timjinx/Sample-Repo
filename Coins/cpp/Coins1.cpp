#include <string>
#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

class Coin
{
   int side;
   public:
      void setValue (int v) {
         srand( (int) time(0));
         if (v == 0 || v == 1 ) {
            side = v;
         }
      }
      string toString () {
         string myString;
         if (side == 1) {
            myString="Heads";
         } else {
            myString="Tails";
         }
         return myString;
      }
      void flip() {
         side = ( rand() % 2) + 1;
      }
      int getValue () { return side; }
};

int main()
{
   Coin mycoin;
   mycoin.setValue( 1 );
   cout << "My coin has a value of " << mycoin.getValue() << endl;
   cout << "My coin is " << mycoin.toString() << endl;
   mycoin.flip();
   cout << "My coin is " << mycoin.toString() << endl;
   mycoin.flip();
   cout << "My coin is " << mycoin.toString() << endl;
   mycoin.flip();
   cout << "My coin is " << mycoin.toString() << endl;
   return 0;
}

