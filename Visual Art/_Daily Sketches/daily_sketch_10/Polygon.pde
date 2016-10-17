class Polygon
{
  float radius;
  int numSides;
  
  float angle;
  
  float x, y, z;
  
  Polygon(float x, float y, float z, float radius, int numSides)
  {
    this.radius = radius;
    this.numSides = numSides;

    angle = TWO_PI / numSides;
    
    this.x = x;
    this.y = y;
    this.z = z;
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