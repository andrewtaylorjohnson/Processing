ArrayList<Polygon> polys;
PVector[] pos;
float[] size;
int numSides = 6;
float growthRate = -1;
float speed = -5;

void setup()
{
  size(500, 500, P3D);
  background(0);
  noFill();
  strokeWeight(1);
    
  polys = new ArrayList<Polygon>();
  pos = new PVector[shapeCount];
  size = new float[shapeCount];
  delay = new int[shapeCount];
  for(int i = 0; i < shapeCount; i++)
  {
    pos[i] = new PVector(width / 2, height / 2, 0);
    size[i] = 255;
    delay[i] = i * shapeCount;
  }
}

void draw()
{
  camera(width / 2, height / 2, 0, width / 2, height / 2, -250, 0, 1, 0);
  background(0);
  
  for(int i = 0; i < shapeCount; i++)
  {
    if(delay[i] <= delayCount)
    {
      pushMatrix();
      translate(pos[i].x, pos[i].y, pos[i].z);
      stroke(255 - size[i]);
      polys[i].update();
      
      size[i] += growthRate;
      polys[i].radius = size[i];
      pos[i].z += speed;
      
      if(size[i] <= 0)
      {
        size[i] = 300;
        pos[i].z = 0;
      }
      
      popMatrix();
    }
  }
  
  delayCount++;
}