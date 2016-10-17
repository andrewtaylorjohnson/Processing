class Vertex
{
  PVector pos;
  PVector vel;
  float maxVel = 1;
  
  Vertex()
  {
    pos = new PVector(random(width), random(height));
    
    vel = new PVector(random(-maxVel, maxVel), random(-maxVel, maxVel));
    if(vel.x == 0 || vel.y == 0)
    {
      while(vel.x == 0 || vel.y == 0)
        vel = new PVector(random(-maxVel, maxVel), random(-maxVel, maxVel));
    }
  }
  
  void update()
  {
    pos = PVector.add(pos, vel);
    
    if(pos.x <= 0 || pos.x >= width)
      vel.x *= -1;
    if(pos.y <= 0 || pos.y >= height)
      vel.y *= -1;
  }
}