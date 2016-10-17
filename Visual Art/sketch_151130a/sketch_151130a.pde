GeoPlane plane;

void setup()
{
  size(1280, 720);
  noFill();
  stroke(255);
  
  plane = new GeoPlane();
}

void draw()
{
  background(0);  

  plane.update();
}