class Cell {
  int col;
  int row;
  
  Cell(int colNum, int rowNum) {
    col = colNum;
    row = rowNum;
  }
  
  void display() {
    stroke(0);
    fill(200, 100, 200);
    rect(col * 100, row * 100, 100, 100);
  }
}
