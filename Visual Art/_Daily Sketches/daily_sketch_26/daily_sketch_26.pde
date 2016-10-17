//January 25th, 2016

float[] elliRot;
float rotSpeed = PI / 256;
int elliCount = 5;
int elliRad = 300;

int shapeSize = 150;
float shapeRot = 0;
float shapeRotSpeed = PI / 256;
int shapeWeight = 3;
float growth = PI;
int growthCount = 0;

boolean cube = true;

int frame = 0;

void setup()
{
  size(480, 480, P3D);
  stroke(255);
  strokeWeight(1);
  noFill();
  sphereDetail(7);
  
  elliRot = new float[elliCount];
  for(int i = 0; i < elliCount; i++)
    elliRot[i] = PI / elliCount * i;
}

void draw()
{
  lights();
  background(0);
  
  translate(width / 2, height / 2, 0);
  
  //ORBITING ELLIPSES
  stroke(255);
  strokeWeight(shapeWeight);
  noFill();
  for(int i = 0; i < elliCount; i++)
  {
    pushMatrix();
    rotateY(elliRot[i]);
    //elliRot[i] += rotSpeed;
    ellipse(0, 0, elliRad, elliRad);
    popMatrix();
  }
  
  //growthCount++;
  //if(growthCount > 25)
  // shapeWeight += growth;
  if(shapeWeight + growth < 1 || shapeWeight + growth > PI * 48)
  {
    if(shapeWeight + growth > PI * 48)
    {
      if(cube)
        cube = false;
      else
        cube = true;
      for(int i = 0; i < elliCount; i++)
        elliRot[i] = PI / elliCount * i;
      shapeRotSpeed *= -1;
    }
    else if(shapeWeight + growth <1)
      growthCount = 0;
    growth *= -1;
  }
  
  //CENTER SHAPE
  fill(0);
  strokeWeight(3);
  pushMatrix();
  rotateX(shapeRot);
  rotateY(shapeRot);
  rotateZ(shapeRot);
  if(cube)
    box(shapeSize);
  else
    sphere(shapeSize * 2/3);
  popMatrix();
  
  //shapeRot += shapeRotSpeed;
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frame + ".gif");
    frame++;
    
    if(frame > 1)
    {
      for(int i = 0; i < elliCount; i++)
        elliRot[i] += rotSpeed;
      if(growthCount > 15)
        shapeWeight += growth;
      growthCount++;
      shapeRot += shapeRotSpeed;
    }
  }
}