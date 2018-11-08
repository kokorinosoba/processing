size(600, 600);
textSize(18);
for (int i = 0; i < width; i += 100) {
  text(i, i, 20);
}
for (int i = 0; i < height; i += 100) {
  text(i, 0, i);
}
