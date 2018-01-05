public class Dog
{
  private String name;
  private String breed;
  private int age;
  public Dog (String v_name, String v_breed, int v_age)
  {
    name = v_name;
    breed = v_breed;
    age = v_age;
  }
  public String toString ()
  {
    return name + " the " + age + " year old " + breed;
  }
  public void birthday ()
  {
    age++;
    return;
  }
  public String greet(String message)
  {
    return message + " " + name;
  }
}


  