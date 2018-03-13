import java.io.*;
import java.util.*;
public class test_dog {
  public static void main (String[] args) {
     Dog my_dog = new Dog("Happy", "Beagle", 6);
     System.out.println(my_dog.greet("Hello"));
     System.out.println(my_dog);
     my_dog.birthday();
     System.out.println(my_dog);
     System.out.println(my_dog.greet("Bye"));
  }
}