PImage img;

void setup() {
  size(800, 600);
  stroke(255);
  img = loadImage("ikuo.jpg");
  img.resize(width, height);
  frameRate(5);
}
void draw() {
  background(0);
  noStroke();
  int step = 100;
  if (frameCount <= 100) {
    step = 100 - frameCount;
  }
  for (int i = 0; i < width; i += step) {
    for (int j = 0; j < height; j += step) {
      color col = img.get(i, j);
      fill(col);
      rect(i, j, step, step);
    }
  }
}