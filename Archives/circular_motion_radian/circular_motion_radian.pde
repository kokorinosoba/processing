float x, y;
float r = 100;
float theta = 0.0;

float rad = TWO_PI/360.0;

void setup() {
  size(400, 400);
  noStroke();
  fill(0);
}

void draw() {
  background(255);
  x = r * cos(theta);
  y = r * sin(theta);
  ellipse(x + width/2, y + height/2, 10, 10);
  
  theta += rad;
  if (theta >= TWO_PI) theta = 0.0;
}