PVector[] pos;
int rows = 5;
int cols = 5;

float rot = 0;
float rotSpeed = PI / 24;

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  stroke(0);
  noFill();
  strokeWeight(3);
  rectMode(CENTER);
  
  //pos = new PVector[rows * cols];
  //for(int i = 0; i < rows; i++)
  //{
  //  for(int j = 0; j < cols; j++)
  //    pos[i] = new PVector[
  //}
}

void draw()
{
  colorMode(HSB);
  background(150, 150, 150);
  colorMode(RGB);
  
  for(int i = 0; i < rows; i++)
  {
    for(int j = 0; j < cols; j++)
    {
      fill(255);
      //stroke(0);
      pushMatrix();
      translate(width / rows * i + width / rows / 2, height / cols * j + height / cols / 2, 0);
      rotateY(rot);
      rotateX(rot);
      rect(0, 0, width / rows, height / rows);
      popMatrix();
      
      fill(0);
      //stroke(255);
      pushMatrix();
      translate(width / rows * i + width / rows / 2, height / cols * j + height / cols / 2, -10);
      rotateZ(rot);
      rotateX(rot);
      rect(0, 0, width / rows, height / rows);
      popMatrix();
    }
  }
  
  //rot += rotSpeed;
  if(rot >= TWO_PI)
    rot = 0;
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;
    
    if(frameNum >1)
      rot+= rotSpeed;
  }
}