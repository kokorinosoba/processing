DrawEllipse myCircle;

void setup() {
  size(800, 600);
  myCircle = new DrawEllipse();
  myCircle.setup();
}

void draw() {
  myCircle.draw();
}

class DrawEllipse {
  float diameter;
  PVector location;

  void setup() {
    diameter = 400;
    location = new PVector(width/2, height/2);
  }

  void draw() {
    ellipse(location.x, location.y, diameter, diameter);
  }
}