float rot = 0;
float rotSpeed = 0.01;

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  background(255);
  stroke(0);
  strokeWeight(5);
  fill(255);
  //noFill();
  sphereDetail(3);
}

void draw()
{
  background(255);
  
  pushMatrix();
  translate(width / 2, height / 2);
  rotateX(rot);
  sphere(200);
  popMatrix();
  
  pushMatrix();
  translate(width / 2, height / 2);
  rotateY(rot);
  sphere(200);
  popMatrix();
  
  pushMatrix();
  translate(width / 2, height / 2);
  rotateZ(rot);
  sphere(200);
  popMatrix();
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    
    rot += rotSpeed;
  }
}