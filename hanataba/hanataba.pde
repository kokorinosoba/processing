int flowerNom = 100;
Flower[] flower = new Flower[flowerNom];

void setup() {
  size(600, 600);
  background(0);
  for ( int i = 0; i < flowerNom; i++){
    flower[i] = new Flower(300,200);
  }
}

void draw() {
  background(0);
    for ( int i = 0; i < flowerNom; i++){
    flower[i].draw();
  }
}
