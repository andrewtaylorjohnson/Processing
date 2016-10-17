//January 11th, 2016

PVector[] pos;
int shapeCount = 5;
int size = 75;

float rot = 0;
float rotSpeed = PI / 16;

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  background(0);
  stroke(0);
  //noStroke();
  fill(255);
  //noFill();
  strokeWeight(2);
  
  rectMode(CENTER);
  
  pos = new PVector[shapeCount];
  for(int i = 0; i < shapeCount; i++)
    pos[i] = new PVector(width / 2, height / (shapeCount*2) * (i + 1.25), i * size);
}

void draw()
{
  background(0);
  
  for(int i = 0; i < shapeCount; i++)
  {
    pushMatrix();
    translate(pos[i].x, pos[i].y, pos[i].z);
    rotateZ(QUARTER_PI);
    if(rot < PI)
      rotateX(rot);
    else
      rotateY(rot);
    rect(0, 0, size, size);
    popMatrix();
    
    //rot += rotSpeed;
  }
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;
    
    if(frameNum > 1)
      rot += rotSpeed;
  }
}