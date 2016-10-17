class PCube
{
  PVector[] sidePos;
  PVector[] sideRot;
  color[] colors;
  
  int sideDist = 100;
  int sideSize = 125;
  
  PCube()
  {
    sidePos = new PVector[6];
    sidePos[0] = new PVector(-sideDist, 0, 0);//LEFT
    sidePos[1] = new PVector(0, 0, sideDist);//FRONT
    sidePos[2] = new PVector(sideDist, 0, 0);//RIGHT
    sidePos[3] = new PVector(0, 0, -sideDist);//BACK
    sidePos[4] = new PVector(0, -sideDist, 0);//TOP
    sidePos[5] = new PVector(0, sideDist, 0);//BOTTOM
    
    sideRot = new PVector[6];
    sideRot[0] = new PVector(0, PI / 2, 0);
    sideRot[1] = new PVector(0, 0, 0);
    sideRot[2] = new PVector(0, -(PI / 2), 0);
    sideRot[3] = new PVector(0, 0, 0);
    sideRot[4] = new PVector(PI / 2, 0, 0);
    sideRot[5] = new PVector(-(PI / 2), 0, 0);
    
    colors = new color[6];
    colors[0] = color(255, 0, 0);
    colors[1] = color(0, 0, 255);
    colors[2] = color(0, 255, 255);
    colors[3] = color(255, 255, 0);
    colors[4] = color(0, 255, 0);
    colors[5] = color(255, 0, 255);
  }
  
  void update()
  {
    stroke(255, 255, 255);
    for(int i = 0; i < 6; i++)
    {
      pushMatrix();
      translate(sidePos[i].x, sidePos[i].y, sidePos[i].z);
      rotateX(sideRot[i].x);
      rotateY(sideRot[i].y);
      rotateZ(sideRot[i].z);
      fill(colors[i]);
      rect(0, 0, sideSize, sideSize);
      popMatrix();
    }
    
    stroke(0, 0, 0);
    noFill();
    pushMatrix();
    box(199);
    popMatrix();
  }
}