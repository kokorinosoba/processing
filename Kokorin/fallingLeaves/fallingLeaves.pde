int NUM = 100;
Leaf[] drops = new Leaf[NUM];

void setup() {
  size(800, 800);
  frameRate(60);
  blendMode(ADD);
  noStroke();
  
  for (int i = 0; i < NUM; i++) {
    drops[i] = new Leaf();
  }
}
void draw() {
  background(0);
  for (int i = 0; i < NUM; i++) {
    drops[i].draw();
  }
}
