int tileSize;
int tileCount;

PVector[] tilePos;
float currentX;
float currentY;

int frameNum = 0;

void setup()
{
  size(1280, 992);
  background(0);
  stroke(255);
  fill(255);
  rectMode(CENTER);
  
  tileSize = 8;
  tileCount = 25000;
  
  tilePos = new PVector[tileCount];
  currentX = width / 2;
  currentY = height / 2;
  
  generate();
}

void draw()
{
  background(100);
  
  currentX = width / 2;
  currentY = width / 2;
  
  for(PVector p: tilePos)
  {
    rect(p.x, p.y, tileSize, tileSize);
  }
}

void generate()
{
  for(int i = 0; i < tileCount; i++)
  {
    tilePos[i] = new PVector(currentX, currentY);
    
    float dir = random(0, 1);
    if(dir <= 0.25)
    {
      if(currentY > tileSize*4)
        currentY -= tileSize;
      else
        currentY += tileSize;
    }
    else if(dir > 0.25 && dir <= 0.5)
    {
      if(currentY < height - (tileSize*4))
        currentY += tileSize;
      else
        currentY -= tileSize;
    }
    else if(dir > 0.5 && dir <= 0.75)
    {
      if(currentX > tileSize*4)
        currentX -= tileSize;
      else
        currentX += tileSize;
    }
    else
    {
      if(currentX < width - (tileSize*4))
        currentX += tileSize;
      else
        currentX -= tileSize;
    }
  }
}

void keyPressed()
{
  if(keyCode == ENTER)
  {
    saveFrame("frame_" + frameNum + ".png");
    frameNum++;
    generate();
  }
  else if(keyCode == UP)
    generate();
}