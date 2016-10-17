import processing.opengl.*;

/***********************************************
///
/// to do:
///   -finish symmetry algorithm
///
***********************************************/

//data structures
ArrayList<Vertex> verts;
ArrayList<Line> lines;

//shape fields
float maxDist = 150;
int count = 1;
int maxCount = 150;
float speed  = 1;

//mode fields
int strobeCount = 0;
int strobeSpeed = 10;
int maskValue = 15;

//different modes
boolean fadeLines = false;
boolean inverted = false;
boolean draw = false;
boolean strobe = false;
boolean symmetry = false;
boolean colored = false;
boolean paused = false;
boolean mask = false;

void setup()
{
  fullScreen();
  noCursor();
  background(0);
  
  verts = new ArrayList<Vertex>();
  for (int i = 0; i < count; i++)
    verts.add(new Vertex(random(width), random(height)));

  lines = new ArrayList<Line>();
  for (int i = 0; i < count; i++)
  {
    for (int j = i; j < count; j++)
    lines.add(new Line(verts.get(i), verts.get(j)));
  }
}

void draw()
{
  if(!paused)
  {
    //run different modes
    modes();
    
    //update verteces
    for (int i = 0; i < count; i++)
      verts.get(i).update();
  
    //update lines
    for (int i = 0; i < lines.size(); i++)
    {
      if (fadeLines)
      {
        if (inverted)
          stroke(0 +  lines.get(i).dist);
        else
          stroke(maxDist - lines.get(i).dist);
      }
      lines.get(i).update();
    }
  }
}

 void modes()
{
  if(mask)
  {
    noStroke();
    if(inverted)
      fill(255, 255, 255, maskValue);
    else
      fill(0, 0, 0, maskValue);
    rect(0, 0, width, height);
  }
  
  //set strobe
  if(strobe)
  {
    strobeCount++;
    
    if(strobeCount % strobeSpeed == 0)
    {     
      if(inverted)
        inverted = false;
      else
        inverted = true;
        
      strobeCount = 0;
    }
  }
  
  //invert colors
  if (inverted)
  {
    if(!draw)
      background(255);
    stroke(0);
  }
  else
  {
    if(!draw)
      background(0);
    stroke(255);
  }
}

void keyPressed()
{
  if(key == ' ')//pause
  {
    if(paused)
      paused = false;
    else
      paused = true;
  }
  else if (key == 'a' || key == 'A')//toggle color invert
  {
    if (inverted)
      inverted = false;
    else
      inverted = true;
  } 
  else if (key == 'f' || key == 'F')//toggle line fade
  {
    if (fadeLines)
    {
      fadeLines = false;
      maxDist = 155;
    } else
    {
      fadeLines = true;
      maxDist = 255;
    }
  }
  else if(key == 'd' || key == 'D')//toggle draw
  {
    if(draw)
      draw = false;
    else
      draw = true;
  
  }
  else if(key == 's' || key == 'S')//toggle strobe effect
  {
    if(strobe)
      strobe = false;
    else
      strobe = true;
  }
  else if(key == 'r' || key == 'R')//reverse vertex direcections
  {
    for(int i = 0; i < verts.size(); i++)
    {
      verts.get(i).xMove *= -1;
      verts.get(i).yMove *= -1;
    }
  }
  else if(key =='w' || key == 'W')
  {
    if(colored)
      colored = false;
    else
      colored = true;
  }
  else if(key == 'e' || key == 'E')
  {
    if(mask)
      mask = false;
    else
      mask = true;
  }
  else if(key == ENTER)//take screenshot
    saveFrame();
  else if(key == CODED)//CODED INPUTS
  {
    if(keyCode == RIGHT)//increase strobe speed
    {
      if(strobeSpeed >= 10)
        strobeSpeed -= 5;
    }
    else if(keyCode == LEFT)//decrease strobe speed
    {
      if(strobeSpeed <= 250)
        strobeSpeed += 5;
    }
    else if(keyCode == UP)//increase number of verteces
    {
      if(count < maxCount)
      {
        count++;
        
        verts.add(new Vertex(random(width), random(height)));
        
        lines.clear();
        for (int i = 0; i < count; i++)
        {
          for (int j = i; j < count; j++)
          lines.add(new Line(verts.get(i), verts.get(j)));
        }
      }
    }
    else if(keyCode == DOWN)//decrease number of verteces
    {
      if(count > 1)
      {
        count--;
        
        verts.remove(verts.size() - 1);
        
        lines.clear();
        for (int i = 0; i < count; i++)
        {
          for (int j = i; j < count; j++)
          lines.add(new Line(verts.get(i), verts.get(j)));
        }
      }
    }
  }
  
}

//////////////////
///VERTEX CLASS///
//////////////////
class Vertex
{
  public float x;
  public float xMove;
  public float y;
  public float yMove;

  Vertex(float x, float y)
  {
    this.x = x;
    this.y = y;
    xMove = random(-speed, speed);
    yMove = random(-speed, speed);
  }

  public void update()
  {
    if (x <= 0 || x >= width)
      xMove *= -1;
    if (y <= 0 || y >= height)
      yMove *= -1;

    x += xMove;
    y += yMove;
  }
}

////////////////////
/////LINE CLASS/////
////////////////////
class Line
{
  private Vertex v1;
  private Vertex v2;
  public float dist;
  private color col;

  Line(Vertex v1, Vertex v2)
  {
    this.v1 = v1;
    this.v2 = v2;
    dist = findDist();
    col = color(random(255), random(255), random(255));
  }

  public void update()
  {
    dist = findDist();
    if(colored)
      stroke(col);
    if (findDist() <= maxDist)
      line(v1.x, v1.y, v2.x, v2.y);
  }

  private float findDist()
  {
    float x1 = v1.x;
    float y1 = v1.y;
    float x2 = v2.x;
    float y2 = v2.y;

    return sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2));
  }
}