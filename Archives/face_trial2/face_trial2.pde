PImage img;
color col;
int x, y;
float brightness;

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
    brightness = (red(col) + green(col) + blue(col)) / 3;
    fill(brightness);
    ellipse(x, y, 2, 2);
  }
}