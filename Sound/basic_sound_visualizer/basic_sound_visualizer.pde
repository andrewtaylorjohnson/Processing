import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;

void setup()
{
  size(1024, 720);
  
  minim = new Minim(this);
  song = minim.loadFile("sync.mp3", width);
  song.play();
  
  fft = new FFT(song.bufferSize(), song.sampleRate());
}

void draw()
{
  background(0);
  
  fft.forward(song.mix);
  
  stroke(0, 0, 255);  
  
  for(int i = 0; i < fft.specSize(); i++)
  {
    //line(i, height / 2, i, (height / 2) - fft.getBand(i)*4);
    //line(width - i, height / 2, width - i, (height / 2) - fft.getBand(i)*4);
    line(width / 2 - i, height / 2, width / 2 - i, (height / 2) - fft.getBand(i) * 10);
    line(width / 2 + i, height / 2, width / 2 + i, (height / 2) - fft.getBand(i) * 10);
    
    //line(i, height / 2, i, (height / 2) + fft.getBand(i)*4);
    //line(width - i, height / 2, width - i, (height / 2) + fft.getBand(i)*4);
    line(width / 2 - i, height / 2, width / 2 - i, (height / 2) + fft.getBand(i) * 10);
    line(width / 2 + i, height / 2, width / 2 + i, (height / 2) + fft.getBand(i) * 10);
  }
    
    stroke(255);
  
  for(int i = 0; i < song.bufferSize() - 1; i++)
    line(i, (height / 2) + (song.left.get(i) * 350), i + 1, (height / 2) + (song.left.get(i + 1) * 350));
}