float x, y;
float startAngle = 0, angle;
float angleVel = 0.1;
float px, py;
float noiseSeed = 0;
float noiseVal;
float thisNoise;

void setup() {
  size(800, 400);
  fill(255, 255, 0);
}
void draw() {
  background(255);
  angle = startAngle;
  startAngle += 0.02;
  noiseVal = noiseSeed;
  px = -999; 
  py = -999;
  for (int x = 0; x < width; x += 40) {
    thisNoise = noise(noiseVal) * 200 - 100;
    y = map(sin(angle), -1, 1, 20, height - 20);
    y += thisNoise;
    if (px > -999) {
      line(x, y, px, py);
    }
    if (x >= width - 40) {
      arc(x, y, 80, 80, -PI+QUARTER_PI, PI-QUARTER_PI);
    }
    angle += angleVel;
    px = x;
    py = y;
    noiseVal += 0.1;
  }
  noiseSeed += 0.1;
}