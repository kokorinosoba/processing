int step = 600 / 10;
color col;

void setup() {
  size(600, 600);
  noStroke();
  for (int i = 0; i < width; i += step) {
    for (int j = 0; j < height; j += step) {
      fill(map(i, 0, width, 0, 255), map(j, 0, height, 0, 255), 150);
      rect(i, j, step, step);
    }
  }
}
void draw() {
  for (int i = 0; i < width; i += step) {
    for (int j = 0; j < height; j += step) {
      col = get(i, j);
      col = color(red(col) + random(-1, 2), green(col) + random(-1, 2), blue(col) + random(-1, 2));
      fill(col);
      rect(i, j, step, step);
    }
  }
}