ArrayList<Bubble> bubbles;
PImage img;
int maxSize = 40;
void setup() {
  size(800, 600);
  frameRate(60);
  noStroke();
  bubbles = new ArrayList<Bubble>();
  img = loadImage("source.jpg");
  img.resize(width, height);
  for (int i = 0; i < 10; i++) {
    PVector loc = new PVector(random(width), random(height));
    bubbles.add(new Bubble(loc));
  }
}
void draw() {
  background(0);
  for (int i = 0; i < bubbles.size(); i++) {
    bubbles.get(i).draw();
  }
  for (int i = 0; i < bubbles.size(); i++) {
    if (bubbles.get(i).isDead == false) {
      boolean expand = bubbles.get(i).checkPixel();
      if (expand == false) {
        PVector loc;
        while (true) {
          loc = new PVector(random(width), random(height));
          color c = get(int(loc.x), int(loc.y));
          if ((red(c) + blue(c) + green(c)) == 0) break;
        }
        bubbles.add(new Bubble(loc));
        bubbles.get(i).isDead = true;
      }
    }
  }
}

void mouseClicked() {
  bubbles.clear();
  for (int i = 0; i < 100; i++) {
    PVector loc = new PVector(random(width), random(height));
    bubbles.add(new Bubble(loc));
  }
}