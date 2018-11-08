PImage img1, img2, img3;
color col;
int x, y;

void setup() {
  size(500, 600);
  img1 = loadImage("face1.png");
  img2 = loadImage("face2.jpg");
  img3 = loadImage("face3.png");
  img1.resize(width, height);
  img2.resize(width, height);
  img3.resize(width, height);
  background(0);
}

void draw() {
  for(int i = 0; i < 1000; i++) {
    draw_face(img1);
    draw_face(img2);
    draw_face(img3);
  }
}

void draw_face(PImage img) {
    x = int(random(width));
    y = int(random(height));
    col = img.get(x, y);
    stroke(col);
    point(x, y);
}