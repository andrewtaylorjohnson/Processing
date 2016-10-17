class Tetrahedron
{
  PShape tetra;
  float radius;
  float magicRatio = 7f / 8f;
  
  Tetrahedron(float radius)
  {
    this.radius = radius;
    
    tetra = createShape();
    
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
    
    tetra.beginShape();
    
    tetra.vertex(x1, y1, z1);
    tetra.vertex(x2, y2, z2);
    tetra.vertex(x3, y3, z3);
    
    tetra.vertex(x1, y1, z1);
    tetra.vertex(x4, y4, z4);
    tetra.vertex(x2, y2, z2);
    
    tetra.vertex(x1, y1, z1);
    tetra.vertex(x4, y4, z4);
    tetra.vertex(x3, y3, -z3);
    
    tetra.vertex(x1, y1, z1);
    tetra.vertex(-x4, y4, z4);
    tetra.vertex(x3, y3, z3);
    
    tetra.vertex(x1, y1, z1);
    tetra.vertex(x4, y4, z4);
    tetra.vertex(x3, y3, -z3);
    tetra.vertex(x3, y3, z3);
    
    tetra.endShape(CLOSE);
  }
  
  void update()
  {
    shape(tetra);
  }
}