float pw = 0.5;
int range = 10;

void setup () {
  size(800, 600);
  background(0);
  frameRate(10);
  noStroke();
  rectMode(CENTER);
}

void draw () {
  background(0, 16);
  if (pw < 0.5) {
    pw = pw + 2 * pw * pw;
  }
  else {
    pw = pw - 2 * (1 - pw) * (1 - pw);
  }
  if (pw < 0.1 || pw > 0.9) {
    pw = random(255) / 255;
  }
  
  fill(255 * pw, 165 * pw, 0, 180);
  ellipse(width/2, height/2, 200, 200);
  fill(255, 200, 0);
  ellipse(width/2, height/2, 20, 20);
  triangle(width/2, height/2 - 20, width/2 - 9, height/2 - 5, width/2 + 9, height/2 - 5);
  fill(200, 0, 0, 200);
  ellipse(width/2, height/2 + 3, 10, 10);
  fill(255, 200);
  rect(width/2, height/2 + 100, 20, 170);
}