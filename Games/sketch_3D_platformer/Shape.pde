class Shape
{
  PVector pos, dir;
  float speed;
  int size;
  
  Shape(PVector pos, PVector dir, float speed, int size)
  {
    this.pos = pos;
    this.dir = dir;
    this.speed = speed;
    this.size = size;
  }
  
  void update()
  {
    translate(pos.x, pos.y, pos.z);
    
    box(size);
    
    pos = PVector.add(pos, PVector.mult(dir, speed));
  }
}