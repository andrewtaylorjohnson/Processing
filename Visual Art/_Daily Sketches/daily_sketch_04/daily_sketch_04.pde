Polygon poly1;
Polygon poly2;
Polygon poly3;

float rotx = 0;
float roty = 0;
float rotz = 0;
float rotSpeed = 0.05;

int size = 100;

int frameNum = 0;

boolean drawbg = false;

void setup()
{
  size(500, 500, P3D);
  strokeWeight(3);
  background(0);
  
  poly1 = new Polygon(size, 4);
  poly2 = new Polygon(size, 4);
  poly3 = new Polygon(size, 4);
}

void draw()
{
  background(0);
  
  noFill();
  stroke(100, 0, 255);
  
  translate(width / 2, height / 2, 100);
  
  rotateX(rotz);
  rotateY(roty);
  rotateZ(rotz);
  
  pushMatrix();
  rotateX(rotx);
  poly1.update();
  popMatrix();
  
  pushMatrix();
  rotateY(roty);
  poly2.update();
  popMatrix();
  
  poly3.update();
}

void keyPressed()
{
  saveFrame("frame_" + frameNum + ".gif");
  frameNum++;
  
  drawbg = true;
  
  rotx += rotSpeed;
  roty += rotSpeed;
  rotz += rotSpeed;
}