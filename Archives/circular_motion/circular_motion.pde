float x, y;
float r = 100;
int angle = 0;

void setup() {
  size(400, 400);
  noStroke();
  fill(0);
}

void draw() {
  background(255);
  float theta = radians(angle);
  x = r * cos(theta);
  y = r * sin(theta);
  ellipse(x + width/2, y + height/2, 10, 10);
  
  angle++;
  if (angle >= 360) angle = 0;
}