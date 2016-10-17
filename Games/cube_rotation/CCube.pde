class CCube
{
  color[] colors;
  color col;
  PVector dir;
  PVector pos;
  int side;
  float speed;
  int diam = 50;
  
  float startDist = 1000;
  
  CCube(float speed)
  {
    this.speed = speed;
    
    colors = new color[6];
    colors[0] = color(255, 0, 0);
    colors[1] = color(0, 0, 255);
    colors[2] = color(0, 255, 255);
    colors[3] = color(255, 255, 0);
    colors[4] = color(0, 255, 0);
    colors[5] = color(255, 0, 255);
    
    newColor();
    newSide();
  }
  
  void update()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    pos.x += dir.x;
    pos.y += dir.y;
    pos.z += dir.z;
    stroke(255, 255, 255);
    fill(col);
    box(diam * 2);
    popMatrix();
  }
  
  void newColor()
  {
    float randColor = random(1.2);
    if(randColor < 0.2)
      col = colors[0];
    else if(randColor >= 0.2 && randColor < 0.4)
      col = colors[1];
    else if(randColor >= 0.4 && randColor < 0.6)
      col = colors[2];
    else if(randColor >= 0.6 && randColor < 0.8)
      col = colors[3];
    else if(randColor >= 0.8 && randColor < 1)
      col = colors[4];
    else
      col = colors[5];
  }
  
  void newSide()
  {
    float randDir = random(1.2);
    if(randDir < 0.2)
    {
      pos = new PVector(-startDist, 0, 0);
      dir = new PVector(speed, 0, 0);
      side = 0;
    }
    else if(randDir >= 0.2 && randDir < 0.4)
    {
      pos = new PVector(0, 0, startDist);
      dir = new PVector(0, 0, -speed);
      side = 1;
    }
    else if(randDir >= 0.4 && randDir < 0.6)
    {
      pos = new PVector(startDist, 0, 0);
      dir = new PVector(-speed, 0, 0);
      side = 2;
    }
    else if(randDir >= 0.6 && randDir < 0.8)
    {
      pos = new PVector(0, 0, -startDist);
      dir = new PVector(0, 0, speed);
      side = 3;
    }
    else if(randDir >= 0.8 && randDir < 1)
    {
      pos = new PVector(0, -startDist, 0);
      dir = new PVector(0, speed, 0);
      side = 4;
    }
    else
    {
      pos = new PVector(0, startDist, 0);
      dir = new PVector(0, -speed, 0);
      side = 5;
    }
  }
}