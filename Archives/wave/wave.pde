float x, y;
float a;  // 振幅
float w;  // 周期
float p;  // 初期位相
float t;  // 時間

float rad = (TWO_PI/60.0)/3;  // 1周期3秒
float myScale = 100;  // 見やすいように拡大

void setup() {
  size(720, 400);
  a = 100;
  w = 1.0;
  p = 0.0;
  t = 0.0;

}

void draw() {
  background(255);
  myCoordinates();  // 基準線
  
  noStroke();
  fill(0);
  
  x = t * myScale;
  y = a * sin(w * t + p);
  ellipse(x, y + height/2, 10, 10);
  
  t += rad;
}

void myCoordinates() {
  stroke(200);
  for (int i = 0; i < width; i += 0.5 * PI * myScale) {
    line(i, 0, i, height);
  }
  for (int i = 0; i < height; i += 50) {
    line(0, i, width, i);
  }
  
  stroke(255, 0, 0);
  line(0, height/2, width, height/2);
}
  