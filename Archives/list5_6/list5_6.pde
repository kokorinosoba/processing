DrawEllipse myCircle0;
DrawEllipse myCircle1;

void setup() {
  size(800, 600);
  myCircle0 = new DrawEllipse(300, new PVector(300, 300));
  myCircle1 = new DrawEllipse(150, new PVector(500, 500));
}

void draw() {
  myCircle0.draw();
  myCircle1.draw();
}

class DrawEllipse {
  float diameter;
  PVector location;

  DrawEllipse(float _diameter, PVector _location) {
    diameter = _diameter;
    location = _location;
  }

  void draw() {
    ellipse(location.x, location.y, diameter, diameter);
  }
}