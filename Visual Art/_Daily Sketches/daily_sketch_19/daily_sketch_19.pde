int count = 10;

float size;
float growth = 1.75;

float yCam = 0;
float xCam = 0;
float camSpeed = 5;

int frame = 0;

void setup()
{
  size(480, 480, P3D);
  size = count;
  noStroke();
  fill(0);
}

void draw()
{
  camera(xCam, yCam, 50, width / 2, width / 2, -width, 0, 1, 0);
  //xCam += camSpeed;
  //yCam += camSpeed;
  
  background(255);
  
  for(int i = 0; i < count; i++)
  {
    for(int j = 0; j < count; j++)
    {
      for(int k = 0; k < count; k++)
      {
        pushMatrix();
        translate(width / count * i, height / count * j, -width / count * k);
        box(width / size);
        popMatrix();
      }
    }
  }
  
  //size += growth;
  if(size >= count * 6 || size <= 1)
   growth *= -1;
}

void keyPressed()
{
  saveFrame("frame_" + frame + ".gif");
  frame++;
  
  if(frame > 1)
  {
    xCam += camSpeed;
    yCam += camSpeed;
    
    size += growth;
  }
}