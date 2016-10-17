import processing.video.*;
import themidibus.*;

Capture cam;
MidiBus bus;

PImage img;
String imgName = "img.png";
int imgDimension;

int r, g, b;

void setup() 
{
  size(640, 480);
  
  String[] cameras = Capture.list();
  
  cam = new Capture(this, cameras[0]);
  cam.start();
  
  bus = new MidiBus(this, 0, 1);
  
  makeNewImage();
  
  r = 0;
  g = 0;
  b = 0;
}

void draw() 
{
  //int channel = 0;
  //int pitch = 64;
  //int velocity = 127;

  //bus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  //delay(200);
  //bus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff

  //int number = 0;
  //int value = 90;

  //bus.sendControllerChange(channel, number, value); // Send a controllerChange
  //delay(2000);
  
  set(0, 0, img);
  fill(r, g, b, 100);
  rect(0, 0, width, height);
}

void makeNewImage()
{
  if (cam.available() == true)
    cam.read();
  
  set(0, 0, cam);
  saveFrame("data/img.png");
  
  img = loadImage(imgName);
  img.loadPixels();
  
  imgDimension = img.width * img.height;
  
  for(int i = 0; i < imgDimension; i++)
  {
    if(img.pixels[i] > #474747)
      img.pixels[i] = color(0);
    else
      img.pixels[i] = color(255);
  }
  
  img.updatePixels();
}

void keyPressed()
{
  if(key == ENTER)
    makeNewImage();
}

void controllerChange(int channel, int number, int value)
{
  println(channel);
  println(number);
  println(value);
  
  if(number == 1)
     r = value;
  if(number == 2)
    g = value;
  if(number == 3)
    b = value;
}