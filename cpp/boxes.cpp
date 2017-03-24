#include <iostream>

using namespace std;

class Box {
   private:
      double length;   // Length of a box
      double breadth;  // Breadth of a box
      double height;   // Height of a box
   public :
      void   setLength(double);
      void   setBreadth(double);
      void   setHeight(double);
      double getVolume();
};
void Box::setLength(double v_length) {
   length = v_length;
}
void Box::setBreadth(double v_breadth) {
   breadth = v_breadth;
}
void Box::setHeight(double v_height) {
   height = v_height;
}
double Box::getVolume() {
   if ( length == 0 or breadth == 0 or height == 0 ) {
     return 0;
   } else {
     return length * breadth * height;
   }
}

int main( ) {
   Box Box1;        // Declare Box1 of type Box
   Box Box2;        // Declare Box2 of type Box
   Box Box3;        // Declare Box3 of type Box
 
   // box 1 specification
   Box1.setHeight(5.0); 
   Box1.setLength(6.0); 
   Box1.setBreadth(7.0);

   // box 2 specification
   Box2.setHeight(10.0);
   Box2.setLength(12.0);
   Box2.setBreadth(13.0);
	
   // box 2 specification
   Box2.setHeight(10.0);
   Box2.setBreadth(13.0);

   // volume of box 1
   cout << "Volume of Box1 : " << Box1.getVolume() << endl;

   // volume of box 2
   cout << "Volume of Box2 : " << Box2.getVolume() << endl;

   // volume of box 3
   cout << "Volume of Box3 : " << Box3.getVolume() << endl;
	
   return 0;
}
