import java.lang.Math;
public class Coin
{
  private int side;

  public Coin ()
  {
    // setValue(0);
    flip();
  }
  public void setValue (int v)
  {
    if (v == 0 || v == 1)
      side = v;
  }
  public String toString ()
  {
    String myString="";
    if (side == 1) {
      myString="Heads";
    }
    else {
      myString="Tails";
    }
    return myString;
  }
  public int getValue()
  {
    return side;
  }
  public void flip()
  {
    side=(int) (Math.random()*2);
  }
}