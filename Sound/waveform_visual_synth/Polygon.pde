class Polygon
{
  float x;
  float y;
  float radius;
  int numSides;
  float angle;
  
  float rot;
  float growScale;
  
  float alpha = 255;

  Polygon(float x, float y, float radius, int numSides, float rot)
  {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.numSides = numSides;
    this.rot = rot;

    angle = TWO_PI / numSides;
    
    growScale = 1.05;
    stroke(210);
  }

  void update()
  {
    pushMatrix();
    
    //rotate(radians(rot));
    translate(x + (width / 2), y + (height / 2));
    //rotate(radians(rot));
    
    radius *= growScale;
    
    alpha -= 5 ;
    stroke(255, alpha);
    noFill();
    
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