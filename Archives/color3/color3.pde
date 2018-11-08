size(600, 600);
int step = 600 / 10;
float col;
noStroke();
for (int i = 0; i < width; i += step) {
  for (int j = 0; j < height; j += step) {
    col = map(i, 0, width, 0, 127.5) + map(j, 0, height, 0, 127.5);
    fill(100, col, col);
    rect(i, j, step, step);
  }
}