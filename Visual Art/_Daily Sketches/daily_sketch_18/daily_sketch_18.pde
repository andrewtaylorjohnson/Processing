float rot = 0;
float rotSpeed = PI / 24;

int radius = 100;

float yCam = 0;
float zCam = radius * 3.7;
float camSpeed = 15;

int frameNum = 0;

void setup()
{
  size(480, 480, P3D);
  stroke(0);
  strokeWeight(5);
  noFill();
}

void draw()
{
  background(255);
  camera(-100, yCam, zCam, width / 2, height / 2, zCam, 0, 0, 1);
  //yCam += camSpeed;
  //zCam -= camSpeed;
  
  pushMatrix();
  translate(width / 2, height / 2 - radius / 2, 0);
  rotateX(rot);
  triangle(-radius / 2, 0, radius / 2, 0, 0, -radius * 1.5);
  popMatrix();
  
  pushMatrix();
  translate(width / 2, height / 2 + radius / 2, 0);
  rotateX(-rot);
  triangle(-radius / 2, 0, radius / 2, 0, 0, radius * 1.5);
  popMatrix();
  
  pushMatrix();
  translate(width / 2 - radius / 2, height / 2, 0);
  rotateY(-rot);
  triangle(0, -radius / 2, 0, radius / 2, -radius * 1.5, 0);
  popMatrix();
  
  pushMatrix();
  translate(width / 2 + radius / 2, height / 2, 0);
  rotateY(rot);
  triangle(0, -radius / 2, 0, radius / 2, radius * 1.5, 0);
  popMatrix();
  
  //if(zCam <= 0)
  //{
  // if(rot < THIRD_PI * 1.82)
  //   rot += rotSpeed;
  // else
  //   zCam -= camSpeed * 0.5;
  //}
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;
    
    yCam += camSpeed;
    zCam -= camSpeed;
    
    if(frameNum >1)
    {
      if(zCam <= width / 8)
      {
       if(rot < THIRD_PI * 1.69)
         rot += rotSpeed;
       else
       {
         rot = THIRD_PI * 1.82;
         zCam -= camSpeed * 0.5;
       }
      }
    }
  }
}