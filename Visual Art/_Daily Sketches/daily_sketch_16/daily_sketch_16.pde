boolean[][] on;
int count = 25;
int dimension = count * count;

int delay = 0;

float xCam;
float yCam;

float xFocus;
float yFocus;
float zFocus = 0;

float depth = 100;

float speed = 7;

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  noStroke();
  
  xCam = width / 2;
  yCam = height / 2;
  
  xFocus = width / 2;
  yFocus = height / 2;
  
  on = new boolean[count][count];
  for(int i = 0; i < count; i++)
  {
    for(int j = 0; j < count; j++)
    {
      float rand = random(0, 1);
      if(rand < 0.5)
        on[i][j] = false;
      else
        on[i][j] = true;
    }
  }
}

void draw()
{
  background(75, 50, 100);
  camera(xCam, yCam, depth, xFocus, yFocus, zFocus, 0, 1, 0);
  
  for(int i = 0; i < count; i++)
  {
    for(int j = 0; j < count; j++)
    {
      if(on[i][j] == true)
        fill(255);
      else
        fill(0);
      
      pushMatrix();
      translate(0, 0, 0);
      rect(width / count * i, height / count * j, width / count, height / count);
      popMatrix();
      
      pushMatrix();
      translate(width, 0, width / count * i);
      rotateY(-HALF_PI);
      rect(0, height / count * j, width / count, height / count);
      popMatrix();
      
      pushMatrix();
      translate(0, height, width / count * j);
      rotateX(HALF_PI);
      rect(width / count * i, 0, width / count, height / count);
      popMatrix();
    }
  }
  
  //delay++;
  if(delay > 2)
  {
    for(int i = 0; i < count; i++)
    {
      for(int j = 0; j < count; j++)
      {
        float rand = random(0, 1);
        if(rand < 0.5)
          on[i][j] = false;
        else
          on[i][j] = true;
      }
    }
  
    delay = 0;
  }
  
  //xCam -= speed;
  //yCam -= speed;
  
  //if(xFocus < width)
  //  xFocus += speed;
  //if(yFocus < height)
  //  yFocus += speed;
  
  //depth += speed;
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;
    
    if(frameNum > 1)
    {
      delay++;
      
      if(frameNum > 15 && frameNum < 50)
      {
        xCam -= speed;
        yCam -= speed;
        
        if(xFocus < width)
          xFocus += speed;
        if(yFocus < height)
          yFocus += speed;
        
        depth += speed;
      }
    }
  }
}