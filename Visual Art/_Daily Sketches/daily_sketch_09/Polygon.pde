class Polygon
{
  float radius;
  int numSides;
  float angle;
  
  Polygon(float x, float y, float z, float radius, int numSides)
  {
    this.radius = radius;
    this.numSides = numSides;

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