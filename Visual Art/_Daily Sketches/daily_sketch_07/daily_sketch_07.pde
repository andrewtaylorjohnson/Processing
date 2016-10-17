 //January 11th, 2016

PVector[] pos;
float[] dir;
float speed = 10;
int shapeCount = 500;
int size = 25;

int frameNum = -1;

void setup()
{
  size(500, 500, P3D);
  background(0);
  stroke(255);
  fill(150, 0, 150);
  
  pos = new PVector[shapeCount];
  dir = new float[shapeCount];
  for(int i = 0; i < shapeCount; i++)
  {
    pos[i] = new PVector(random(-width, width), random(height), random(-width, width));
    dir[i] = random(-1, 1);
    if(dir[i] <= 0)
      dir[i] = -1;
    else
      dir[i] = 1;
  }
}

void draw()
{
  directionalLight(255, 255, 255, 150, 45, 200);
  camera(-60, -60, 100, 0, height / 2, 0, 0, 0, 1);
  background(0);
  
  for(int i = 0; i < shapeCount; i++)
  {
    //pos[i].z += dir[i] * speed;
    if(pos[i].z >= width || pos[i].z <= -width)
    {
      if(dir[i] == 1)
        pos[i].z = -width;
      else
        pos[i].z = width;
    }
    
    pushMatrix();
    translate(pos[i].x, pos[i].y, pos[i].z);
    box(size);
    popMatrix();
  }
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;
    
    if(frameNum > 0)
    {
      for(int i = 0; i < shapeCount; i++)
        pos[i].z += dir[i] * speed;
    }
  }
}