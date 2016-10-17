import processing.video.*;
import themidibus.*;

//webcam
Capture cam;

//midi interface
MidiBus bus;
float midiMax = 127;

//toggle for what component you're currently manipulating
boolean moveCam = true;

//3D camera settings
float camPosX, camPosY, camPosZ;
float camCenX, camCenY, camCenZ;

//image manipulation fields
float cellDepth = 0;
float maxCellDepth = 2;

//image creation fields
PImage img;
int cellSize = 5;
int cols, rows;

void setup()
{
  size(1280, 720, P3D);
  background(0);
  
  //setup webcam
  String[] cameras = Capture.list();
  cam = new Capture(this, cameras[0]);
  cam.start();
  
  //setup midi
  bus = new MidiBus(this, 0, 1);
  
  //3D camera setup
  camPosX = width / 2;
  camPosY = height / 2;
  camPosZ = 750;
  camCenX = width / 2;
  camCenY = height / 2;
  camCenZ = 0;
  
  img = createImage(width, height, RGB);
  cols = width / cellSize;
  rows = height / cellSize;
}

void draw()
{
  background(0);
  
  //midi controlled camera
  //camera(camPosX, camPosY, camPosZ, camCenX, camCenY, camCenZ, 0, 1, 0);
  //mouse controlled camera
  camera(mouseX, mouseY, 750, width / 2, height / 2, 0, 0, 1, 0);
  
  if(cam.available())
  {
    img.copy(cam, 0, 0, cam.width, cam.height, (width / 2) - (cam.width / 2), (height / 2) - (cam.height / 2), cam.width, cam.height);
    img.updatePixels();
    cam.read();
  }
  
  loadPixels();
  cam.loadPixels();
  img.loadPixels();
  
  //rotateX(2 / PI);
  
  for(int i = 0; i < cols; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      int x = (i * cellSize) + (cellSize / 2);
      int y = (j * cellSize) + (cellSize / 2);
      int index = x + (y * width);
      color c = img.pixels[index];
      
      //midi controlled depth
      //float z = (cellDepth * brightness(img.pixels[index])) - 100;
      //static depth
      float z = brightness(img.pixels[index]) - 100;
      
      pushMatrix();
      
      translate(x, y, z);
      noStroke();
      fill(c);
      box(cellSize);
      
      popMatrix();
    }
  }
}

void controllerChange(int channel, int number, int value)
{
  if(moveCam)
  {
    //change camera position
    if(number == 1)
      camPosX = (value / midiMax) * width;
    if(number == 2)
      camPosY = (value / midiMax) * height;
    if(number == 3)
      camPosZ = (value / midiMax) * width;
      
    //change camera focus
    if(number == 5)
      camCenX = (value / midiMax) * width;
    if(number == 6)
      camCenY = (value / midiMax) * height;
    if(number == 7)
      camCenZ = (value / midiMax) * width;
  }
  else
  {
    if(number == 1)
      cellDepth = (value / midiMax) * maxCellDepth;
  }
}

void noteOn(int channel, int pitch, int velocity)
{
  if(pitch == 48)
    moveCam = !moveCam;
    
  println(pitch);
}