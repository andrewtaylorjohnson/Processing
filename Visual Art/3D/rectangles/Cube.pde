class Cube
{
  PVector center = new PVector(0, 0, 0);
  int rectSize;
  float rectDist;
  float rotX = 0;
  float rotY = 0;
  float rotZ = 0;
  
  Cube(PVector center, int rectSize)
  {
    this.center = PVector.mult(center, 0.92);
    this.rectSize = rectSize;
    this.rectDist = 0;
  }
  
  void update()
  {
    //front
    pushMatrix();
    translate(center.x, center.y, center.z - rectDist);
    rotateX(radians(rotX));
    rotateY(radians(rotY));
    rotateZ(radians(rotZ));
    fill(255, 0, 0);
    rect(0, 0, rectSize, rectSize);
    popMatrix();
    
    //rigth side
    pushMatrix();
    translate(center.x - rectDist, center.y, center.z + rectSize);
    rotateX(radians(rotX));
    rotateY(radians(90 + rotY));
    rotateZ(radians(rotZ));
    fill(255, 255, 0);
    rect(0, 0, rectSize, rectSize);
    popMatrix();
    
    //back
    pushMatrix();
    translate(center.x + rectSize, center.y, center.z + rectSize + rectDist);
    rotateX(radians(rotX));
    rotateY(radians(180 + rotY));
    fill(255, 0, 255);
    rect(0, 0, rectSize, rectSize);
    popMatrix();    
    
    //left side
    pushMatrix();
    translate(center.x + rectSize + rectDist, center.y, center.z);
    rotateX(radians(rotX));
    rotateY(radians(270 + rotY));
    rotateZ(radians(rotZ));
    fill(0, 255, 0);
    rect(0, 0, rectSize, rectSize);
    popMatrix();
    
    //top
    pushMatrix();
    translate(center.x, center.y - rectDist, center.z);
    rotateX(radians(90 + rotX));
    rotateY(radians(rotY));
    rotateZ(radians(rotZ));
    fill(0, 0, 255);
    rect(0, 0, rectSize, rectSize);
    popMatrix();
    
    //bottom
    pushMatrix();
    translate(center.x, center.y + rectSize + rectDist, center.z + rectSize);
    rotateX(radians(270 + rotX));
    rotateY(radians(rotY));
    rotateZ(radians(rotZ));
    fill(0, 255, 255);
    rect(0, 0, rectSize, rectSize);
    popMatrix();
  }
}