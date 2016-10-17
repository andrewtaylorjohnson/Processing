import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import themidibus.*;

Minim minim;
AudioOutput out;
Oscil waveAdd1;
Oscil waveAdd2;
Oscil waveKeys;
Oscil beat;
boolean beatPlay = true;

MidiBus bus;
MidiBus bus2;

float[] freqs;
float C0 = 16.35;

boolean rgb = true;
int r = 0;
int rShift = 5;
int g = 0;
int gShift = 10;
int b = 0;
int bShift = 15;

float arrayWidth = 50;

boolean paused = false;

int picCount = 0;

//ArrayList<Polygon> polys;

void setup()
{
  //fullScreen();
  size(1280, 720);
  background(0);
  stroke(255);
  colorMode(RGB);
  noCursor();
  
  freqs = new float[120];
  for(int i = 0; i < freqs.length; i++)
  {
    freqs[i] = C0;
    C0 *= 1.059488135;
  }
  
  minim = new Minim(this);
  out = minim.getLineOut();
  waveAdd1 = new Oscil(0, 0.0f, Waves.SINE); // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
  waveAdd1.patch(out); // patch the Oscil to the output
  waveAdd2 = new Oscil(0, 0.0f, Waves.SINE);
  waveAdd2.patch(out);
  waveKeys = new Oscil(freqs[36], 0.0f, Waves.SINE);
  waveKeys.patch(out);
  beat = new Oscil(0, 0.0f, Waves.SAW);
  beat.patch(out);
  
  MidiBus.list();
  
  bus = new MidiBus(this, 0, 1);
  bus2 = new MidiBus(this, 1, 1);
}

void draw()
{
  if(!paused)
  {
    background(0);
    
    for(int i = 0; i < out.bufferSize() - 1; i++)
    {
      line( i + out.bufferSize() / 7, height / 3  - out.left.get(i ) * 25, 
        i + 1 + out.bufferSize() / 7, height / 3  - out.left.get(i+1) * 25);
      line( i + out.bufferSize() / 15, height / 3 * 2 - out.right.get(i) * 25, 
        i + 1 + out.bufferSize() / 15, height / 3 * 2 - out.right.get(i+1) * 25);
        
      if(i % 5 == 0)
      {
         line( i + out.bufferSize() / 15, height / 3 * 2  - out.left.get(i) * 25, 
           i + out.bufferSize() / 7, height / 3  - out.left.get(i+1) * 25); 
      }
    } 
  }
}

void keyPressed()
{ 
  switch( key )
  {
    case '1': 
      waveKeys.setWaveform( Waves.SINE );
      break;
 
    case '2':
      waveKeys.setWaveform( Waves.TRIANGLE );
      break;
 
    case '3':
      waveKeys.setWaveform( Waves.SAW );
      break;
 
    case '4':
      waveKeys.setWaveform( Waves.SQUARE );
      break;
 
    case '5':
      waveKeys.setWaveform( Waves.QUARTERPULSE );
      break;
 
    default: break; 
  }
  
  if(key == 'p' || key == 'p')
  {
    if(paused)
      paused = false;
    else
      paused = true;
  }
  if(key == ENTER)
  {
    saveFrame("waveform_" + picCount + ".png");
  }
}

void controllerChange(int channel, int number, int value)
{
  println("Controller Change");
  println("  Channel: " + channel + " Knob: "+ number + " Value: "+ value);
  
  if(number == 1)
    rShift = value;
  if(number == 2)
    gShift = value;
  if(number == 3)
    bShift = value;
  if(number == 4)
    waveKeys.setAmplitude(value / 10);
  if(number == 5)
    waveAdd1.setAmplitude(value / 25);
  if(number == 6)
    waveAdd1.setFrequency(value * 4);
  if(number == 7)
    waveAdd2.setFrequency(value * 2);
  if(number == 8)
    waveAdd2.setAmplitude(value / 25);
}

void noteOn(int channel, int pitch, int velocity) 
{
  // Receive a noteOn
  println();
  println("Note On:");
  println("  Channel: " + channel + " Pitch: "+ pitch + " Velocity: "+ velocity);
  
  waveKeys.setFrequency(freqs[pitch]);
}

void noteOff(int channel, int pitch, int velocity) 
{
  // Receive a noteOff
  println();
  println("Note Off:");
  println("  Channel: " + channel + " Pitch: "+ pitch + " Velocity: "+ velocity);
  
  if(pitch == 44)
    colorMode(RGB);
  else if(pitch == 45)
    colorMode(HSB);
}