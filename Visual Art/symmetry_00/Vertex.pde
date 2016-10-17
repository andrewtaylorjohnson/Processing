class Vertex
{
  PVector pos;
  PVector dir;
  float speed;
  
  Vertex()
  {
    pos = new PVector(random(width), random(height));
    dir = new PVector(random(-1, 1), random(-1, 1));
    speed = random(0.5, 2);
  }
  
  void update()
  {
    pos = PVector.add(pos, PVector.mult(dir, speed));
    
    if(pos.x < 0 || pos.x > width)
      dir.x *= -1;
    if(pos.y < 0 || pos.y > height)
      dir.y *= -1;
  }
}