float nScale = 0.02;
float t = 0;
float n;

int xScale = 0;
float x = width / 8;
float y;

int lineCount = 10;

void setup()
{
  size(1280, 720);
  background(0);
  stroke(0);
  noFill();
}

void draw()
{
  for(int i = 0; i < lineCount; i++)
  {
    for(int j = 0; j < width * 7/8; j++)
    {
      n = noise(t);
      y = map(n, 0, 2, 0, height / 4);
      
      line(x, y, x, y);
      
      t += nScale;
      xScale++;
      x = width * xScale / 8;
    }
  }
  
  xScale = 0;
}