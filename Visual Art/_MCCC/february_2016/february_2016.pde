//mccc february 1st iteration

color[] colors = {#331940, #5E366A, #0CCA98, #00FFCC};

color[][] pxls;

void setup()
{
  size(500, 500, P3D);
  noStroke();
  noFill();
  rectMode(CENTER);
  
  pxls = new color[width][height];
  for(int i = 0; i < width; i++)
  {
    for(int j = 0; j < height; j++)
    {
      int rand = (int) random(0, 4);
      pxls[i][j] = colors[rand];
    }
  }
}

void draw()
{
  for(int i = 0; i < width; i++)
  {
    for(int j = 0; j < height; j++)
    {
      int rand = (int) random(0, 4);
      pxls[i][j] = colors[rand];
      fill(pxls[i][j]);
      rect(i, j, 1, 1);
    }
  }
}