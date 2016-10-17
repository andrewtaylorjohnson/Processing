float[] xPos;
float[] yPos;

int count = 100;
int[] dir;

int rad = 10;

boolean symmetry = false;

int frame = 0;

void setup()
{
  //size(1280, 720);
  fullScreen();
  background(255);
  rectMode(CENTER);
  
  xPos = new float[count];
  yPos = new float[count];
  dir = new int[count];
  for(int i = 0; i < count; i++)
  {
    xPos[i] = width / 2;
    yPos[i] = height / 2;
    
    float rand = random(1);
    if(rand <= 0.25)
      dir[i] = 0;
    else if(rand > 0.25 && rand <= 0.5)
      dir[i] = 1;
    else if(rand > 0.5 && rand <= 0.75)
      dir[i] = 2;
    else
      dir[i] = 3;
  }
}

void draw()
{
  fill(255, 25);
  rect(width / 2, height / 2, width, height);
  
  fill(0);
  
  for(int i = 0; i < count; i++)
  {
    if(xPos[i] < 0)
      xPos[i] = width + xPos[i];
    else if(xPos[i] > width)
      xPos[i] = xPos[i] - width;
      
    if(yPos[i] < 0)
      yPos[i] = height + yPos[i];
    else if(yPos[i] > height)
      yPos[i] = yPos[i] - height;
    
    if(!symmetry)
      rect(xPos[i], yPos[i], rad, rad);
    else
    {
      rect(xPos[i], yPos[i], rad, rad);
      rect(width - xPos[i], height - yPos[i], rad, rad);
      rect(width - xPos[i], yPos[i], rad, rad);
      rect(xPos[i], height - yPos[i], rad, rad);
    }
    
    float rand1 = random(1);
    float rand2 = random(1);
    if(rand1 <= rand2)
    {
      float rand3 = random(1);
      if(rand3 > 0.95)
      {
        if(dir[i] < 3)
          dir[i]++;
        else
          dir[i] = 0;
      }
      
      switch(dir[i])
      {
        case 0:
          xPos[i] += rad;
          break;
        case 1:
          xPos[i] += rad;
          break;
        case 2:
          xPos[i] -= rad;
          break;
        case 3:
          xPos[i] -= rad;
          break;
      }
    }
    else
    {
      float rand3 = random(1);
      if(rand3 > 0.75)
      {
        if(dir[i] < 3)
          dir[i]++;
        else
          dir[i] = 0;
      }
      
      switch(dir[i])
      {
        case 0:
          yPos[i] += rad;
          break;
        case 1:
          yPos[i] -= rad;
          break;
        case 2:
          yPos[i] += rad;
          break;
        case 3:
          yPos[i] -= rad;
          break;
      }
    }
  }
}

void keyPressed()
{
  if(key == 's')
  {
    if(symmetry)
      count = 100;
    else
      count = 25;
      
    symmetry = !symmetry;
  }
}