Polygon[] polys;
int polyCount = 25;

int size = 200;
int numSides = 6;

int frameNum = 26;

void setup()
{
  size(500, 500, P3D);
  background(255);
  stroke(0);
  noFill();
  strokeWeight(5);
  
  polys = new Polygon[polyCount];
  for(int i = 0; i < polyCount; i++)
    polys[i] = new Polygon(size, numSides, 0, 0.005 * i);
}

void draw()
{
  background(255);
  
  translate(width / 2, height / 2);
  for(int i = 0; i < polyCount; i++)
  {
    pushMatrix();
    rotateY(polys[i].rot);
    //polys[i].rot += polys[i].rotSpeed;
    polys[i].update();
    popMatrix();
  }
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;
    
    //for(int i = 0; i < polyCount; i++)
    //  polys[i].rot += polys[i].rotSpeed;
  }
}