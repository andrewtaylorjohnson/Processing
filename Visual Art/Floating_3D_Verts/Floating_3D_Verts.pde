/**************************************************************

Floating 3D Verts

-----------------

IF PROGRAM DOES NOT RUN OR WORK CORRECTLY, COMMENT OUT ALL LINES HAVING TO DO WITH ROBOT.
On my end the line numbers are 30, 31, 33, 71-78, and 81.

**************************************************************/

import java.awt.AWTException;
import java.awt.Robot;

Robot robot;

//vertex fields
ArrayList<PVector> verts;
ArrayList<PVector> dir;
ArrayList<PVector> rot;
ArrayList<PVector> rot_speed;
int vert_count = 250;
int depth = -1280;
float max_speed = 0.25;
float min_speed = 0.05;
float max_rot_speed = 0.01;

//interactive fields
boolean white_bg = true;
boolean draw_bg = true;
boolean color_stroke = false;
boolean bounding_box = false;
boolean draw_verts = false;
boolean draw_lines = true;
boolean stroke_fade = true;
boolean paused = false;
boolean display_controls = true;

int capture_count = 0;
PFont font;

void setup()
{
  //size(1280, 720, P3D);
  fullScreen(P3D);
  background(255);
  noCursor();
  
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  font = loadFont("bebas.vlw");
  textFont(font);
  
  try 
  {
    robot = new Robot();
  }
  catch (AWTException e) 
  {
    e.printStackTrace();
  }
    
  //set mouse position to center of screen
  robot.mouseMove(width / 2, height / 2);
  
  //create the vertices
  verts = new ArrayList<PVector>();
  for(int i = 0; i < vert_count; i++)
    verts.add(new PVector(random(width), random(height), random(depth)));
    
  dir = new ArrayList<PVector>();
  for(int i = 0; i < vert_count; i++)
  {
    float rand_x = random(-max_speed, max_speed);
    while(abs(rand_x) < min_speed)
      rand_x = random(-max_speed, max_speed);
    float rand_y = random(-max_speed, max_speed);
    while(abs(rand_y) < min_speed)
      rand_y = random(-max_speed, max_speed);
    float rand_z = random(-max_speed, max_speed);
    while(abs(rand_z) < min_speed)
      rand_z = random(-max_speed, max_speed);
      
    dir.add(new PVector(rand_x, rand_y, rand_z));
  }
  
  //create each vertice's rotation
  rot = new ArrayList<PVector>();
  for(int i = 0; i < vert_count; i++)
    rot.add(new PVector(random(TWO_PI), random(TWO_PI), random(TWO_PI)));
  
  //create each vertice's rotation speed
  rot_speed = new ArrayList<PVector>();
  for(int i = 0; i < vert_count; i++)
    rot_speed.add(new PVector(random(max_rot_speed), random(max_rot_speed), random(max_rot_speed)));
}

void draw()
{
  if(draw_bg)
  {
    if(white_bg)
      background(255);
    else
      background(0);
  }
  
  lights();
  camera(width / 2, height / 2, 150, mouseX, mouseY, depth / 2, 0, 1, 0);
    
  if(bounding_box)
    boundingBox();
  
  updateVerts();
  
  drawVerts();
  
  if(display_controls)
    displayControls();
}


/**************
///FUNCTIONS///
**************/


/**
/  updateVerts()
/  
/  Updates the current position of each vertex
/  by adding its position vector to its directional vector.
/  Also keeps verts from leaving bounding box area.
*/
void updateVerts()
{
  if(paused)
    return;
  
 for(int i = 0; i < verts.size(); i++)
 {
   //keep withing bounds
   if(verts.get(i).x < 0 || verts.get(i).x > width)
     dir.get(i).x *= -1;
   if(verts.get(i).y < 0 || verts.get(i).y > height)
     dir.get(i).y *= -1;
   if(verts.get(i).z > 0 || verts.get(i).z < depth)
     dir.get(i).z *= -1;
   
   //update vert position
   verts.get(i).add(dir.get(i));
   
   //update vert rotation
   rot.get(i).add(rot_speed.get(i));
 }
}

/**
/  drawVerts()
/  
/  Draws a box at each current vertex position.
/  If two boxes are within a certain distance a line
/  will be drawn between them.
*/
void drawVerts()
{
  for(int i = 0; i < vert_count; i++)
  {
    if(draw_verts)
    {
      //draw a box for each vert
      pushMatrix();
          
      translate(verts.get(i).x, verts.get(i).y, verts.get(i).z);
      rotateX(rot.get(i).x);
      rotateY(rot.get(i).y);
      rotateZ(rot.get(i).z);
      
      stroke(0);
      noStroke();
      fill(255);
      strokeWeight(1);
      box(10);
      
      popMatrix();
    }
    
    for(int j = i + 1; j < vert_count - 1; j++)
    {
      PVector vert1 = verts.get(i);
      PVector vert2 = verts.get(j);
      float dist = vert1.dist(vert2);
      
      if(dist < 255)
      {
        float r = 0;
        float g = 0;
        float b = 0;
        
        //sets stroke color - either color or grayscale
        if(color_stroke)
        {
          if(vert1.x >= vert2.x)
            r = vert1.x - vert2.x;
          else
            r = vert2.x - vert1.x;
            
          if(vert1.y >= vert2.y)
            g = vert1.y - vert2.y;
          else
            g = vert2.y - vert1.y;
            
          if(vert1.z <= vert2.z)
            b = abs(vert1.z - vert2.z);
          else
            b = abs(vert2.z - vert1.z);
          
          if(stroke_fade)
            stroke(r, g, b, 255 - dist);
          else
            stroke(r, g, b);
        }
        else
        {
          if(stroke_fade)
          {
            if(white_bg)
              stroke(0, 255 - dist);
            else
              stroke(255, 255 - dist);
          }
          else
          {
            if(white_bg)
              stroke(0);
            else
              stroke(255);
          }
        }
        
        //sets strokeweight dependents on vert depth
        if(vert1.z < vert2.z)
          strokeWeight(abs((depth - vert1.z) / 255) + 1);
        else
          strokeWeight(abs((depth - vert2.z) / 255) + 1);
        
        //draw connecting lines
        if(draw_lines)
          line(verts.get(i).x, verts.get(i).y, verts.get(i).z, verts.get(j).x, verts.get(j).y, verts.get(j).z);
      }
    }
  }
}

/**
/  boundingBox()
/
/  Draws the bounding box that contains the vertices.
*/
void boundingBox()
{
  if(white_bg)
    stroke(0);
  else
    stroke(255);
    
  strokeWeight(5);
  noFill();
  
  //corner one (upper left)
  line(0, 0, 0, width, 0, 0);
  line(0, 0, 0, 0, height, 0);
  line(0, 0, 0, 0, 0, depth);
  //corner two (lower right)
  line(width, height, 0, width, 0, 0);
  line(width, height, 0, 0, height, 0);
  line(width, height, 0, width, height, depth);
  //corner three (lower back left)
  line(0, height, depth, 0, 0, depth);
  line(0, height, depth, 0, height, 0);
  line(0, height, depth, width, height, depth);
  //corner four (upper back right)
  line(width, 0, depth, 0, 0, depth);
  line(width, 0, depth, width, height, depth);
  line(width, 0, depth, width, 0, 0);
}

void displayControls()
{
  noStroke();
  
  if(white_bg)
  {
    fill(0);
    rect(width / 2, height / 2, 100, 150);
    
    fill(255);
  }
  else
  {
    fill(255);
    rect(width / 2, height / 2, 100, 150);
    
    fill(0);
  }
  
  textSize(8);
  text("Controls:", width / 2, height / 2.25, 1);

  textSize(3);
  text("Use your mouse to look around.", width / 2, height / 2.17, 1);
  text("Q = toggle whether verts are drawn or not", width / 2, height / 2.11, 1);
  text("W = toggle background between black and white", width / 2, height / 2.08, 1);
  text("E = toggle whether strokes fade out or not", width / 2, height / 2.05, 1);
  text("A = toggle stroke between color and grayscale", width / 2, height / 2.02, 1);
  text("S = toggle bounding box", width / 2, height / 1.99, 1);
  text("D = toggle pixel tracing", width / 2, height / 1.96, 1);
  text("F = toggle whether lines are drawn or not", width / 2, height / 1.93, 1);
  text("R = reverse direction of each vertex", width / 2, height / 1.90, 1);
  text("P = pause or unpause vertex movement", width / 2, height / 1.87, 1);
  text("ENTER = take a screenshot of the current frame", width / 2, height / 1.84, 1);
  text("Press C to toggle this information.", width / 2, height / 1.80, 1);
}

void keyPressed()
{
  if(key == 's' || key == 'S') //toggle bounding box drawing
    bounding_box = !bounding_box;
  else if(key == 'a' || key == 'A') //toggle between color and grayscale stroke
    color_stroke = !color_stroke;
  else if(key == 'w' || key == 'W') //toggle between white and black background
    white_bg = !white_bg;
  else if(key == 'd' || key == 'D') //toggle between clearing canvas and not (will trace lines if not)
    draw_bg = !draw_bg;
  else if(key == 'q' || key == 'Q') //toggle between drawing verts and not
    draw_verts = !draw_verts;
  else if(key == 'e' || key == 'E') //toggle between fading the stroke's alpha and not
    stroke_fade = !stroke_fade;
  else if(key == 'p' || key == 'P') //toggle pause
    paused = !paused;
  else if(key == 'r' || key == 'R') //reverse direction of all verts
  {
    for(int i = 0; i < vert_count; i++)
      dir.get(i).mult(-1);
  }
  else if(key == 'f' || key == 'F')
    draw_lines = !draw_lines;
  else if(key == 'c' || key == 'C')
    display_controls = !display_controls;
  else if(key == ENTER) //take a screenshot (saved to sketch folder)
  {
    saveFrame(capture_count + ".png");
    capture_count++;
  }
}