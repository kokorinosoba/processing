float t = 0.0;

void setup() {
  size(720, 400);
  background(255);
}

void draw() {
  ellipse(10 * t, 100 * sin(t) + height/2, 10, 10);
  t += 0.1;
}