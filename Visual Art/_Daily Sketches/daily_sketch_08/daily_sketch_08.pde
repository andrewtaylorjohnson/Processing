float[] depth;
int[] size;
int count = 5;

float rot;
float rotSpeed = 25;

int frameNum = -1;

void setup()
{
  size(500, 500, P3D);
  background(0);
  stroke(255);
  strokeWeight(3);
  fill(0);
  
  rot = width / 2;
  
  depth = new float[count + 1];
  size = new int[count + 1];
  for(int i = 1; i <= count; i++)
  {
    depth[i] = i * 50;
    size[i] = i * 125;
  }
}

void draw()
{
  camera(rot, height / 2, 250 + rot, width / 2, height / 2, 0, 0, 1, 0);
  background(0);
  stroke(0);
  fill(255);
  //rot -= rotSpeed;
  
  for(int i = 0; i < count; i++)
  {
    pushMatrix();
    translate(width / 2, height / 2, -depth[i]);
    ellipse(0, 0, size[i], size[i]);
    popMatrix();
  }
  
  pushMatrix();
  translate(width / 2, height / 2, 25);
  noStroke();
  sphere(30);
  popMatrix();
}

void keyPressed()
{
  saveFrame("frame_" + frameNum + ".gif");
  frameNum++;
  
  if(frameNum > 0)
    rot -= rotSpeed;
}