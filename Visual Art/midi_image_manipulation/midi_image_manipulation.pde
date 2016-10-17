import themidibus.*;

MidiBus bus;

float x, y;
int r, g, b;
float rot;

void setup() 
{
  //fullScreen();
  size(1280, 720);
  background(0);
  noStroke();
  rectMode(CENTER);
  
  bus = new MidiBus(this, 0, 1);
  
  r = 0;
  g = 0;
  b = 0;
  
  x = width / 2;
  y = height / 2;
  
  rot = 0;
}

void draw() 
{
  pushMatrix();
  
  translate(x, y);
  rotate(radians(rot));
  
  background(0);
  fill(r, g, b);
  
  rect(0, 0, width / 3, width / 3);
  
  popMatrix();
}

void controllerChange(int channel, int number, int value)
{
  println(channel);
  println(number);
  println(value);
  
  if(number == 1)
     r = value * 2;
  if(number == 2)
    g = value * 2;
  if(number == 3)
    b = value * 2;
  if(number == 4)
    rot = value;
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  
  fill(pitch);
  rect(0, 0, 10, 10);
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}