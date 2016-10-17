PVector[][][] pos;
float[][][] speed;
float[][][] delay;
boolean[][][] fall;
int divs = 10;

int initialDelay = 30;
int delayCount = 0;

int frame = 0;

void setup()
{
  size(500, 500, P3D);
  stroke(0);
  fill(255);
  //noFill();
  strokeWeight(2);
  
  pos = new PVector[divs][divs][divs];
  speed = new float[divs][divs][divs];
  delay = new float[divs][divs][divs];
  fall = new boolean[divs][divs][divs];
  for(int i = 0; i < divs; i++)
  {
    for(int j = 0; j < divs; j++)
    {
      for(int k = 0; k < divs; k++)
      {
        pos[i][j][k] = new PVector(width / divs * i, width / divs * j, -width / divs * k);
        speed[i][j][k] = random(10, 20);
        delay[i][j][k] = random(initialDelay, initialDelay * 2);
        fall[i][j][k] = true;
      }
    }
  }
}

void draw()
{
  camera(-150, 0, 750, width / 2, height / 2, -width / 2, 0, 1, 0);
  background(255);
  
  for(int i = 0; i < divs; i++)
  {
    for(int j = 0; j < divs; j++)
    {
      for(int k = 0; k < divs; k++)
      {
        pushMatrix();
        translate(pos[i][j][k].x, pos[i][j][k].y, pos[i][j][k].z);
        box(width / divs);
        
        if(delayCount >= initialDelay)
        {
          if(delayCount >= delay[i][j][k])
          {
            //pos[i][j][k].y += speed[i][j][k];
            if(!fall[i][j][k])
            {
              if(pos[i][j][k].y >= width / divs * j)
                pos[i][j][k].y = width / divs * j;
            }
          }
        }
        
        if(pos[i][j][k].y > height * 2)
        {
          fall[i][j][k] = false;
          pos[i][j][k].y = -height;
        }
          
        popMatrix();
      }
    }
  }
  
  //delayCount++;
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frame + ".gif");
    frame++;
    
    if(frame > 1)
    {
      delayCount++;
      
      for(int i = 0; i < divs; i++)
      {
        for(int j = 0; j < divs; j++)
        {
          for(int k = 0; k < divs; k++)
          {
            if(delayCount >= delay[i][j][k])
            {
              pos[i][j][k].y += speed[i][j][k];
            }
          }
        }
      }
    }
  }
}