//January 24th, 2016

int xspacing = 25;
int w;

float theta = 0.0;
float amplitude = 75.0;
float period = 500.0;
float dx;
float[] yvalues; 

float rot = 0;
float rotSpeed = PI / 64;

float x;

int frame = 0;

void setup() 
{
  size(480, 480, P3D);
  stroke(255);
  noStroke();
  strokeWeight(1);
  fill(10, 100, 250);
  
  w = width + xspacing;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  
  for (int i = 0; i < yvalues.length; i++) 
  {
   yvalues[i] = sin(x)*amplitude;
   x+=dx;
  }
}

void draw() 
{
  lights();
  camera(width / 2, -width / 2, width / 2, width / 2, width / 2, 0, 1, 0, 0);
  background(0);
  calcWave();
  renderWave();
}

void calcWave() 
{
  //theta += PI / 128;

  x = theta;
  //for (int i = 0; i < yvalues.length; i++) 
  //{
  //  yvalues[i] = sin(x)*amplitude;
  //  x+=dx;
  //}
}

void renderWave() {
  for (int x = 0; x < yvalues.length; x++) 
  {   
    pushMatrix();
    translate(x*xspacing, height/2+yvalues[x], 0);
    rotateY(rot);
    rotateZ(rot);
    box(16);
    popMatrix();
    
    pushMatrix();
    translate(x*xspacing, height / 2, -yvalues[x]);
    rotateX(rot);
    rotateZ(rot);
    box(16);
    popMatrix();
  }
  
  //rot += rotSpeed;
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame("frame_" + frame + ".gif");
    frame++;
    
    if(frame > 1)
    {
      theta += PI / 64
      85
      64
      ;
      
      for (int i = 0; i < yvalues.length; i++) 
      {
        yvalues[i] = sin(x)*amplitude;
        x+=dx;
      }
      
      rot += rotSpeed;
    }
  }
}