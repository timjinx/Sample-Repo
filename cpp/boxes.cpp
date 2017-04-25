#include <iostream>

// Class Box stored length, breadth and height
// Class ColouredBox extends Box to store the colour of the box
// ColouredBox has two constructors one taking just the colour
// and one taking colour and the dimensions

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
         if ( (int) length == 0 or (int) breadth == 0 or (int) height == 0 ) {
           return 0;
         } else {
           return length * breadth * height;
         }
      }
};

class ColouredBox: public Box {
   public :
      void setColour(string v_colour) {
         colour = v_colour;
      }
      string getColour() {
         return colour;
      }
      ColouredBox( string v_colour );
      ColouredBox( string v_colour, double v_length, double v_breadth, double v_height );
   private:
      string colour; // The colour of the box
};

ColouredBox::ColouredBox( string v_colour ) {
   colour = v_colour;
}
ColouredBox::ColouredBox( string v_colour, double v_length, double v_breadth, double v_height ) {
   colour = v_colour;
   Box::setLength(v_length);
   Box::setBreadth(v_breadth);
   Box::setHeight(v_height);
}

int main( ) {
   Box Box1;        // Declare Box1 of type Box
   Box Box2;        // Declare Box2 of type Box
   Box Box3;        // Declare Box3 of type Box
   // Declare a box with colour
   ColouredBox Box4("Red");
   // box 5 specification
   // Using the second constructor
   ColouredBox Box5("Blue", 5.0, 6.0, 2.0);
 
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
   // Box3.setColour("Blue"); // This is illegal because it's not a coloured box

   // box 4 specification
   Box4.setHeight(6.0);
   Box4.setLength(3.0);
   Box4.setBreadth(2.0);

   // volume of box 1
   cout << "Volume of Box1 : " << Box1.getVolume() << endl;

   // volume of box 2
   cout << "Volume of Box2 : " << Box2.getVolume() << endl;

   // volume of box 3
   cout << "Volume of Box3 : " << Box3.getVolume() << endl;

   // Box 4
   cout << "Box 4 is " << Box4.getColour() << " and has a volume of " << Box4.getVolume() <<endl;
	
   // Box 5
   cout << "Box 5 is " << Box5.getColour() << " and has a volume of " << Box5.getVolume() <<endl;
	
   return 0;
}
