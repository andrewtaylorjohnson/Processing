int ellipseCount = 5;
float baseRad;
float[] xRadii;
float[] yRadii;
float[] xGrowths;
float[] yGrowths;
float rotCount = 180;
int rotDir = 1;

boolean xGrow = false;
boolean yGrow = false;
boolean rotate = false;
boolean asymmGrow = false;

void setup()
{
  //size(1280, 720);
  fullScreen();
  noCursor();
  background(0);
  stroke(255);
  //strokeWeight(2);
  noFill();
  
  baseRad = height - 25;
  
  xRadii = new float[ellipseCount];
  yRadii = new float[ellipseCount];
  for(int i = 0; i < ellipseCount; i++)
  {
    xRadii[i] = baseRad;
    yRadii[i] = baseRad;
  }
  
  xGrowths = new float[ellipseCount];
  yGrowths = new float[ellipseCount];
  for(int i = 0; i < ellipseCount; i++)
  {
    xGrowths[i] = -1;
    yGrowths[i] = -1;
  }
}

void draw()
{
  if(xGrow || yGrow)
  {
    noStroke();
    fill(0, 10);
    rect(0, 0, width, height);
  }
  
  noFill();
  stroke(255);
  
  pushMatrix();
  
  translate(width / 2, height / 2);
  
  //ROTATION
  if(rotate)
  {
    rotate(radians(rotCount * 0.25 % 360));
    rotCount += rotDir;
  }
  else
    rotate(radians(rotCount * 0.25));
  
  //GROWTH
  if(asymmGrow)
  {
    for(int i = 0; i < ellipseCount; i++)
    {
      //stroke(xRadii[i] * 0.25);
      ellipse(0, 0, xRadii[i], yRadii[i]);
      if(xGrow)
      {
        xRadii[i] += (i + 1) * xGrowths[i];
        if(xRadii[i] < 0 || xRadii[i] > baseRad)
          xGrowths[i] *= -1;
      }
        
      //stroke(yRadii[i] * 0.25);
      ellipse(0, 0, yRadii[i], xRadii[i]);
      if(yGrow)
      {
        yRadii[i] += (i + 1) * yGrowths[i];
        if(yRadii[i] < 0 || yRadii[i] > baseRad)
          yGrowths[i] *= -1;
      }
    }
  }
  else
  {
    for(int i = 0; i < ellipseCount; i++)
    {
      //stroke(xRadii[i] * 0.25);
      ellipse(0, 0, xRadii[i], baseRad);
      if(xGrow)
      {
        xRadii[i] += (i + 1) * xGrowths[i];
        if(xRadii[i] < 0 || xRadii[i] > baseRad)
          xGrowths[i] *= -1;
      }
        
      //stroke(yRadii[i] * 0.25);
      ellipse(0, 0, baseRad, yRadii[i]);
      if(yGrow)
      {
        yRadii[i] += (i + 1) * yGrowths[i];
        if(yRadii[i] < 0 || yRadii[i] > baseRad)
          yGrowths[i] *= -1;
      }
    }
  }
  
  popMatrix();
}

void keyPressed()
{
  if(key == 'x' || key == 'X')
  {
    if(xGrow)
      xGrow = false;
    else
      xGrow = true;
  }
  else if(key == 'y' || key == 'Y')
  {
    if(yGrow)
      yGrow = false;
    else
      yGrow = true;
  }
  else if(key == 'r' || key == 'R')
  {
    if(rotate)
      rotate = false;
    else
      rotate = true;
  }
  else if(key == ENTER)
  {
    if(xGrow)
      xGrow = false;
    else
      xGrow = true;
      
    if(yGrow)
      yGrow = false;
    else
      yGrow = true;
  }
  else if(key == 'a' || key == 'A')
  {
    if(asymmGrow)
    {
      asymmGrow = false;
      for(int i = 0; i < ellipseCount; i++)
      {
        xGrowths[i] = -1;
        yGrowths[i] = -1;
      }
    }
    else
    {
      asymmGrow = true;
      for(int i = 0; i < ellipseCount; i++)
      {
        xGrowths[i] = -1;
        yGrowths[i] = -0.5;
      }
    }
  }
  
  if(key == CODED)
  {
    if(keyCode == LEFT)
      rotDir *= -1;
  }
}