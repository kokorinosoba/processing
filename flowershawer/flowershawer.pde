int flowerNom = 40;
Flower[] flower = new Flower[flowerNom];

void setup() {
  size(600, 600);
  background(0);
  for ( int i = 0; i < flowerNom; i++){
    flower[i] = new Flower();
  }
}

void draw() {
  background(0);
    for ( int i = 0; i < flowerNom; i++){
    flower[i].draw();
  }
}
