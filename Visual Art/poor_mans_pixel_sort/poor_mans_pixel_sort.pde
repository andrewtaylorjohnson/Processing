PImage img;
int fileName = 43;
String fileType = "jpg";
int dimension;
color[] colors;
color c;
float r, g, b;

void setup()
{
  img = loadImage(fileName + "." + fileType);
  dimension = img.width * img.height;
  surface.setSize(img.width, img.height);
  
  colors = new color[dimension];
  for(int i = 0; i < dimension; i++)
    colors[i] = img.pixels[i];
  
  sortPixels();
}

void draw()
{
  image(img, 0, 0);
  saveFrame(fileName + "_sort.png");
  //exit();
}

void sortPixels()
{
  img.loadPixels();
  
  for(int i = 0; i < dimension; i++)
  {
    c = colors[i];
    r = (c >> 16) & 0xFF;
    g = (c >> 8) & 0xFF;
    b = c & 0xFF;
    
    if(c > #999999)
    {
      for(int j = i; j < dimension; j += width)
      {
        r--;
        g--;
        b--;
        c = color(r, g, b);
        img.pixels[j] = c;
      }
    }
  }
    
  img.updatePixels();
}