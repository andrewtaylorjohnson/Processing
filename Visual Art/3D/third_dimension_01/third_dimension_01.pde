//////////////////////////////////////////////////////
//////////////////////TO DO://////////////////////////
//////create labelling system for midi controller/////
//////////shrink scale so camera not as jumpy/////////
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////

import themidibus.*;

MidiBus bus;

ArrayList<Shape> shapes; //ArrayList for storing all the shapes
int shapeCount = 100; //number of shapes

float xPos, yPos, zPos, xCen, yCen, zCen; //parameters for the camera
float xOff, yOff, zOff; //variables for setting the range of the midi knobs

float lightX, lightY, lightZ, lightHue, lightSat; // parameters for the spotlight

boolean lights = false;
boolean stroke = false;
boolean white = false;
boolean rotate = false;

int superSize;

void setup() 
{
  //size(1280, 720, P3D);
  fullScreen(P3D);
  noCursor();
  colorMode(HSB);
  noStroke();
  
  bus = new MidiBus(this, 0, 1);
  
  shapes = new ArrayList<Shape>();
  for(int i = 0; i < shapeCount; i++)
  {
    float xPos = random(25, superSize - 25);
    float yPos = random(25, superSize - 25);
    float zPos = random(25, superSize - 25);
    
    shapes.add(new Shape(1, 25, xPos, yPos, zPos, 
      random(0, 2), random(0, 2), random(0, 2), 0, 0, random(-1, 1)));
  }
  
  xPos = 0;
  yPos = 0;
  zPos = 0;
  xCen = width / 2;
  yCen = width / 2;
  zCen = superSize / 2;
  
  xOff = abs(superSize * 2) / 127;
  yOff = abs(superSize) / 127;
  zOff = 1250 / 127;
  
  lightX = 0;
  lightY = 0;
  lightZ = 0;
  lightHue = 0;
  lightSat = 0;
  
  superSize = width;
}

void draw() 
{
  background(0);
  
  camera(xPos, yPos, zPos, xCen, yCen, zCen, 0, 0, 1);
  
  if(white)
  {
    stroke(0);
    fill(255);
  }
  else
  {
    if(lights)
      lights();
    else
      spotLight(lightHue, lightSat, 255, lightX, lightY, lightZ, width / 2, height / 2, superSize / 2, 1, 2);
  }
    
  for(Shape s: shapes)
  {
    if(s.x > width || s.x < 0)
      s.xDir *= -1;
    if(s.y > height || s.y < 0)
      s.yDir *= -1;
    if(s.z > superSize || s.z < superSize)
      s.zDir *= -1;
    pushMatrix();
    if(stroke)
    {
      if(s.type == 1)
        stroke(255);
      else
        noStroke();
      s.update();
    }
    else
      s.update();
    popMatrix();
  }
  stroke(255);
  noFill();
  box(superSize);
}

void controllerChange(int channel, int number, int value)
{
  if(number == 1)
    xPos = value * xOff;
  if(number == 2)
    yPos = value * yOff;
  if(number == 3)
    zPos = -(value * zOff);
  
  if(number == 5)
    lightX = value * xOff;
  if(number == 6)
    lightY = value * yOff;
  if(number == 7)
    lightZ = value * zOff;
    
  if(number == 4)
    lightHue = value * 2;
  if(number == 8)
    lightSat = value * 2;
}

void noteOn(int channel, int pitch, int velocity)
{
  if(pitch == 44) // toggle stroke
  {
    if(stroke)
    {
      stroke = false;
      noStroke();
    }
    else
      stroke = true;
  }
  if(pitch == 45) // toggle base lighting
  {
    if(lights)
      lights = false;
    else
      lights = true;
  }
  if(pitch == 46) // toggle white
  {
    if(white)
      white = false;
    else
      white = true;
  }
  if(pitch == 47)
  {
    if(rotate)
    {
      for(Shape s: shapes)
        s.rotate = false;
      rotate = false;
    }
    else
    {
      for(Shape s: shapes)
        s.rotate = true;
      rotate = true;
    }
  }
}