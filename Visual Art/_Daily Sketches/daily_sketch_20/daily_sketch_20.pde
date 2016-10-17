int count = 15;

float rot = 0;
float rotSpeed = PI / 48;

int frame = 0;

void setup()
{
  size(480, 480, P3D);
  stroke(0);
  noStroke();
  noFill();
}

void draw()
{
  lights();
  camera(width * 2/3, height  * 2/3, 500, width / 2, height / 2, 0, 0, 1, 0);
  colorMode(RGB);
  background(0);
  colorMode(HSB);
  
  for(int i = 0; i < count + 1; i++)
  {
    for(int j = 0; j < count + 1; j++)
    {
      fill(i * 255 / count, j * 255 / count, i * j * 2);
      
      pushMatrix();
      translate(width / count * i, width / count * j, - i * j);
      rotateX(rot);
      rotateY(rot);
      rotateZ(rot);
      box(width / count);
      popMatrix();
    }
  }
  
  //rot += rotSpeed;
}

void keyPressed()
{
  saveFrame("frame_" + frame + ".gif");
  frame++;
  
  if(frame > 1)
    rot += rotSpeed;
}