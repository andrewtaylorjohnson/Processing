class Polygon
{
  float x;
  float y;
  float radius;
  int numSides;
  float angle;
  
  boolean rotate;
  int rot = 0;
  float rotSpeed;
  float growScale;

  Polygon(float x, float y, float radius, int numSides, float rotSpeed, boolean rotate)
  {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.numSides = numSides;

    angle = TWO_PI / numSides;
    
    this.rotate = rotate;
    this.rotSpeed = rotSpeed;
    growScale = 1.0125;
    stroke(255);
  }

  void update()
  {
    pushMatrix();
    
    translate(x + (width / 2), y + (height / 2));
    if(rotate)
      rotate(radians(rot * rotSpeed % 360));
    
    radius *= growScale;
    rot++;
    
    stroke(0 +  (radius / 2));
    
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