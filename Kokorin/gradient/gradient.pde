size(600, 600);
background(0);
int step = 100;
for(int i = 0; i < width; i += step) {
  noStroke();
  fill(255, float(i) / width * 255);
  rect(i, 0,  step, height);
}
