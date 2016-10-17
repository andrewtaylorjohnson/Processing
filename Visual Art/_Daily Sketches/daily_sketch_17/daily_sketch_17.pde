PVector[][][] pos;
int subs = 10;

float rot = 0;
float rotSpeed = PI / 64;

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  noStroke();
  fill(255);
  
  pos = new PVector[subs][subs][subs];
  for(int i = 0; i < subs; i++)
  {
    for(int j = 0; j < subs; j++)
    {
      for(int k = 0; k < subs; k++)
        pos[i][j][k] = new PVector(width / subs * i, width / subs * j, width / subs * k);
    }
  }
}

void draw()
{
  background(0, 100, 200);
  
  spotLight(255, 255, 255, width * 1.5, -width * 3, width, -3, 5, -3, PI, 10);
  camera(width * 1.5, -width / 1.5, width, width / 2.5, width / 2, -width / 2, 0, 1, 0);
  
  for(int i = 0; i < subs; i++)
  {
    for(int j = 0; j < subs; j++)
    {
      for(int k = 0; k < subs; k++)
      {
        pushMatrix();
        translate(width / subs * i, width / subs * j, -width / subs * k);
        rotateX(rot * i);
        rotateY(rot * j);
        rotateZ(rot * k);
        box(width / subs);
        popMatrix();
      }
    }
  }
  
  //rot += rotSpeed;
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;
    
    if(frameNum >1)
      rot += rotSpeed;
  }
}