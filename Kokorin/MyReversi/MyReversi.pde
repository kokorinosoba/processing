Board board;

void setup() {
  size(800, 800);
  board = new Board();
}

void draw() {
  board.display();
}
