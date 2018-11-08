int flowerNum = 50;
Flower[] flower = new Flower[flowerNum];

void setup() {
  size(600, 600);
  background(0);
  for (int i = 0; i < flowerNum; i++) {
    flower[i] = new Flower();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < flowerNum; i++) {
    flower[i].draw();
  }
}
