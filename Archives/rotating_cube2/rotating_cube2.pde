int len = 100;  // possible to change less than 150
int cubes = 4;  // numbers of cubes on a side
int step = len / (cubes - 1);  // interval cubes
float angle = 0;
float center = - len / 2;  // adjustment variable of the center of figure

void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(255);
  translate(300, 300, 300);
  
  // rotate around x, y axis
  rotateX(angle);
  rotateY(angle);
  
  // draw cubes
  translate(center, center, center);
  for (int i = 0; i <= len; i += step) {
    for (int j = 0; j <= len; j += step) {
      for (int k = 0; k <= len; k += step) {
        fill(map(i, 0, len, 0, 255), map(j, 0, len, 0, 255), map(k, 0, len, 0, 255), 100);
        pushMatrix();
        translate(i, j, k);
        box(step - 10);  // space between cubes
        popMatrix(); 
      }
    }
  }
  angle += 0.01;
}