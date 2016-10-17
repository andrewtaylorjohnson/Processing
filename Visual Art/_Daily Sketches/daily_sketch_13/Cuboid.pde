class Cuboid
{
  float x, y, z;
  float w, h, d;
  float rotX, rotY, rotZ;

  Cuboid(float x, float y, float z, float w, float h, float d, float rotX, float rotY, float rotZ)
  {
    this.x = x;
    this.y = y;
    this.z = -z;
    
    this.w = w;
    this.h = h;
    this.d = d;
    
    this.rotX = rotX;
    this.rotY = rotY;
    this.rotZ = rotZ;
  }
  
  void update()
  {
    pushMatrix();
    
    translate(x, y, z);
    
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    
    beginShape();
    //front
    vertex(0, 0, 0);
    vertex(w, 0, 0);
    vertex(w, h, 0);
    vertex(0, h, 0);
    endShape();
    
    beginShape();
    //back
    vertex(0, 0, -d);
    vertex(w, 0, -d);
    vertex(w, h, -d);
    vertex(0, h, -d);
    endShape(CLOSE);
    
    beginShape();
    //top
    vertex(0, 0, 0);
    vertex(w, 0, 0);
    vertex(w, 0, -d);
    vertex(0, 0, -d);
    endShape(CLOSE);
    
    beginShape();
    //bottom
    vertex(0, h, 0);
    vertex(w, h, 0);
    vertex(w, h, -d);
    vertex(0, h, -d);
    endShape(CLOSE);
    
    beginShape();
    //left
    vertex(0, 0, 0);
    vertex(0, h, 0);
    vertex(0, h, -d);
    vertex(0, 0, -d);
    endShape(CLOSE);
    
    beginShape();
    //right
    vertex(w, 0, 0);
    vertex(w, h, 0);
    vertex(w, h,-d);
    vertex(w, 0, -d);
    endShape(CLOSE);
    
    //beginShape();
    ////front
    //vertex(x, y, z);
    //vertex(x + w, y, z);
    //vertex(x + w, y + h, z);
    //vertex(x, y + h, z);
    //endShape();
    
    //beginShape();
    ////back
    //vertex(x, y, z - d);
    //vertex(x + w, y, z - d);
    //vertex(x + w, y + h, z - d);
    //vertex(x, y + h, z - d);
    //endShape(CLOSE);
    
    //beginShape();
    ////top
    //vertex(x, y, z);
    //vertex(x + w, y, z);
    //vertex(x + w, y, z - d);
    //vertex(x, y, z - d);
    //endShape(CLOSE);
    
    //beginShape();
    ////bottom
    //vertex(x, y + h, z);
    //vertex(x + w, y + h, z);
    //vertex(x + w, y + h, z - d);
    //vertex(x, y + h, z - d);
    //endShape(CLOSE);
    
    //beginShape();
    ////left
    //vertex(x, y, z);
    //vertex(x, y + h, z);
    //vertex(x, y + h, z - d);
    //vertex(x, y, z - d);
    //endShape(CLOSE);
    
    //beginShape();
    ////right
    //vertex(x + w, y, z);
    //vertex(x + w, y + h, z);
    //vertex(x + w, y + h, z - d);
    //vertex(x + w, y, z - d);
    //endShape(CLOSE);
    
    popMatrix();
  }
}