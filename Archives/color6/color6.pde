size(600, 600);
int step = 600 / 10;
noStroke();
for (int i = 0; i < width; i += step) {
  for (int j = 0; j < height; j += step) {
        fill(abs(map(i, 0, width, -255, 255)), map(j, 0, height, 0, 255), 150);
        rect(i, j, step, step);
  }
}