PImage img;
int imgWidth = 1280;
int imgHeight = 720;
int dimension;

color[] colors;
float r, g, b;
float rSeed, gSeed, bSeed;

void setup()
{
  img = createImage(imgWidth, imgHeight, RGB);
  dimension = img.width * img.height;
  surface.setSize(img.width, img.height);
  
  rSeed = 255;
  gSeed = 255;
  bSeed = 255;
  
  imageSetup();
}

void draw()
{
  image(img, 0, 0);
}

void imageSetup()
{
  img.loadPixels();
  
  colors = new color[dimension];
  for(int i = 0; i < dimension; i++)
  {
    r = random(rSeed);
    g = random(gSeed);
    b = random(bSeed);
    
    colors[i] = color(r, g, b);
  }
  
  colors = sort(colors);
  
  for(int i = 0; i < dimension; i++)
    img.pixels[i] = colors[i];
  
  img.updatePixels();
}

void keyPressed()
{
  if(key == ENTER)
    saveFrame();
  else if(key == 'r' || key == 'R')
  {
    if(rSeed >0)
    {
      rSeed = 0;
      gSeed = 255;
      bSeed = 255;
    }
    else
      rSeed = 255;
      
    imageSetup();
  }
  else if(key == 'g' || key == 'G')
  {
    if(gSeed >0)
    {
      rSeed = 255;
      gSeed = 0;
      bSeed = 255;
    }
    else
      gSeed = 255;
      
    imageSetup();
  }
  else if(key == 'b' || key == 'B')
  {
    if(bSeed >0)
    {
      rSeed = 255;
      gSeed = 255;
      bSeed = 0;
    }
    else
      bSeed = 255;
      
    imageSetup();
  }
}