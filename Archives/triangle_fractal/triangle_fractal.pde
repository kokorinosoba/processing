void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100);
  background(0);

  fractal(6, 0, 0, width/2, height/2, width, 0);
  fractal(6, width, 0, width/2, height/2, width, height);
  fractal(6, width, height, width/2, height/2, 0, height);
  fractal(6, 0, height, width/2, height/2, 0, 0);
  /*
  translate(width/2, height/2*2/sqrt(3));
   float sizeX = width * 0.8;
   float sizeY = height * 0.8;
   fractal(6, 0, -sizeY*sqrt(3)*2/6, -sizeX/2, sizeY*sqrt(3)/6, sizeX/2, sizeY*sqrt(3)/6);
   */
}

void draw() {
}

void fractal(int k, float x1, float y1, float x2, float y2, float x3, float y3) {
  if (k == 0) {
    fill(random(360), random(360), random(360));
    triangle(x1, y1, x2, y2, x3, y3);
  } else {
    float gravityX = (x1 + x2 + x3) / 3;
    float gravityY = (y1 + y2 + y3) / 3;
    fractal(k - 1, x1, y1, gravityX, gravityY, x2, y2);
    fractal(k - 1, x2, y2, gravityX, gravityY, x3, y3);
    fractal(k - 1, x3, y3, gravityX, gravityY, x1, y1);
  }
  return;
}