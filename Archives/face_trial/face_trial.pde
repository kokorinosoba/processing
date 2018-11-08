PImage img;
final int NUM = 50;
Piece[] p = new Piece[NUM];
color col;

void setup() {
  size(900, 600);
  frameRate(60);
  img = loadImage("cat.jpg");
  img.resize(width, height);
  background(0);
  for (int i = 0; i < NUM; i++) {
    p[i] = new Piece();
  }
}

void draw() {
  // image(img, 0, 0, width, height);
  for (int i = 0; i < NUM; i++) {
    col = img.get(int(p[i].location.x), int(p[i].location.y));
    fill(col);
    stroke(col);
    p[i].draw();
  }
}