PImage img;

void setup() {
  size(800, 600);
  img = loadImage("source.jpg");
  img.filter(BLUR, 10);
}
void draw() {
  background(0);
  image(img, 0, 0, width, height);
}