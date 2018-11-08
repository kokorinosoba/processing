PImage img;

void setup() {
  size(800, 600);
  stroke(255);
  img = loadImage("source.jpg");
  img.resize(width, height);
}
void draw() {
  background(0);
  for (int i = 0; i < width; i++) {
      color col = img.get(i, mouseY);
      stroke(col);
      line(i, 0, i, height);
  }
  stroke(255);
  line(0, mouseY, width, mouseY);
}