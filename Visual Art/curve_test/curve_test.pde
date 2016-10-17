PVector control1, control2, control_dir1, control_dir2, point1, point2, point_dir1, point_dir2;

void setup() 
{
  size(200, 200);
  smooth();
  
  control1 = new PVector(random(width), random(height));
  control2 = new PVector(random(width), random(height));
  control_dir1 = new PVector(random(1), random(1));
  control_dir2 = new PVector(random(1), random(1));
  
  point1 = new PVector(random(width), random(height));
  point2 = new PVector(random(width), random(height));
  point_dir1 = new PVector(random(1), random(1));
  point_dir2 = new PVector(random(1), random(1));
}

void draw()
{
  background(255);
  
  control1.add(control_dir1);
  if(control1.x < 0 || control1.x > width)
    control_dir1.x *= -1;
  if(control1.y < 0 || control1.y > height)
    control_dir1.y *= -1;
    
  control2.add(control_dir2);
  if(control2.x < 0 || control2.x > width)
    control_dir2.x *= -1;
  if(control2.y < 0 || control2.y > height)
    control_dir2.y *= -1;
  
  point1.add(point_dir1);
  if(point1.x < 0 || point1.x > width)
    point_dir1.x *= -1;
  if(point1.y < 0 || point1.y > height)
    point_dir1.y *= -1;
    
  point2.add(point_dir2);
  if(point2.x < 0 || point2.x > width)
    point_dir2.x *= -1;
  if(point2.y < 0 || point2.y > height)
    point_dir2.y *= -1;
  
  stroke(0);
  noFill();
  bezier(control1.x, control1.y, point1.x, point1.y, point2.x, point2.y, control2.x, control2.y);
  noStroke();
  
  //control point 1
  fill(255, 0, 0);
  ellipse(control1.x, control1.y, 3, 3);
  
  //curve points
  fill(0, 0, 255, 192);
  ellipse(point1.x, point1.y, 3, 3);
  ellipse(point2.x, point2.y, 3, 3);
  
  //control point 2
  fill(255, 0, 0);
  ellipse(control2.x, control2.y, 3, 3);
}