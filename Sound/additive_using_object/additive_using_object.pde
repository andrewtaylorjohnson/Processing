import beads.*; // import the beads library
AudioContext ac; // declare our AudioContext
float baseFrequency = 200.0f; // fundamental frequency
int sineCount = 10; // how many sine waves will be present
// declare our unit generators
WavePlayer sineTone[];
Glide sineFrequency[];

Gain sineGain[];
// our master gain object
Gain masterGain;
// this is a ball that will bounce around the screen
bouncer b;

void setup()
{
 size(400, 300);

 // initialize our bouncy bal
 b = new bouncer();
 // initialize our AudioContext
 ac = new AudioContext();

 // set up our master gain object
 masterGain = new Gain(ac, 1, 0.5);
 ac.out.addInput(masterGain);
 // initialize our arrays of objects
 sineFrequency = new Glide[sineCount];
 sineTone = new WavePlayer[sineCount];
 sineGain = new Gain[sineCount];
 float currentGain = 1.0f;
 for( int i = 0; i < sineCount; i++)
 {
 // create the glide that will control this WavePlayer's
 // frequency
 sineFrequency[i] = new Glide(ac,
 baseFrequency * i,
30);
 // create the WavePlayer
 sineTone[i] = new WavePlayer(ac,
 sineFrequency[i],
Buffer.SINE);

 // create the gain object
 sineGain[i] = new Gain(ac, 1, currentGain);
 // then connect the waveplayer to the gain
 sineGain[i].addInput(sineTone[i]);

 // finally, connect the gain to the master gain
 masterGain.addInput(sineGain[i]);

 // lower the gain for the next tone in the additive
 // complex
 currentGain -= (1.0 / (float)sineCount);
 }

 // start audio processing
 ac.start();
}

void draw()
{
 background(0); // fill the background with black

 b.move(); // move the bouncer
 b.draw(); // draw the bouncer
 // update the fundamental frequency based on mouse position
 baseFrequency = 20.0f + b.x;

 // update the frequency of each sine tone
 for( int i = 0; i < sineCount; i++)
 {
 sineFrequency[i].setValue(baseFrequency *
 ((float)(i+1) * (b.y/height)));
 }
}
// this class encapsulates a simple circle that will bounce
// around the Processing window
class bouncer
{
 public float x = 10.0;
 public float y = 10.0;
 float xSpeed = 1.0;
 float ySpeed = 1.0;

 void bouncer() { }

 void move()
 {
 x += xSpeed;
 if( x <= 0 ) xSpeed = 1.0;
 else if( x >= width - 10 ) xSpeed = -1.0;

 y += ySpeed;
 if( y <= 0 ) ySpeed = 1.0;
 else if( y >= height - 10 ) ySpeed = -1.0;
 }

 void draw()
 {
 noStroke();
 fill(255);
 ellipse(x, y, 10, 10);
 }
}