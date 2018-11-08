float angle = 0;
void setup() {
  size(600, 600, P3D);
  noFill();
}

void draw() {
  background(255);
  translate(300, 300, 300);
  
  // rotate around x, y, z axis
  rotateX(angle);
  rotateY(angle);
  rotateZ(angle);
  
  // draw box after rotate (otherwise it will not rotate)
  box(100, 100, 100);
  angle += 0.01;
}