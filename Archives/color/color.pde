size(600, 600);
int step = 600 / 10;
noStroke();
for (int i = 0; i < width; i += step) {
  fill(map(i, 0, width, 0, 255));
  rect(i, 0, step, height);
}