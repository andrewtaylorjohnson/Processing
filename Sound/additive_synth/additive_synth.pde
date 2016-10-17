import beads.*;
// create our AudioContext
AudioContext ac;
// the frequency of the fundamental (the lowest sine wave in
// the additive tone)
float baseFrequency = 200.0f;
// how many sine waves will be present in our additive tone?
int sineCount = 10;
// declare our unit generators
// notice that with the brackets []
// we are creating arrays of beads
WavePlayer sineTone[];
Glide sineFrequency[];
Gain sineGain[];
// our master gain object (all sine waves will eventually be
// routed here)
Gain masterGain;
void setup()
{
 size(400, 300);
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
 baseFrequency * (i + 1),
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

 // lower the gain for the next sine in the tone
 currentGain -= (1.0 / (float)sineCount);
 }
 // start audio processing
 ac.start();
}
void draw()
{
 // update the fundamental frequency based on mouse position
 // add 20 to the frequency because below 20Hz is inaudible
 // to humans
 baseFrequency = 20.0f + mouseX;

 // update the frequency of each sine tone
 for( int i = 0; i < sineCount; i++)
 {
 sineFrequency[i].setValue(baseFrequency * (i + 1));
 }
}