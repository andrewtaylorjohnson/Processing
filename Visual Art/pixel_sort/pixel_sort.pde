PImage img;
int fileName = 14;
String fileType = "JPG";
int dimension;

float r, g, b;
int lowEnd;
int highEnd;

color[] colors;

void setup()
{
  img = loadImage(fileName + "." + fileType);
  dimension = img.width * img.height;
  surface.setSize(img.width, img.height);
  
  colors = new color[dimension];
  for(int i = 0; i < dimension; i++)
    colors[i] = img.pixels[i];
    
  //sortPixels();
}

void draw()
{
  image(img, 0, 0);
  saveFrame(fileName + "_partial_sort.png");
}

void sortPixels()
{
  img.loadPixels();
  
  for(int i = 0; i < dimension; i++)
  {
    if(img.pixels[i] < #949494)
    {
      lowEnd = i;
      return;
    }
  }
  for(int i = lowEnd; i < dimension; i++)
    colors[i] = img.pixels[i];
    
  sort(colors);
  
  for(int i = lowEnd; i < dimension; i++)
    img.pixels[i] = colors[i];
  
  img.updatePixels();
}