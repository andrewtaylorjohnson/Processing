//January 21st, 2016

boolean subd = true;
float rot = 0;
float rotSpeed = PI / 96;

int frame = 0;

void setup()
{
  size(500, 500, P3D);
  stroke(255);
  strokeWeight(2);
  noFill();
  rectMode(CENTER);
}

void draw()
{
  background(0);
  
  //outer squares
  pushMatrix();
  translate(width / 3, width / 3);
  if(!subd)
    rotateY(-rot);
  rect(0, 0, width / 3, width / 3);
  popMatrix();
  pushMatrix();
  translate(width * 2/3, height / 3);
  if(!subd)
    rotateX(rot);
  rect(0, 0, width / 3, width / 3);
  popMatrix();
  pushMatrix();
  translate(width / 3, width * 2/3);
  if(!subd)
    rotateX(rot);
  rect(0, 0, width / 3, width / 3);
  popMatrix();
  pushMatrix();
  translate(width * 2/3, width * 2/3);
  if(!subd)
    rotateY(-rot);
  rect(0, 0, width / 3, width / 3);
  popMatrix();
  
  //center squares
  if(subd)
  {
    pushMatrix();
    translate(width * 5/12, width * 5/12);
    rotateY(-rot);
    rect(0, 0, width / 6, width / 6);
    popMatrix();
    
    pushMatrix();
    translate(width * 7/12, width * 7/12);
    rotateY(-rot);
    rect(0, 0, width / 6, width / 6);
    popMatrix();
    
    pushMatrix();
    translate(width * 5/12, width * 7/12);
    rotateX(rot);
    rect(0, 0, width / 6, width / 6);
    popMatrix();
    
    pushMatrix();
    translate(width * 7/12, width * 5/12);
    rotateX(rot);
    rect(0, 0, width / 6, width / 6);
    popMatrix();
  }
    
  else
  {
    pushMatrix();
    translate(width / 2, width / 2, 0);
    rotateX(rot);
    rotateY(rot);
    //rotateZ(rot);
    rect(0, 0, width / 3, width / 3);
    popMatrix();
  }
  
  rot += rotSpeed;
  if(rot + rotSpeed >= PI)
  {
    rot = 0;
    if(subd)
      subd = false;
    else
      subd = true;
  }
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frame + ".gif");
    frame++;
    
    if(frame > 1)
      rot += rotSpeed;
  }
}