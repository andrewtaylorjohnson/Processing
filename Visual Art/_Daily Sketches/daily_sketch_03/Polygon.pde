class Polygon
{
  float radius;
  int numSides;
  float angle;
  float rot;
  float rotSpeed;
  
  Polygon(float radius, int numSides, float rot, float rotSpeed)
  {
    this.radius = radius;
    this.numSides = numSides;
    this.rot = rot;
    this.rotSpeed = rotSpeed;

    angle = TWO_PI / numSides;
  }

  void update()
  {
    pushMatrix();
    
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle)
    {
      float sx = cos(a) * radius;
      float sy = sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
    
    popMatrix();
  }
}