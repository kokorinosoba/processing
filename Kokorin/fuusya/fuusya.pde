float angle = 0;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  background(255, 5);
  translate(300, 300);
  line(0, 0, 0, 500);
  rotate(angle);
  rectMode(CENTER);
  rect(0, 0, 200, 200);
  fill(#00ffff);
  triangle(-100, -100, 0, -200, 0, 0);
  triangle(100, -100, 200, 0, 0, 0);
  triangle(100, 100, 0, 200, 0, 0);
  triangle(-100, 100, -200, 0, 0, 0);
  fill(#afeeee);
  angle += 0.02;
}
