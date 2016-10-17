class Kinetics
{
  float x, y, rot;
  float len, tall;
  
  Kinetics(float x, float y, float rot)
  {
    this.x = x;
    this.y = y;
    this.rot = rot;
    
    len = width / 5;
    tall = 25;
  }
  
  void update()
  {
    pushMatrix();
    translate(x, y);
    rotate(radians(frameCount * rot % 360));
    rect(0, 0, len, tall);
    popMatrix();
    
  }
}