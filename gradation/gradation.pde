void setup() {
  size(600, 600);
  noStroke();
  color c1 = color(218, 112, 214);
  color c2 = color(128, 0, 128);
  for (float w = 0; w <= width; w +=100) {
    color c = lerpColor(c1, c2, w / width);
    fill(c, 100);
    ellipse(w, height/2, 200, 200);
    ellipse(w, height*3/4, 200, 200);
  }
}
