color[] colors = {#331940, #5E366A, #0CCA98, #00FFCC};

void setup()
{
  size(500, 500, P3D);
  noStroke();
  noFill();
  rectMode(CENTER);
}

void draw()
{
  fill(colors[0]);
  rect(width / 4, height / 4, width / 2, width / 2);
  fill(colors[1]);
  rect(width * 3/4, height / 4, width / 2, width / 2);
  fill(colors[2]);
  rect(width / 4, height * 3/4, width / 2, width / 2);
  fill(colors[3]);
  rect(width * 3/4, height * 3/4, width / 2, width / 2);
}