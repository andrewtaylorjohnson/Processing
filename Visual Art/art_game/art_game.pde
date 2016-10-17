import processing.video.*;

Capture cam;

int effectNum = 2;

void setup()
{
  fullScreen();
  //bg = loadImage("deep_field.jpg");
  //bg.resize(width, 0);
  
  String[] cameras = Capture.list();
  
  cam = new Capture(this, cameras[0]);
  cam.start();
}

void draw()
{
  if(cam.available())
    cam.read();
    
 image(cam, 0, 0, width, width * 4/5);
 
 loadPixels();
 
 for(int i = 0; i < width * height; i++)
   pixels[i] = color(pixels[i] / effectNum);
 
 updatePixels();
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP)
      effectNum++;
  }
}