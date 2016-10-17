//GENERAL FIELDS
boolean paused = false;
int bgColorNorm = 0;
int bgColorInv = 225;
int strColorNorm = 225;
int strColorInv = 0;
int currentBgCol = bgColorNorm;
int currentStrCol = strColorNorm;

//VERTEX FIELDS
ArrayList<Vertex> verts; 
boolean verteces = true;
boolean fadeLines = true;
boolean draw = false;
int numVerts = 0;
int maxVerts = 75;
float maxDist = 255;

//POLYGON FIELDS
ArrayList<Polygon> polys;
boolean polygons = false;
boolean polyRot = false;
boolean nonUni = false;
float polyX = 0;
float polyY = 0;
float polyRad = 1;
int polySides = 2;
float polyTime = 30;
float polySpeed = 1;
float rotSpeed = 0.5;

//KINETIC FIELDS
Kinetics[] kinetics;
boolean kinetic = false;
float[] v1rots;
float[] v2rots;

void setup()
{
  fullScreen();
  background(bgColorNorm);
  stroke(strColorNorm);
  noFill();
  noCursor();
  smooth(8);
  
  verts = new ArrayList<Vertex>();
  
  polys = new ArrayList<Polygon>();
  
  kinetics = new Kinetics[32];
  
  v1rots = new float[4];
  v2rots = new float[4];
  for(int i = 0; i < 4; i++)
  {
    v1rots[i] = random(-0.5, 0.5);
    v2rots[i] = random(-0.5, 0.5);
  }
  
  for(int i = 0; i < 8; i++)
  {
    if(i < 4)
    {
      kinetics[i] = new Kinetics(width / 5 * (i + 1), height / 3, v1rots[0]);
      kinetics[i + 4] = new Kinetics(width / 5 * (i + 1), height / 3, v1rots[1]);
      kinetics[i + 8] = new Kinetics(width / 5 * (i + 1), height / 3, v1rots[2]);
      kinetics[i + 12] = new Kinetics(width / 5 * (i + 1), height / 3, v1rots[3]);
    }
    else
    {
      kinetics[i + 12] = new Kinetics(width / 5 * (i - 3), height / 3 * 2, v2rots[0]);
      kinetics[i + 16] = new Kinetics(width / 5 * (i - 3), height / 3 * 2, v2rots[1]);
      kinetics[i + 20] = new Kinetics(width / 5 * (i - 3), height / 3 * 2, v2rots[2]);
      kinetics[i + 24] = new Kinetics(width / 5 * (i - 3), height / 3 * 2, v2rots[3]);
    }
  }
  
  float randSeed = random(-0.5, 0.5);
      
  for(int i = 0; i < 32; i++)
  {
    kinetics[i].rot = randSeed;
  }
  
  for(int i = 16; i < 32; i++)
    kinetics[i].len *= -1;
}

void draw()
{
  if(!paused)
  {
    if(!draw)
      background(currentBgCol);
    stroke(currentStrCol);
    
    if(verteces && fadeLines)
      strokeWeight(3);
    else if(kinetic)
      strokeWeight(5);
    else
      strokeWeight(2);
    
    if(verteces)
      verteces();
    if(polygons)
      polygons();
    if(kinetic)
    {
      kinetics();
      
      if(draw)
      {
        fill(currentBgCol, 1);
        noStroke();
        rect(0, 0, width, height);
      }
    }
  }
}

void verteces()
{
  for (int i = 0; i < numVerts; i++)
  {
    Vertex v1 = verts.get(i);
    v1.update();
    for (int j = i; j < numVerts; j++)
    {
      Vertex v2 = verts.get(j);
      float dist = PVector.dist(v1.pos, v2.pos);
      if (dist <= maxDist)
      {
        if(fadeLines)
        {
          if(currentStrCol == strColorNorm)
            stroke(currentStrCol - dist);
          else
            stroke(currentStrCol + dist);
        }
        
        line(v1.pos.x, v1.pos.y, v2.pos.x, v2.pos.y);
      }
    }
  }
}

void polygons()
{
  if (frameCount % polyTime == 0)
  {
    if (nonUni)
    {
      if (rotSpeed > 2 || rotSpeed < 1)
      rotSpeed *= -1;

      rotSpeed += 2.5;
    }
    Polygon poly = new Polygon(polyX, polyY, polyRad, polySides, rotSpeed, polyRot);

    polys.add(poly);
  }

  for (int i = 0; i < polys.size(); i++)
  {
    if (polys.get(i).radius > width)
    polys.remove(i);

    polys.get(i).update();
  }
}

void kinetics()
{
  if(draw)
    stroke(currentStrCol);
  
  for(int i = 0; i < 32; i++)
    kinetics[i].update();
}

void changeMode()
{
  verts.clear();
  numVerts = 0;

  polys.clear();
  polyX = 0;
  polyY = 0;
  
  draw = false;
}

void keyPressed()
{
  //////////////////////
  //general controls
  //////////////////////
  if (key == 'v' || key == 'v')
  {
    if(!verteces)
    {
      verteces = true;
      polygons = false;
      kinetic = false;
      
      changeMode();
    }
  }else if(key == 'p' || key == 'P')
  {
    if(!polygons)
    {
      polygons = true;
      verteces = false;
      kinetic = false;
      
      changeMode();
    }
  } else if(key == 'k' || key == 'K')
  {
    if(!kinetic)
    {
      kinetic = true;
      verteces = false;
      polygons = false;
      
      changeMode();
    }
  }
  else if (key == 'i' || key == 'I')
  {
    if (currentBgCol == bgColorNorm)
    {
      if(draw)
      {
        currentBgCol = bgColorInv;
        currentStrCol = strColorInv;
      }
    } else
    {
      currentBgCol = bgColorNorm;
      currentStrCol = strColorNorm;
    }
  } else if (key == ' ')
  {
    if (paused)
    paused = false;
    else
      paused = true;
  }
  else if(key == ENTER)
  {
      saveFrame();
  }

  ///////////////////////
  //vertex controls
  ///////////////////////
  if (verteces)
  {
    if (key == 'd' || key == 'D')
    {
      if (draw)
      {
        draw = false;
        currentBgCol = bgColorNorm;
        currentStrCol = strColorNorm;
      }
      else
        draw = true;
    }
    else if (key == 'r' || key == 'R')
    {
      for (int i = 0; i < numVerts; i++)
      {
        verts.get(i).vel.x *= -1;
        verts.get(i).vel.y *= -1;
      }
    }
    else if(key == 'f' || key == 'F')
    {
      if(fadeLines)
        fadeLines = false;
      else
        fadeLines = true;
    }

    if (key == CODED)
    {
      if (keyCode == UP)
      {
        if (numVerts < maxVerts)
        {
          verts.add(new Vertex());
          numVerts++;
        }
      } else if (keyCode == DOWN)
      {
        if (numVerts > 0)
        {
          verts.remove(verts.size() - 1);
          numVerts--;
        }
      }
    }
  }

  //////////////////////
  //polygon controls
  //////////////////////
  if (polygons)
  {
    if (key == 'r' || key == 'R')
    {
      polyX = 0;
      polyY = 0;

      if (polyRot)
        polyRot = false;
      else
        polyRot = true;
    } else if (key == 'u' || key == 'U')
    {
      if (nonUni)
        nonUni = false;
      else
        nonUni = true;
    }

    if (!polyRot)
    {
      if (key == 'w' || key == 'W')
        polyY -= polySpeed;
      else if (key == 's' || key == 'S')
        polyY += polySpeed;
      else if (key == 'a' || key == 'A')
         polyX -= polySpeed;
      else if (key == 'd' || key == 'D')
        polyX += polySpeed;
    }

    if (polyRot)
    {
      if (!nonUni)
      {
        if (key == '1')
          rotSpeed = 0.5;
        else if (key == '2')
          rotSpeed = 1;
        else if (key == '3')
          rotSpeed = 1.5;
        else if (key == '4')
          rotSpeed = 2;
      }
    }

    if (key == CODED)
    {
      if (keyCode == UP)
      {
        if (polyTime > 5)
        polyTime -= 5;
      } else if (keyCode == DOWN)
      {
        if (polyTime < 30)
        polyTime += 5;
      } else if (keyCode == LEFT)
      {
        if (polySides > 2)
        polySides--;
      } else if (keyCode == RIGHT)
      {
        if (polySides < 9)
        polySides++;
      }
    }
  }
  
  //////////////////////////////
  //KINETICS CONTROLS
  /////////////////////////////
  if(kinetic)
  {
    if(key == '1')
    {
      float randSeed = random(-0.5, 0.5);
      
      for(int i = 0; i < 32; i++)
      {
        kinetics[i].rot = randSeed;
      }
    }
    else if(key == '2')
    {
      for(int i = 0; i < 4; i++)
      {
        v1rots[i] = random(-0.5, 0.5);
        v2rots[i] = v1rots[i];
        
        kinetics[i].rot = v1rots[i];
        kinetics[i + 4].rot = v2rots[i];
        kinetics[i + 8].rot = -v2rots[i];
        kinetics[i + 12].rot = -v1rots[i];
        kinetics[i + 16].rot = -v1rots[i];
        kinetics[i + 20].rot = -v2rots[i];
        kinetics[i + 24].rot = v2rots[i];
        kinetics[i + 28].rot = v1rots[i];
      }
    }
    else if(key == '4')
    {
      for(int i = 0; i < 4; i++)
      {
        v1rots[i] = random(-0.5, 0.5);
        v2rots[i] = random(-0.5, 0.5);
      }
      for(int i = 0; i < 8; i++)
      {
        if(i < 4)
        {
          kinetics[i] = new Kinetics(width / 5 * (i + 1), height / 3, v1rots[0]);
          kinetics[i + 4] = new Kinetics(width / 5 * (i + 1), height / 3, v1rots[1]);
          kinetics[i + 8] = new Kinetics(width / 5 * (i + 1), height / 3, v1rots[2]);
          kinetics[i + 12] = new Kinetics(width / 5 * (i + 1), height / 3, v1rots[3]);
        }
        else
        {
          kinetics[i + 12] = new Kinetics(width / 5 * (i - 3), height / 3 * 2, v2rots[0]);
          kinetics[i + 16] = new Kinetics(width / 5 * (i - 3), height / 3 * 2, v2rots[1]);
          kinetics[i + 20] = new Kinetics(width / 5 * (i - 3), height / 3 * 2, v2rots[2]);
          kinetics[i + 24] = new Kinetics(width / 5 * (i - 3), height / 3 * 2, v2rots[3]);
        }
      }
    }
    else if (key == 'd' || key == 'D')
    {
      if (draw)
      {
        draw = false;
        currentBgCol = bgColorNorm;
        currentStrCol = strColorNorm;
      }
      else
        draw = true;
    }
  }
}