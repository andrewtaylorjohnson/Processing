PVector[] pos;
int cubeCount = 9;
float speed = 5;

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  background(0);
  stroke(255);
  //noStroke();
  fill(0);
  //noFill();
  strokeWeight(3);
  
  pos = new PVector[cubeCount];
  pos[0] = new PVector(width * 1/4, height * 1/4);
  pos[1] = new PVector(width * 2/4, height * 1/4);
  pos[2] = new PVector(width * 3/4, height * 1/4);
  pos[3] = new PVector(width * 1/4, height * 2/4);
  pos[4] = new PVector(width * 2/4, height * 2/4);
  pos[5] = new PVector(width * 3/4, height * 2/4);
  pos[6] = new PVector(width * 1/4, height * 3/4);
  pos[7] = new PVector(width * 2/4, height * 3/4);
  pos[8] = new PVector(width * 3/4, height * 3/4);
}

void draw()
{
  background(0);
  
  for(int i = 0; i < cubeCount; i++)
  {
    pushMatrix();
    translate(pos[i].x, pos[i].y);
    box(100);
    popMatrix();
  }
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;
    
    pos[0].x += speed;
    pos[1].x += speed;
    pos[2].y += speed;
    pos[3].y -= speed;
    pos[5].y += speed;
    pos[6].y -= speed;
    pos[7].x -= speed;
    pos[8].x -= speed;
    
    if(pos[0].x == width /2)
    {
      pos[0] = new PVector(width * 1/4, height * 1/4);
      pos[1] = new PVector(width * 2/4, height * 1/4);
      pos[2] = new PVector(width * 3/4, height * 1/4);
      pos[3] = new PVector(width * 1/4, height * 2/4);
      pos[4] = new PVector(width * 2/4, height * 2/4);
      pos[5] = new PVector(width * 3/4, height * 2/4);
      pos[6] = new PVector(width * 1/4, height * 3/4);
      pos[7] = new PVector(width * 2/4, height * 3/4);
      pos[8] = new PVector(width * 3/4, height * 3/4);
    }
  }
}