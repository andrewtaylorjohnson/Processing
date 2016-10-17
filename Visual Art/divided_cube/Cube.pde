class Cube
{
  PVector center = new PVector(0, 0, 0);
  int rectSize = 250;
  float rectDist = rectSize;
  
  void update()
  {
    //front
    pushMatrix();
    translate(0, 0, 0);
    rect(0, 0, rectSize, rectSize);
    popMatrix();
    
    //left side
    pushMatrix();
    translate(0, 0, rectSize);
    rotateY(radians(90));
    rect(0, 0, rectSize, rectSize);
    popMatrix();
    
    //back
    pushMatrix();
    translate(rectSize, 0, rectSize);
    rotateY(radians(180));
    rect(0, 0, rectSize, rectSize);
    popMatrix();    
    
    //right side
    pushMatrix();
    translate(rectSize, 0, 0);
    rotateY(radians(270));
    rect(0, 0, rectSize, rectSize);
    popMatrix();
    
    //top
    pushMatrix();
    translate(0, 0, rectSize);
    rotateX(radians(90));
    rect(0, 0, rectSize, rectSize);
    popMatrix();
    
    //bottom
    pushMatrix();
    translate(0, rectSize, 0);
    rotateX(radians(270));
    rect(0, 0, rectSize, rectSize);
    popMatrix();
  }
}