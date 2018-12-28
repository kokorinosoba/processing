void setup() {
  size(600, 600);
}
void draw() {
  translate(width/2, height/2);

  // 顔
  stroke(84, 53, 13);
  strokeWeight(10);
  fill(246, 202, 112);
  ellipse(0, 0, 300, 300);

  // 耳
  rotate(-PI/6);
  for (float angle = 0; angle < TWO_PI/3; angle += PI/3) {
    rotate(angle);
    stroke(84, 53, 13);
    arc(0, -148, 50, 80, PI, TWO_PI);
    noStroke();
    ellipse(0, -148, 40, 70);
  } 
  rotate(-PI/6);

  // 鼻
  stroke(84, 53, 13);
  fill(255);
  ellipse(0, -20, 70, 60);

  // 鼻の穴
  strokeWeight(10);
  line(-10, -15, -10, -25);
  line(10, -15, 10, -25);

  // 目
  strokeWeight(20);
  point(60, -30);
  point(-60, -30);

  // ほっぺ
  noStroke();
  fill(241, 167, 135);
  ellipse(-110, -10, 60, 60);
  ellipse(110, -10, 60, 60);

  // おでこ
  noStroke();
  fill(200, 126, 60);
  arc(0, -145, 20, 150, 0, PI);

  rotate(-PI/10);
  for (float angle = 0; angle < TWO_PI/5; angle += PI/5) {
    rotate(angle);
    arc(0, -145, 20, 130, 0, PI);
  }
  rotate(-PI/10);

  // 足
  fill(84, 53, 13);
  arc(-60, 110, 60, 60, PI/6 - HALF_PI, TWO_PI - HALF_PI);
  arc(60, 110, 60, 60, -HALF_PI, TWO_PI - HALF_PI - PI/6);
}
