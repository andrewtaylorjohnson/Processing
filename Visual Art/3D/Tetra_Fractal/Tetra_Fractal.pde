Tetrahedron[] shapes;
int shapeCount = 10;
float radius = 240;

void setup()
{
  size(1280, 720, P3D);
  stroke(255);
  strokeWeight(2);
  fill(255, 10);
  
  shapes = new Tetrahedron[shapeCount];
  for(int i = 0; i < shapeCount; i++)
  {
    shapes[i] = new Tetrahedron(radius);
    radius /= 2;
  }
    
}

void draw()
{
  background(0); 
  translate(mouseX, mouseY);
  
  for(int i = 0; i < shapeCount; i++)
  {
    shapes[i].update();
    rotateZ(PI);
  }
} 