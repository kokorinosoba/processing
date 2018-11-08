DrawEllipse myCircle;

void setup() {
  size(800, 600);
  myCircle = new DrawEllipse(400, new PVector(width/2, height/2));
}

void draw() {
  myCircle.draw();
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