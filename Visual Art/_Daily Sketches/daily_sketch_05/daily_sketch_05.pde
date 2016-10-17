PVector[][] pos;
int rows = 10;
int cols = 10;
int boxCount = rows * cols;

int size = 25;

float[][] rots;
int[][] delay;
int delayCount = 0;
float rotSpeed = PI / 64;

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  background(0);
  stroke(255);
  //noStroke();
  noFill();
  //fill(0);
  
  pos = new PVector[rows][cols];
  rots = new float[rows][cols];
  delay = new int[rows][cols];
  for(int i = 1; i < rows; i++)
  {
    for(int j = 1; j < cols; j++)
    {
      pos[i][j] = new PVector(width / rows * i, height / cols * j);
      rots[i][j] = 0;
      delay[i][j] = (i + j) * 3;
    }
  }
}

void draw()
{
  background(0);
  
  for(int i = 1; i < rows; i++)
  {
    for(int j = 1; j < cols; j++)
    {
      pushMatrix();
      translate(pos[i][j].x, pos[i][j].y);
      rotateX(rots[i][j]);
      rotateY(rots[i][j]);
      rotateZ(rots[i][j]);
      //if(delay[i][j] > delayCount)
      //{
      //  rots[i][j] += rotSpeed;
      //}
      box(size);
      popMatrix();
    }
  }
  
  //delayCount++;
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;
    
    if(frameNum > 1)
    {
      for(int i = 1; i < rows; i++)
      {
        for(int j = 1; j < cols; j++)
        {
          if(delay[i][j] > delayCount)
          {
            rots[i][j] += rotSpeed;
          }
        }
      }
      
      delayCount++;
    }
  }
}