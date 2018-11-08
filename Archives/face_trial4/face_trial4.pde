PImage img;
float noiser = 0;

void setup() {
  size(800, 600);
  img = loadImage("source.jpg");
  img.resize(width, height);
  background(0);
}
void draw() {
  noStroke();
  rectMode(CENTER);
  for (int i = 0; i < 150; i++) {
    PVector location = new PVector(random(width), random(height));
    color col = img.get(int(location.x), int(location.y));
    fill(col, 15);
    float brightness = red(col) + green(col) + blue(col);
    float noise = noise(noiser) + TWO_PI - PI;
    float angle = map(brightness, 0, 255*3, -PI/2.0, PI/2.0);
    angle += noise;
    noiser += 0.01;
    float noiseX = noise(noiser) * 20 - 10;
    noiser += 0.01;
    float noiseY = noise(noiser) * 20 - 10;
    noiser += 0.01;
    float length = map(brightness, 0, 255*3, 0, 40);
    pushMatrix();
    translate(location.x + noiseX, location.y + noiseY);
    rotate(angle);
    rect(0, 0, length, 2);
    popMatrix();
    noiser++;
  }
}