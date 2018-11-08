class Piece { //<>//
  PVector location;
  PVector velocity;

  Piece() {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(random(-3, 3), random(-3, 3));
  }
  void draw() {
    pushMatrix();
    translate(location.x, location.y);
    // rotate(angle);
    point(0, 0);
    popMatrix();
    location.add(velocity);
    velocity.add(new PVector(random(-1, 1), random(-1, 1)));
    if (location.x < 0 || width < location.x) {
      velocity.x *= -1;
    }
    if (location.y < 0 || height < location.y) {
      velocity.y *= -1;
    }
  }
}