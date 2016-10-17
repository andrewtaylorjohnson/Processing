//January 16th, 2016

PVector[][] pos;
int sideCount = 10;
float t = 0;

void setup()
{
  size(480, 480, P3D);
  background(255);
  stroke(0);
  strokeWeight(5);
  noFill();
  
  pos = new PVector[sideCount][sideCount];
  for(int i = 0; i < sideCount; i++)
  {
    for(int j = 0; j < sideCount; j++)
    {
      float y = map(noise(t), 0, 1, 0, height);
      t += 0.01;
      pos[i][j] = new PVector(width / sideCount * i, height - y, -width / sideCount * j);
    }
  }
}

void draw()
{
  background(255);
  //camera(width / 2, height / 2, 500, width / 2, height / 2, -width / 2, 0, 1, 0);
  
  for(int i = 0; i < sideCount; i++)
  {
    for(int j = 0; j < sideCount - 1; j++)
    {
      float y = map(noise(t), 0, 1, 0, height);
      //pos[i][j].y = height - y;
      point(pos[i][j].x, pos[i][j].y, pos[i][j].z);
      //line(pos[i][j].x, pos[i][j].y, pos[i][j + 1].x, pos[i][j + 1].y, pos[i][j].z, pos[i][j + 1].z);
      //pos[i][j] = new PVector(width / sideCount * i, y, width / sideCount * j);
    }
  } 
  
  t += 0.01;
}