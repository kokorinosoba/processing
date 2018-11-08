class Board {
  ArrayList<ArrayList> cells;
  
  Board() {
    cells = new ArrayList<ArrayList>();
    
    for(int row = 0; row < 8; row++) {
      ArrayList<Cell> rCells = new ArrayList<Cell>();
      
      for(int col = 0; col < 8; col++){
        Cell cell = new Cell(col, row);
        rCells.add(cell);
      }
      
      cells.add(rCells);
    }
  }
  
  void display() {
    for(ArrayList<Cell> row: cells) {
      for(Cell c: row) {
        c.display();
      }
    }
  }
}
