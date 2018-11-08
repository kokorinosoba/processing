int step = 600 / 10;
float c;
int h1 = 0;
int h2 = 0;
void setup() {
  size(600, 600);
  colorMode(HSB, 360, 255, 255, 255);
  noStroke();
}
void draw() {
  for (int i = 0; i < width; i += step) {
    for (int j = 0; j < height; j += step) {
      c = map(i, 0, width, 0, 127.5) + map(j, 0, height, 0, 127.5);
      if ((i+j)%(step*2) == 0) {
        fill(h1, c, 255);
      } else {
        fill(h2, 255 - c, 255);
      }
      rect(i, j, step, step);
    }
  }
  h1++;
  if (frameCount % 2 == 0) h2++;
  if (h1 == 360) h1 = 0;
  if (h2 == 360) h2 = 0;
}