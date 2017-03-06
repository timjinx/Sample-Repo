public class Student implements Comparable<Student>
{
  private String first_name = null;
  private String last_name = null;
  private float score = 0;
  public Student (String p_fn, String p_ln, float p_score)
  {
    first_name = p_fn;
    last_name = p_ln;
    score = p_score;
  }
  public String toString()
  {
    return last_name + ", " + first_name + " : " + String.valueOf(score);
  }
  public String getFName() 
  {
    return first_name;
  }
  public String getLName() 
  {
    return last_name;
  }
  public float getScore() 
  {
    return score;
  }
  public int compareTo(Student compareStudent)
  {
    float compareScore = ((Student) compareStudent).getScore();
    String compareFName = ((Student) compareStudent).getFName();
    String compareLName = ((Student) compareStudent).getLName();
    float scores = this.score - compareScore;
    if ( scores > 0 ) {
      return -1;
    }
    if ( scores < 0 ) {
      return 1;
    }
    if ( this.last_name.compareTo(compareLName) != 0 )
    {
      return this.last_name.compareTo(compareLName);
    }
    if ( this.first_name.compareTo(compareFName) != 0 )
    {
      return this.first_name.compareTo(compareFName);
    }
    return 0;
  }
}