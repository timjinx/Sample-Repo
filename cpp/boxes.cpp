#include <iostream>

using namespace std;

class Box {
   private:
      double length;   // Length of a box
      double breadth;  // Breadth of a box
      double height;   // Height of a box
   public :
      void setLength(double v_length) {
         length = v_length;
      }
      void setBreadth(double v_breadth) {
         breadth = v_breadth;
      }
      void setHeight(double v_height) {
         height = v_height;
      }
      double getVolume() {
         if ( length == 0 or breadth == 0 or height == 0 ) {
           return 0;
         } else {
           return length * breadth * height;
         }
      }
};

class ColouredBox: public Box {
   private:
      string colour; // The colour of the box
   public :
      void setColour(string v_colour) {
         colour = v_colour;
      }
      string getColour() {
         return colour;
      }
};

int main( ) {
   Box Box1;        // Declare Box1 of type Box
   Box Box2;        // Declare Box2 of type Box
   Box Box3;        // Declare Box3 of type Box
   ColouredBox Box4;  // Declare a box with colour
 
   // box 1 specification
   Box1.setHeight(5.0); 
   Box1.setLength(6.0); 
   Box1.setBreadth(7.0);

   // box 2 specification
   Box2.setHeight(10.0);
   Box2.setLength(12.0);
   Box2.setBreadth(13.0);
	
   // box 3 specification
   Box3.setHeight(10.0);
   Box3.setBreadth(13.0);

   // box 4 specification
   Box4.setHeight(6.0);
   Box4.setLength(3.0);
   Box4.setBreadth(2.0);
   Box4.setColour("Red");

   // volume of box 1
   cout << "Volume of Box1 : " << Box1.getVolume() << endl;

   // volume of box 2
   cout << "Volume of Box2 : " << Box2.getVolume() << endl;

   // volume of box 3
   cout << "Volume of Box3 : " << Box3.getVolume() << endl;

   // Box 4
   cout << "Box 4 is " << Box4.getColour() << " and has a volume of " << Box4.getVolume() <<endl;
	
   return 0;
}
