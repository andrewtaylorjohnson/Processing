import themidibus.*;

//polygon fields
ArrayList<Polygon> polys;
float radius;
float baseRotation = 270;
float rotation = 0;
float growth = 0;

//color fields
int stroke = 0;
float gradiate = 0;
boolean useFill = true;
boolean useStroke = true;

//file fields
String fileName = "polygons";
int fileCount = 0;
String fileType = ".png";

MidiBus bus;

void setup()
{
  //size(1280, 720);
  fullScreen();
  noCursor();
  
  background(255);
  fill(0);
  stroke(0);
  strokeWeight(3);
  
  radius = height * 0.45;
  polys = new ArrayList<Polygon>(); 
  
  MidiBus.list();
  bus = new MidiBus(this, 0, 1);
}

void draw()
{
  background(255);
  
  if(useFill)
    fill(255 - gradiate * 0.25);
  ellipse(width / 2, height / 2, radius * 2, radius * 2);
  
  for(int i = 1; i <= polys.size(); i++)
  {
    if(useFill)
      fill(255 - gradiate  * i);
    if(useStroke)
      stroke(stroke);
    polys.get(polys.size() - i).rotation = i * this.rotation / 2;
    polys.get(polys.size() - i).radius = radius + growth * i;
    polys.get(polys.size() - i).update();
  }
}

void keyPressed()
{
  if(key == ENTER)
  {
    saveFrame(fileName + fileCount + fileType);
    fileCount++;
  }
}

////////////////////////////////
/////////MIDI CONTROLS//////////
////////////////////////////////
void controllerChange(int channel, int number, int value)
{
  println();
  println("Controller Change");
  println("  Channel: " + channel + " Knob: "+ number + " Value: "+ value);
  
  if(number == 1)
    rotation = value;
  if(number == 2)
    growth = -value;
  if(number == 3)
  {
    polys.clear();
    for(int i = 0; i < value / 12; i++)
    {
      polys.add(new Polygon(0, 0, radius + growth * i, i + 3, i * rotation));
      
      //polys.add(new Polygon(-100, -100, radius + growth * i, i + 3, i * rotation));
      //polys.add(new Polygon(-100, 100, radius + growth * i, i + 3, i * rotation));
      //polys.add(new Polygon(100, -100, radius + growth * i, i + 3, i * rotation));
      //polys.add(new Polygon(100, 100, radius + growth * i, i + 3, i * rotation));
    }
  }
  
  
  if(number == 5)
    stroke = value * 2;
  if(number == 6)
    gradiate = value;
}

void noteOn(int channel, int pitch, int velocity) 
{
  // Receive a noteOn
  println();
  println("Note On:");
  println("  Channel: " + channel + " Pitch: " + pitch + " Velocity: "+ velocity);
}

void noteOff(int channel, int pitch, int velocity) 
{
  // Receive a noteOff
  println();
  println("Note Off:");
  println("  Channel: " + channel + " Pitch: "+pitch + " Velocity: "+ velocity);
  
  if(pitch == 46)
    useFill = true;
    
  else if(pitch == 47)
  {
    noFill();
    useFill = false;
  }
    
  if(pitch == 44)
    useStroke = true;
  else if(pitch == 45)
  {
    noStroke();
    useStroke = false;
  }
} 