class Shape
{  
  int type;
  float size;
  float x, y, z;
  float xRot, yRot, zRot;
  float xDir, yDir, zDir;
  
  int rotCount = 0;
  
  boolean rotate = false;
  
  Shape(int type, float size, float x, float y, float z, 
    float xRot, float yRot, float zRot, float xDir, float yDir, float zDir)
  {
    this.type = type;
    this.size = size;
    this.x = x;
    this.y = y;
    this.z = z;
    this.xRot = xRot;
    this.yRot = yRot;
    this.zRot = zRot;
    this.xDir = xDir;
    this.yDir = yDir;
    this.zDir = zDir;
  }
  
  void update()
  {
    if(type == 1)
    {
      x += xDir;
      y += yDir;
      z += zDir;
      
      translate(x, y, z);
      if(rotate)
      {
        rotateX(radians(rotCount * xRot % 360));
        rotateY(radians(rotCount * yRot % 360));
        rotateZ(radians(rotCount * zRot % 360));
      }
      box(size);
    }
    else if(type == 2)
    {
      x += xDir;
      y += yDir;
      z += zDir;
      
      translate(x, y, z);
      sphere(size);
    }
    
    rotCount++;
    if(rotCount > 5000)
      rotCount = 0;
  }
}