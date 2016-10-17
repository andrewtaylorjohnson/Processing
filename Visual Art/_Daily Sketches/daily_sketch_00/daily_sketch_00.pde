int detail = 10;
float size;
float rotSpeed = 0.05;

float rot = 0;

color bg = color(0);
color sphereStroke = color(255);
color boxStroke = color(100, 0, 255);

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  background(bg);
  //stroke(255);
  noFill();
  noCursor();
  
  size = width / 5.5;
}

void draw()
{
  background(0);
  //fill(0, 25);
  //noStroke();
  //rect(0, 0, width, height);
  //noFill();
  
  pushMatrix();
  
  translate(width / 2, height / 2, size * 1.5);
  
  rotateX(-rot);
  rotateY(-rot);
  rotateZ(-rot);
  
  strokeWeight(1);
  stroke(255);
  sphereDetail(detail);
  sphere(size);
  
  popMatrix();
  
  pushMatrix();
  
  translate(width / 2, height / 2, size * 1.5);
  
  rotateX(rot);
  rotateY(rot);
  rotateZ(rot);
  
  noFill();
  strokeWeight(3);
  stroke(boxStroke);
  box(size * 1.65);
  
  //rot += rotSpeed;
  
  popMatrix();
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;
    rot += rotSpeed;
  }
}