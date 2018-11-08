PImage img;

void setup() {
  size(800, 600);
  img = loadImage("source.jpg");
}
void draw() {
  background(0);
  tint(0, 127, 255);
  image(img, 0, 0, width/2, height/2);
  noTint();
  image(img, width/2, height/2, width/2, height/2);
}