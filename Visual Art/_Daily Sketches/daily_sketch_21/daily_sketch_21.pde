float rot = 0;
float rotSpeed = PI / 16;
int size = 100;
float xOff = size / 2;
float xSpeed = 6.2;

float[] lines;
int lineCount = 10;

int frame = 0;

void setup()
{
  size(500, 500, P3D);
  stroke(0);
  fill(255);
  strokeWeight(3);
  
  lines = new float[lineCount];
  for(int i = 0; i < lineCount; i++)
    lines[i] = width / lineCount * i;
}

void draw()
{
  camera(width / 2, height - 200, 50, width / 2, height, -250, 0, 1, 0);
  background(0);
  
  stroke(0);
  fill(255);
  strokeWeight(3);
  pushMatrix();
  translate(width / 2 + xOff, height - 1, -100);
  rotateX(HALF_PI);
  rotateZ(PI);
  rotateY(-rot);
  rect(0, 0, size, size);
  popMatrix();
  
  stroke(10, 100, 255);
  strokeWeight(2);
  for(float l: lines)
  {
    pushMatrix();
    translate(l, height, 0);
    rotateX(HALF_PI);
    line(0, 100, 0, -height * 10);
    popMatrix();
    
    pushMatrix();
    translate(l - width, height, 0);
    rotateX(HALF_PI);
    line(0, 100, 0, -height * 10);
    popMatrix();
    
    pushMatrix();
    translate(l + width, height, 0);
    rotateX(HALF_PI);
    line(0, 100, 0, -height * 10);
    popMatrix();
    
    pushMatrix();
    translate(l - width * 2, height, 0);
    rotateX(HALF_PI);
    line(0, 100, 0, -height * 10);
    popMatrix();
    
    pushMatrix();
    translate(l + width * 2, height, 0);
    rotateX(HALF_PI);
    line(0, 100, 0, -height * 10);
    popMatrix();
    
    pushMatrix();
    translate(l - width * 3, height, 0);
    rotateX(HALF_PI);
    line(0, 100, 0, -height * 10);
    popMatrix();
    
    pushMatrix();
    translate(l + width * 3, height, 0);
    rotateX(HALF_PI);
    line(0, 100, 0, -height * 10);
    popMatrix();
  }
  
  //for(int i = 0; i < lineCount; i++)
  //{
  //  lines[i] -= xSpeed;
    
  //  if(lines[i] <= 0)
  //    lines[i] = width;
  //}
  
  pushMatrix();
  rotateZ(PI);
  line(0, height, width, height, -width, -width);
  popMatrix();
  
  //rot += rotSpeed;
  //xOff -= xSpeed;
  
  if(rot >= PI)
  {
    rot = 0;
    xOff = size / 2;
  }
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frame + ".gif");
    frame++;
    
    if(frame > 1)
    {
      for(int i = 0; i < lineCount; i++)
        lines[i] -= xSpeed;
      
      rot += rotSpeed;
      xOff -= xSpeed;
    }
  }
}