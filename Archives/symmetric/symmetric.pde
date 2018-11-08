float radius = (width + height) / 5;
float centx = width/2;
float centy = height/2;
float angle = 0;
float x, y, symx, symy;
float rad;

void setup() {
  size(600, 600);
  radius = (width + height) / 5;
  centx = width/2;
  centy = height/2;
  stroke(20, 50, 70, 80);
  smooth();
}
void draw() {
  rad = radians(angle);
  x = centx + cos(rad)*radius;
  y = centy + sin(rad)*radius;
  symx = centx + cos(rad + 180)*radius;
  symy = centy + sin(rad + 180)*radius;  
  line(symx, symy, x, y);
  angle += 1;
}