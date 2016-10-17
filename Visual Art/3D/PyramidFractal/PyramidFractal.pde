Pyramid[] shapes;
int shapeCount = 10;
float radius = 480;
float rot = 0;

void setup()
{
 // size(1280, 720, P3D);
 fullScreen(P3D);
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();
  rectMode(CENTER);
  
  shapes = new Pyramid[shapeCount];
  for(int i = 0; i < shapeCount; i++)
  {
    shapes[i] = new Pyramid(radius);
    radius /= 2;
  }
    
}

void draw()
{
  pushMatrix();
  translate(width / 2, height / 2, -1000);
  fill(0, 1);
  rect(0, 0, 5000, 5000);
  noFill();
  popMatrix();
  
  //background(0);
  
  translate(width / 2, height / 2, 0);
  
  rot += PI / 500;
  rotateX(rot / 4);
  rotateY(rot / 2);
  rotateZ(rot);
  
  for(int i = 0; i < shapeCount; i++)
  {
    shapes[i].update();
  }
} 