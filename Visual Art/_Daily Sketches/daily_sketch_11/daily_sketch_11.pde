float sphereSize;
float boxSize;

float baseRot = -QUARTER_PI / 1.5;

float rot = 0;
float rotSpeed = PI / 32;

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  noStroke();
  fill(255);
  
  sphereSize = 150;
  sphereDetail(100);
  boxSize = 230;
}

void draw()
{
  directionalLight(255, 255, 255, 0.5, 0.75, -1);
  //lights();
  background(255);
  
  translate(width / 2, height / 2);
  //rotateX(baseRot);
  
  sphere(sphereSize);
  
  pushMatrix();
  rotateX(baseRot);
  rotateX(rot);
  box(boxSize);
  popMatrix();
  
  pushMatrix();
  rotateX(baseRot);
  rotateY(rot);
  box(boxSize);
  popMatrix();
  
  pushMatrix();
  rotateX(baseRot);
  rotateZ(rot);
  box(boxSize);
  popMatrix();
  
  //rot += rotSpeed;
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