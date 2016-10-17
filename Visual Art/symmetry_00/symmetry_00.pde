ArrayList<Vertex> verts;
int vertCount = 50;
int maxDist = 255;

boolean draw = false;
boolean inverted = false;

void setup()
{
  //size(1280, 720);
  fullScreen();
  noCursor();
  background(0);
  stroke(255);
  
  verts = new ArrayList<Vertex>();
  for(int i = 0; i < vertCount; i++)
    verts.add(new Vertex());
}

void draw()
{
  if(!draw)
  {
    if(inverted)
      background(255);
    else
      background(0);
  }
  
  for(Vertex vert: verts)
    vert.update();
    
  for(int i = 0; i < vertCount; i++)
  {
    for(int j = 0; j < vertCount; j++)
    {
      if(i != j)
      {
        PVector vert1 = verts.get(i).pos;
        PVector vert2 = verts.get(j).pos;
        float dist = PVector.dist(vert1, vert2);
        
        if(dist < maxDist)
        {
          if(inverted)
            stroke(0 + dist);
          else
            stroke(255 - dist);
          
          line(vert1.x, vert1.y, vert2.x, vert2.y);
          line(width - vert1.x, vert1.y, width - vert2.x, vert2.y);
          line(vert1.x, height - vert1.y, vert2.x, height - vert2.y);
          line(width - vert1.x, height - vert1.y, width - vert2.x, height - vert2.y);
        }
      }
    }
  }
}

void keyPressed()
{
  if(key == 'd' || key == 'D')
  {
    if(draw)
      draw = false;
    else
      draw = true;
  }
  if(key == 'i' || key == 'I')
  {
    if(inverted)
      inverted = false;
    else
      inverted = true;
  }
}