/*
  Go-to Polygon
  Happy new year!
  
  We’re starting 2016 with a new theme that encapsulates the rest of the primitives. 
  We had the point and the line, and they were used to construct some amazing animations. 
  Now we’re moving to polygons and see what we can create with triangles, squares and what not.
  
  As usual, you can interpret the theme as you want, but before you submit please read the guidelines.
  
  The colours that we’ll be using in January are: #FF6464, #FFBD67, #F8FE85 and #5BE7A9. 
  The colour scheme was chosen from Colorhunt.
  
  The deadline is the January 25. Hope you have an awesome 2016!
*/

color[] colors = {#FF6464, #FFBD67, #F8FE85, #5BE7A9};

Polygon[] poly1;
Polygon[] poly2;
Polygon[] poly3;
Polygon[] poly4;

int polyCount = 4;
int size = 50;

float rot = 0;
float rotSpeed = PI / 128;

void setup()
{
  size(480, 480, P3D);
  ortho();
  strokeWeight(3);
  noFill();
  
  poly1 = new Polygon[polyCount];
  poly2 = new Polygon[polyCount];
  poly3 = new Polygon[polyCount];
  poly4 = new Polygon[polyCount];
  for(int i = 0; i < polyCount; i++)
  {
    poly1[i] = new Polygon(0, 0, 0, size, 3, QUARTER_PI * i);
    poly2[i] = new Polygon(0, 0, 0, size, 4, QUARTER_PI * i);
    poly3[i] = new Polygon(0, 0, 0, size, 5, QUARTER_PI * i);
    poly4[i] = new Polygon(0, 0, 0, size, 6, QUARTER_PI * i);
  }
}

void draw()
{
  background(0);
  
  for(int i = 0; i < polyCount; i++)
  {
    //stroke(colors[i]);
    
    stroke(colors[0]);
    fill(colors[1]);
    pushMatrix();
    translate(width / 3, height / 3);
    rotateZ(HALF_PI * 3);
    rotateX(poly1[i].rot);
    rotateX(rot);
    poly1[i].update();
    popMatrix();
    
    stroke(colors[1]);
    fill(colors[2]);
    pushMatrix();
    translate(width * 2/3, height / 3);
    rotateZ(HALF_PI * 3);
    rotateX(poly2[i].rot);
    rotateX(rot);
    poly2[i].update();
    popMatrix();
    
    stroke(colors[2]);
    fill(colors[3]);
    pushMatrix();
    translate(width / 3, height * 2/3);
    rotateZ(HALF_PI * 3);
    rotateX(poly3[i].rot);
    rotateX(rot);
    poly3[i].update();
    popMatrix();
    
    stroke(colors[3]);
    fill(colors[0]);
    pushMatrix();
    translate(width * 2/3, height * 2/3);
    rotateZ(HALF_PI * 3);
    rotateX(poly4[i].rot);
    rotateX(rot);
    poly4[i].update();
    popMatrix();
  }
  
  rot += rotSpeed;
}