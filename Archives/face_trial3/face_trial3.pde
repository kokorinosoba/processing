PImage img;
color col;
int x, y;
float brightness;
float noiserX = 0, noiserY = 0;
float noiseX, noiseY;

void setup() {
  size(900, 600);
  img = loadImage("cat.jpg");
  img.resize(width, height);
  background(0);
  noStroke();
}

void draw() {
  for (int i = 0; i < 250; i++) {
    x = int(random(width));
    y = int(random(height));
    col = img.get(x, y);
    fill(col);
    noiseX = noise(noiseX) * 50 - 25;
    noiseY = noise(noiseY) * 50 - 25;
    ellipse(x + noiseX, y + noiseY, 2, 2);
    noiserX++;
    noiserY++;
  }
}