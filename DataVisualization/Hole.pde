class Hole
{
  float xpos;
  float ypos;
  float r=0;
  float speed;
  float max_r;
  boolean del = false;
  
  Hole(float temp_xpos, float temp_ypos, int temp_time)
  {
    xpos = temp_xpos;
    ypos = temp_ypos;
    max_r = temp_time;
    speed = 1f;
    
  }
  
  void display()
  {
    noFill();
    stroke(255);
    ellipse(xpos, ypos, r, r);
  }
  
  void move()
  {
    r += speed;
    if (max_r < r)
    {
      del = true;
    }
  }
}
