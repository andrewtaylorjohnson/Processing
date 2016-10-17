class Polygon
{
  float radius;
  int numSides;
  float rot;
  
  float angle;
  
  Polygon(float x, float y, float z, float radius, int numSides, float rot)
  {
    this.radius = radius;
    this.numSides = numSides;
    this. rot = rot;
}

  void update()
  {
    angle = TWO_PI / numSides;
    
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