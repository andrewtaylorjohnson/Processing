// January 14th 2016

Cuboid c1;
Cuboid c2;
Cuboid c3;

float rot;
float yRot = 0;
float rotSpeed = 20;

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  noStroke();
  fill(255);
  
  rot = width / 2;
  
  c1 = new Cuboid(width / 4, height / 4, 0, width / 2, 25, 50, 0, 0, 0);
  c2 = new Cuboid(width / 4 - 85, height / 4 - 25, 250, width * 0.794, 45, 65, 0, 0, THIRD_PI);
  c3 = new Cuboid(width / 2 + 15, height  * 3 / 4 + 150, 500, width + 65, 65, 100, 0, 0, -THIRD_PI);
}

void draw()
{
  directionalLight(255, 255, 255, 2.5, -2.5, -10);
  camera(rot, height / 2 + yRot, 350, width / 2, height / 2, -250, 0, 1, 0);
  //rot += rotSpeed;
  //yRot += rotSpeed / 3;
  
  if(rot < width / 2)
  {
    rotSpeed *= -1;
    rot = width / 2;
  }
  else if(rot > width * 2)
  {
    rotSpeed *= -1;
    rot = width * 2;
  }
  
  colorMode(HSB);
  background(125, 150, 150);
  colorMode(RGB);
  
  c1.update();
  c2.update();
  c3.update();
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("/frames/frame_" + frameNum + ".gif");
    frameNum++;
    
    if(frameNum > 1);
    {
      rot += rotSpeed;
      yRot += rotSpeed / 3;
    }
  }
}