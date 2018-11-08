float radius = (width + height) / 5;
float centx = width/2;
float centy = height/2;
float angle = 0;
float x, y, symx, symy;
float rad;
int stroke = 0, stroker = 1;

void setup() {
  size(600, 600);
  radius = (width + height) / 5;
  centx = width/2;
  centy = height/2;
  smooth();
}
void draw() {
  fill(255, 5);
  rect(0, 0, width, height);
  stroke(20, 50, 70, stroke);
  rad = radians(angle);
  x = centx + cos(rad)*radius;
  y = centy + sin(rad)*radius;
  rad = radians(angle + 180);
  symx = centx + cos(rad)*radius;
  symy = centy + sin(rad)*radius;  
  line(symx, symy, x, y);
  angle += 1;
  stroke += stroker;
  if (stroke < 0 || stroke > 255) stroker *= -1;
}