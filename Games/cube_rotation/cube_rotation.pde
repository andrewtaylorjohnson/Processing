PCube pCube;

ArrayList<CCube> cubes;
int cubeCount = 0;
int newCube = 240;
float cubeSpeed = 4;

PFont font;
int score = 0;
int life = 3;

int mult = 1;

void setup()
{
  //size(1280, 720, P3D);
  fullScreen(P3D);
  rectMode(CENTER);
  strokeWeight(2);
  stroke(256);
  fill(0);
  
  pCube = new PCube();
  cubes = new ArrayList<CCube>();
  
  font = createFont("minimal.otf", 32);
  textMode(SHAPE);
  textFont(font);
  textSize(32);
}

void draw()
{
  camera(250, 0, 500, width / 2, height / 2, -width / 2, 0, 1, 0);
  background(255, 255, 255);
  
  stroke(0, 0, 0);
  fill(0, 0, 0);
  text("SCORE: " + score, width / 15, -height / 25, 0);
  if(life == 3)
    text("<3 <3 <3", width / 15, 0, 0);
  else if(life == 2)
    text("<3 <3 X", width / 15, 0, 0);
  else if(life == 1)
    text("<3 X X", width / 15, 0, 0);
  else
    text("X X X", width / 15, 0, 0);
  
  //rectMode(CORNER);
  //noFill();
  //rect(50, -75, 155, 85);
  //rectMode(CENTER);
    
  translate(width / 2, height / 2, -width / 2);
  
  pCube.update();
  
  cubeCount++;
  if(cubeCount >= newCube)
  {
    cubeCount = 0;
    
    if(mult == 1)
      cubes.add(new CCube(cubeSpeed));
    else if(mult == 2)
    {
      CCube c1 = new CCube(cubeSpeed);
      CCube c2 = new CCube(cubeSpeed);
      
      c2 = multCheck(c1, c2);
      
      cubes.add(c1);
      cubes.add(c2);
    }
  }
  
  for(int i = 0; i < cubes.size(); i++)
    cubes.get(i).update();
    
  collisions();
  
  difficulty();
}

void difficulty()
{
  if(score < 5)
  {
    newCube = 240;
    cubeSpeed = 5;
  }
  else
  {
    mult = 2;
  }
}

CCube multCheck(CCube c1, CCube c2)
{
  color red = pCube.colors[0];
  color blue = pCube.colors[1];
  color aqua = pCube.colors[2];
  color yellow = pCube.colors[3];
  color green = pCube.colors[4];
  color purple = pCube.colors[5];
  
  while(c1.side == c2.side)
    c2.newSide();
  while(c1.side == 0 && c2.side == 2)
    c2.newSide();
  while(c1.side == 1 && c2.side == 3)
    c2.newSide();
  while(c1.side == 2 && c2.side == 0)
    c2.newSide();
  while(c1.side == 3 && c2.side == 1)
    c2.newSide();
  while(c1.side == 4 && c2.side == 5)
    c2.newSide();
  while(c1.side == 5 && c2.side == 4);
    
  while(c1.col == c2.col)
    c2.newColor();
  while(c1.col == red && c2.col == aqua)
    c2.newColor();
  while(c1.col == blue && c2.col == yellow)
    c2.newColor();
  while(c1.col == aqua && c2.col == red)
    c2.newColor();
  while(c1.col == yellow && c2.col == blue)
    c2.newColor();
  while(c1.col == green && c2.col == purple)
    c2.newColor();
  while(c1.col == purple && c2.col == green)
    c2.newColor();
    
  return c2;
}

void collisions()
{
  for(int i = 0; i < cubes.size(); i++)
  {
    if(cubes.get(i).side == 0 && cubes.get(i).pos.x >= 0 - pCube.sideDist - cubes.get(i).diam)
    {
      if(cubes.get(i).col == pCube.colors[0])
        score++;
      else
        life--;
      cubes.remove(i);
    }
    else if(cubes.get(i).side == 1 && cubes.get(i).pos.z <= 0 + pCube.sideDist + cubes.get(i).diam)
    {
      if(cubes.get(i).col == pCube.colors[1])
        score++;
      else
        life--;
      cubes.remove(i);
    }
    else if(cubes.get(i).side == 2 && cubes.get(i).pos.x <= 0 + pCube.sideDist + cubes.get(i).diam)
    {
      if(cubes.get(i).col == pCube.colors[2])
        score++;
      else
        life--;
      cubes.remove(i);
    }
    else if(cubes.get(i).side == 3 && cubes.get(i).pos.z >= 0 - pCube.sideDist - cubes.get(i).diam)
    {
      if(cubes.get(i).col == pCube.colors[3])
        score++;
      else
        life--;
      cubes.remove(i);
    }
    else if(cubes.get(i).side == 4 && cubes.get(i).pos.y >= 0 - pCube.sideDist - cubes.get(i).diam)
    {
      if(cubes.get(i).col == pCube.colors[4])
        score++;
      else
        life--;
      cubes.remove(i);
    }
    else if(cubes.get(i).side == 5 && cubes.get(i).pos.y <= 0 + pCube.sideDist + cubes.get(i).diam)
    {
      if(cubes.get(i).col == pCube.colors[5])
        score++;
      else
        life--;
      cubes.remove(i);
    }
  }
}

void keyPressed()
{
  if(key == 'a' || key == 'A')
  {
    color c = pCube.colors[0];
    for(int i = 0; i < 3; i++)
      pCube.colors[i] = pCube.colors[i + 1];
    pCube.colors[3] = c;
  }
  else if(key == 'd' || key == 'D')
  {
    color c = pCube.colors[3];
    for(int i = 3; i > 0; i--)
      pCube.colors[i] = pCube.colors[i - 1];
    pCube.colors[0] = c;
  }
  else if(key == 's' || key == 'S')
  {
    color c = pCube.colors[1];
    pCube.colors[1] = pCube.colors[4];
    pCube.colors[4] = pCube.colors[3];
    pCube.colors[3] = pCube.colors[5];
    pCube.colors[5] = c;
  }
  else if(key == 'w' || key == 'W')
  {
    color c = pCube.colors[1];
    pCube.colors[1] = pCube.colors[5];
    pCube.colors[5] = pCube.colors[3];
    pCube.colors[3] = pCube.colors[4];
    pCube.colors[4] = c;
  }
  else if(key == 'q' || key == 'Q')
  {
    color c = pCube.colors[4];
    pCube.colors[4] = pCube.colors[2];
    pCube.colors[2] = pCube.colors[5];
    pCube.colors[5] = pCube.colors[0];
    pCube.colors[0] = c;
  }
  else if(key == 'e' || key == 'E')
  {
    color c = pCube.colors[4];
    pCube.colors[4] = pCube.colors[0];
    pCube.colors[0] = pCube.colors[5];
    pCube.colors[5] = pCube.colors[2];
    pCube.colors[2] = c;
  }
}