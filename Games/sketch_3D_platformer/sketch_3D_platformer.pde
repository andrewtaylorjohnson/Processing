boolean titleScreen = true;
boolean paused = false;

Title title = new Title();

ArrayList<Shape> shapes;
int shapeCount = 1;
int shapeSpeed = 25;
int shapeSize = 150;
int maxDist = 5000;

float camHeight = -250;
float camX = 0;
float camY = camHeight;
float camZ = 0;

void setup()
{
  size(1280, 720, P3D);
  background(0);
  textAlign(CENTER, BOTTOM);
  textSize(24);
  
  shapes = new ArrayList<Shape>();
  shapes.add(new Shape(new PVector(0, 0, maxDist), new PVector(0, 0, -1), shapeSpeed, shapeSize));
}

void draw()
{
  background(0);
  camera(camX, camY, camZ, 0, 0, maxDist / 3, 0, 1, 0);
  
  for(Shape s: shapes)
    s.update();
}

void control()
{
  if(titleScreen)
    title.update();
}