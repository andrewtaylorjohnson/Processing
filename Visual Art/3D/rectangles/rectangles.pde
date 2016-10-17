import themidibus.*;

MidiBus bus;

Cube cube;
PVector cen;
int rectSize = 250;

float camX = 0;
float camY = 0;
float camZ = 0;

float rotX;
float rotY;
float rotZ;

float screenWidth;
float knobOffset;

void setup()
{
  fullScreen(P3D);
  background(255);
  fill(0);
  //stroke(0);
  noStroke();
  strokeWeight(3);
  
  bus = new MidiBus(this, 0, 1);
  
  cen = new PVector(rectSize * 3, rectSize * 3, rectSize * 3);
  
  cube = new Cube(cen, rectSize);
  
  rotX = cen.x;
  rotY = cen.y;
  rotZ = cen.z;
  
  screenWidth = rectSize * 6;
  knobOffset = screenWidth / 117;
}

void draw()
{
  background(255);
  
  camera(camX, camY, camZ, rotX, rotY, rotZ, 0, 1, 0);
  
  cube.update();
}

void controllerChange(int channel, int number, int value)
{
  if(number == 1)
    camX = value * knobOffset;
  if(number == 2)
    camY = value * knobOffset;
  if(number == 3)
    camZ = value * knobOffset;
  if(number == 4)
    cube.rectDist = value;
  if(number == 5)
    cube.rotX = value * 1.42;
  if(number == 6)
    cube.rotY = value * 1.42;
  if(number == 7)
    cube.rotZ = value * 1.42;
  if(number == 8)
    cube.rectSize = value * 2;
}