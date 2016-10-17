ArrayList<Polygon> polys;
int numSides = 6;
float growthRate = 2.35;
float speed = 4;
int count = 0;

float yShift = 0;
float ySpeed = 15;

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  background(0);
  noFill();
  strokeWeight(3);
  
  polys = new ArrayList<Polygon>();
  polys.add(new Polygon(width / 2, height / 2, -500, 0, numSides));
}

void draw()
{
  camera(width / 2, 450, 0, width / 2, height / 2, -250, 0, 1, 0);
  background(0);
  
  //yShift += ySpeed;
  //if(yShift > height || yShift < 0)
  //{
  //  ySpeed *= -1;
  //  if(yShift > height)
  //    yShift = height;
  //  else
  //    yShift = 0;
  //}
  
  //count++;
  if(count == 10)
  {
    polys.add(new Polygon(width / 2, height / 2, -500, 0, numSides));
    count = 0;
  }
    
  for(int i = 0; i < polys.size(); i++)
  {
    Polygon poly = polys.get(i);
    stroke(poly.radius);
    
    pushMatrix();
    translate(poly.x, poly.y, poly.z);
    poly.update();
    //poly.z += speed;
    //poly.radius += growthRate;
    popMatrix();
    
    if(poly.radius >= 300)
      polys.remove(i);
  }
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;
    
    //yShift += ySpeed;
    count++;
    
    for(int i = 0; i < polys.size(); i++)
    {
      Polygon poly = polys.get(i);
      
      poly.z += speed;
      poly.radius += growthRate;
    }
  }
}