import themidibus.*;

MidiBus bus;

Cube cube;

float camX = 0;
float camY = 0;
float camZ = -750;

float rotX = 0;
float rotY = 0;
float rotZ = 0;

void setup()
{
  fullScreen(P3D);
  background(255);
  rectMode(CENTER);
  noFill();
  stroke(255);
  strokeWeight(5);
  
  bus = new MidiBus(this, 0, 1);
  
  cube = new Cube();
}

void draw()
{
  background(0);
  
  camera(camX, camY, camZ, 0, 0, 0, 0, 1, 0);
  
  cube.update();
}

void controllerChange(int channel, int number, int value)
{
  if(number == 1)
    camX = value * 2;
  if(number == 2)
    camY = value * 2;
  if(number == 3)
    camZ = value * 2;
}