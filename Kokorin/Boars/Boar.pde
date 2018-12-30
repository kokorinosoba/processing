class Boar {
  PVector location;
  PVector velocity;
  float s;
  float angle;
  float angleStep;

  Boar(float x, float y, float size, boolean clockWise) {
    location = new PVector(x, y);
    s = size;
    angle = 0;
    angleStep = clockWise ? 0.02 : -0.02;
    //angleStep = 0.02;
    velocity = new PVector(angleStep * 50, 0);
  }

  void draw() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);

    // 顔
    stroke(84, 53, 13);
    strokeWeight(s);
    fill(246, 202, 112);
    ellipse(0, 0, 30 * s, 30 * s);

    // 耳
    rotate(-PI/6);
    for (float angle = 0; angle < TWO_PI/3; angle += PI/3) {
      rotate(angle);
      stroke(84, 53, 13);
      arc(0, -14.8 * s, 5 * s, 8 * s, PI, TWO_PI);
      noStroke();
      ellipse(0, -14.8 * s, 4 * s, 7 * s);
    } 
    rotate(-PI/6);

    // 鼻
    stroke(84, 53, 13);
    fill(255);
    ellipse(0, -2 * s, 7 * s, 6 * s);

    // 鼻の穴
    strokeWeight(s);
    line(-s, -1.5 * s, -s, -2.5 * s);
    line(s, -1.5 * s, s, -2.5 * s);

    // 目
    strokeWeight(2 * s);
    point(6 * s, -3 * s);
    point(-6 * s, -3 * s);

    // ほっぺ
    noStroke();
    fill(241, 167, 135);
    ellipse(-11 * s, -s, 6 * s, 6 * s);
    ellipse(11 * s, -s, 6 * s, 6 * s);

    // おでこ
    noStroke();
    fill(200, 126, 60);
    arc(0, -14.5 * s, 2 * s, 15 * s, 0, PI);

    rotate(-PI/10);
    for (float angle = 0; angle < TWO_PI/5; angle += PI/5) {
      rotate(angle);
      arc(0, -14.5 * s, 2 * s, 13 * s, 0, PI);
    }
    rotate(-PI/10);

    // 足
    fill(84, 53, 13);
    arc(-6 * s, 11 * s, 6 * s, 6 * s, PI/6 - HALF_PI, TWO_PI - HALF_PI);
    arc(6 * s, 11 * s, 6 * s, 6 * s, -HALF_PI, TWO_PI - HALF_PI - PI/6);

    popMatrix();
    angle += angleStep;
    location.add(velocity);
    if (location.x > width + step/2) {
      location.x = - step/2;
    } else if (location.x < - step/2) {
      location.x = width + step/2;
    }
  }
}
