int boxSize = 200;

float rot = 0;
float rotSpeed = PI / 24;

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  noStroke();
  fill(255);
}

void draw()
{
  directionalLight(255, 255, 255, 5, 7, -10);
  colorMode(HSB);
  background(0, 150, 150);
  
  colorMode(RGB);
  fill(255);
  
  translate(width / 2, height / 2);

  rotateX(rot);
  rotateY(rot);
  //rot += rotSpeed;

  if (rot >= TWO_PI)
    rot = 0;

  pushMatrix();
  rotateX(QUARTER_PI);
  box(boxSize);
  popMatrix();

  pushMatrix();
  rotateY(QUARTER_PI);
  box(boxSize);
  popMatrix();

  pushMatrix();
  rotateZ(QUARTER_PI);
  box(boxSize);
  popMatrix();
}

void keyPressed()
{
  if (key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;

    if (frameNum > 1)
    rot += rotSpeed;
  }
}