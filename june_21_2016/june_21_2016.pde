color mainStroke;
color mainFill;
color altStroke;
color altFill;

ArrayList<PVector> pos;
ArrayList<PVector> speed;
int addCount = 0;

void setup()
{
  size(1280, 720, P3D);
  background(256, 256, 256);
  strokeWeight(2);
  
  mainStroke = color(0, 0, 0);
  mainFill = color(256, 256, 256);
  altStroke = color(256, 256, 256);
  altFill = color(0, 0, 0);
  
  pos = new ArrayList<PVector>();
  speed = new ArrayList<PVector>();
}

void draw()
{
  background(256, 256, 256);
  
  camera(0, 0, 0, width / 2, height / 2, height / 2, 0, 1, 0);
  
  //Main Box
  pushMatrix();
  translate(width / 2, height / 2, height / 2);
  stroke(mainStroke);
  fill(mainFill);
  box(100);
  popMatrix();
  
  addCount++;
  if(addCount / 1000 == 0)
  {
    addNew();
  }
  
  for(int i = 0; i < pos.size(); i++)
  {
    pos.get(i).x = pos.get(i).x + speed.get(i).x;
    pos.get(i).y = pos.get(i).y + speed.get(i).y;
    pos.get(i).z = pos.get(i).z + speed.get(i).z;
    
    pushMatrix();
    translate(pos.get(i).x, pos.get(i).y, pos.get(i).z);
    box(100);
    popMatrix();
  }
}

void addNew()
{
  addCount = 0;
  float randSide = random(0.2);
  if(randSide < 0.2)//LEFT
  {
    pos.add(new PVector(0, height / 2, height / 2));
    speed.add(new PVector(1, 0, 0));
  }
  else if(randSide >= 0.2 && randSide < 0.4)//RIGHT
  {
    pos.add(new PVector(width, height / 2, height / 2));
    speed.add(new PVector(-1, 0, 0));
  }
  else if(randSide >= 0.4 && randSide < 0.6)//TOP
  {
    pos.add(new PVector(width / 2, 0, height / 2));
    speed.add(new PVector(0, 1, 0));
  }
  else if(randSide >= 0.6 && randSide < 0.8)//BOTTOM
  {
    pos.add(new PVector(width / 2, height, height / 2));
    speed.add(new PVector(0, -1, 0));
  }
  else if(randSide >= 0.8 && randSide < 1)//FRONT
  {
    pos.add(new PVector(width / 2, height / 2, 0));
    speed.add(new PVector(0, 0, 1));
  }
  else//BACK
  {
    pos.add(new PVector(width / 2, height / 2, height));
    speed.add(new PVector(0, 0, -1));
  }
}