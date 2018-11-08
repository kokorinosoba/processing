class Windmill {
  PVector location;
  float angle;
  float speed;
  int size;
  color rectColor, triangleColor;

  Windmill(int _x, int _y, int _size, String _color) {
    location = new PVector(_x, _y);
    angle = 0;
    speed = 0.02;
    size = _size;
    if (_color == "Blue") {
      rectColor = #afeeee;
      triangleColor = #00ffff;
    } else if (_color == "Red") {
      rectColor = #ee82ee;
      triangleColor = #ff00ff;
    }
  }

  void draw() {
    stroke(1);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    line(0, 0, 0, height - location.y);
    rotate(-angle);
    fill(rectColor);
    rect(0, 0, 2*size, 2*size);
    fill(triangleColor);
    triangle(-1*size, -1*size, 0, -2*size, 0, 0);
    triangle(1*size, -1*size, 2*size, 0, 0, 0);
    triangle(1*size, 1*size, 0, 2*size, 0, 0);
    triangle(-1*size, 1*size, -2*size, 0, 0, 0);
    popMatrix();
    angle += speed;
  }
}
