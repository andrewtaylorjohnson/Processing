class Pyramid
{
  PShape shape;
  float radius;
  float magicRatio = 7f / 8f;
  
  float rot = 0;
  
  Pyramid(float radius)
  {
    this.radius = radius;
    
    shape = createShape();
    
    //first face
    float x1 = 0;
    float y1 = radius;
    float z1 = 0;
    float x2 = -(radius * magicRatio);
    float y2 = -(radius / 2);
    float z2 = radius * magicRatio;
    float x3 = radius * magicRatio;
    float y3 = -(radius / 2);
    float z3 = radius * magicRatio;
    
    //second face
    float x4 = -(radius * magicRatio);
    float y4 = -(radius / 2);
    float z4 = -(radius * magicRatio);
    
    shape.beginShape();
    
    shape.vertex(x1, y1, z1);
    shape.vertex(x2, y2, z2);
    shape.vertex(x3, y3, z3);
    
    shape.vertex(x1, y1, z1);
    shape.vertex(x4, y4, z4);
    shape.vertex(x2, y2, z2);
    
    shape.vertex(x1, y1, z1);
    shape.vertex(x4, y4, z4);
    shape.vertex(x3, y3, -z3);
    
    shape.vertex(x1, y1, z1);
    shape.vertex(-x4, y4, z4);
    shape.vertex(x3, y3, z3);
    
    shape.vertex(x1, y1, z1);
    shape.vertex(x4, y4, z4);
    shape.vertex(x3, y3, -z3);
    shape.vertex(x3, y3, z3);
    
    shape.endShape(CLOSE);
  }
  
  void update()
  {
    rot += PI / 500;
    rotateY(rot);
    
    rotateZ(PI);
    shape(shape);
  }
}