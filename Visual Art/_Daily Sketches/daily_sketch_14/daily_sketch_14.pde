Cuboid c1, c2, c3, c4;

float speed = 5;

int frameNum = 0;

void setup()
{
  size(500, 500, P3D);
  stroke(255);
  noFill();
  
  c1 = new Cuboid(width / 5, height / 5, 0, width / 4, height / 4, width / 4, 0, 0, 0);
  c2 = new Cuboid(width * 3/5, height / 5, 0, width / 4, height / 4, width / 4, 0, 0, 0);
  c3 = new Cuboid(width / 5, height * 3/5, 0, width / 4, height / 4, width / 4, 0, 0, 0);
  c4 = new Cuboid(width * 3/5, height * 3/5, 0, width / 4, height / 4, width / 4, 0, 0, 0);
}

void draw()
{
  background(0);
  
  c1.update();
  c2.update();
  c3.update();
  c4.update();
  
  //if(c1.x + c1.w < width * 3/5)
  //{
  //  c1.w += speed;
  //  c2.h += speed;
  //  c3.y -= speed;
  //  c3.h += speed;
  //  c4.x -= speed;
  //  c4.w += speed;
  //}
  //else if(c1.x <= width * 3/5 + width / 4)
  //{
  //  c1.x += speed * 1.5;
  //  c1.w -= speed * 1.5;
  //  c2.y += speed * 1.5;
  //  c2.h -= speed * 1.5;
  //  c3.h -= speed * 1.5;
  //  c4.w -= speed * 1.5;
  //}
  //else
  //{
  //  c1 = new Cuboid(width / 5, height / 5, 0, width / 4, height / 4, width / 4, 0, 0, 0);
  //  c2 = new Cuboid(width * 3/5, height / 5, 0, width / 4, height / 4, width / 4, 0, 0, 0);
  //  c3 = new Cuboid(width / 5, height * 3/5, 0, width / 4, height / 4, width / 4, 0, 0, 0);
  //  c4 = new Cuboid(width * 3/5, height * 3/5, 0, width / 4, height / 4, width / 4, 0, 0, 0);
  //}
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frameNum + ".gif");
    frameNum++;
    
    if(frameNum > 1)
    {
      if(c1.x + c1.w < width * 3/5)
      {
        c1.w += speed;
        c2.h += speed;
        c3.y -= speed;
        c3.h += speed;
        c4.x -= speed;
        c4.w += speed;
      }
      else if(c1.x <= width * 3/5 + width / 4)
      {
        c1.x += speed * 1.5;
        c1.w -= speed * 1.5;
        c2.y += speed * 1.5;
        c2.h -= speed * 1.5;
        c3.h -= speed * 1.5;
        c4.w -= speed * 1.5;
      }
      else
      {
        c1 = new Cuboid(width / 5, height / 5, 0, width / 4, height / 4, width / 4, 0, 0, 0);
        c2 = new Cuboid(width * 3/5, height / 5, 0, width / 4, height / 4, width / 4, 0, 0, 0);
        c3 = new Cuboid(width / 5, height * 3/5, 0, width / 4, height / 4, width / 4, 0, 0, 0);
        c4 = new Cuboid(width * 3/5, height * 3/5, 0, width / 4, height / 4, width / 4, 0, 0, 0);
      }
    }
  }
}