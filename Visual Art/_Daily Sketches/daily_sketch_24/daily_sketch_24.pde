//January 22nd, 2016

int shapeCount = 0;
int rad = 200;

float rotx = HALF_PI;
float rotSpeed = PI / 32;
boolean negx = false;

float roty = rotx;

float rotz = 0;

int frame = 0;

void setup()
{
  size(480, 480, P3D);
  ortho();
  stroke(255);
  strokeWeight(10);
  noFill();
  
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw()
{
  background(0);
  
  translate(width / 2, height / 2, 0);
  if(!negx)
    rotateX(rotx);
  else
    rotateX(-rotx);
  rotateY(roty);
  rotateZ(rotz);
  //rotx += rotSpeed;
  //roty += rotSpeed;
  
  if(shapeCount == 0)
    ellipse(0, 0, rad, rad);
  else if(shapeCount == 1)
    rect(0, 0, rad, rad);
  else
  {
    translate(0, -rad * 0.5, 0);
    triangle(-rad * 0.5 - 1, 0, rad * 0.5 + 1, 0, 0, rad);
  }
    
  if(rotx + rotSpeed >= 3 * HALF_PI)
  {
    if(negx)
      negx = false;
    else
      negx = true;
    rotx = HALF_PI;
    //roty *= -1;
    rotz += PI;
    shapeCount++;
  }
  if(shapeCount == 3)
    shapeCount = 0;
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frame + ".gif");
    frame++;
    
    if(frame > 1)
    {
      rotx += rotSpeed;
      roty += rotSpeed;
    }
  }
}