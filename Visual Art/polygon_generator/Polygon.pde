class Polygon
{
  float x;
  float y;
  float radius;
  int numSides;
  float angle;
  
  int rot = 0;
  float rotation;

  Polygon(float x, float y, float radius, int numSides, float rotation)
  {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.numSides = numSides;

    angle = TWO_PI / numSides;
    
    this.rotation = rotation;
  }

  void update()
  {
    pushMatrix();
    
    translate(width/ 2, height / 2);
    rotate(radians( 270 + rotation));
    
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle)
    {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
    
    popMatrix();
  }
}