int n = 360;

float n_f = 0;
float k = TWO_PI/n;
float R;
float f = 0.5;
float h;
float s = n * 0.8;
float b;
float a = n * 0.1;

boolean z = false;
 
void setup()
{          
  size(720, 720);
  background(n);
  smooth();
  noCursor();
  colorMode(HSB, n);
  
  h = random(n - a);
  R = n;
}
 
void draw()
{
  if (!z)
  {
    stroke(R, a);
    fill(h + (sin(n_f += k) * a), s, b++ % n, a);  //small palette of hue (1/10 of the palette)
    
    beginShape();
    
    for (float i = 0; i <= TWO_PI; i += k)
    {
      float cc = cos(i);
      float ss = sin(i);
      float rr = noise(cc,ss,n_f) * R;
      
      vertex(n + rr * cc, n + rr * ss);       //make a circle but shift the radius of the vertexes with the noise
    }
    
    endShape();
  }
  
  R -= R > 0?f:0;
}
 
void mousePressed()
{
  z = !z;
}

void keyPressed()  
{
  setup();
}