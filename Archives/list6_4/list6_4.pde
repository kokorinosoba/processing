PVector force;
PVector acceleration;
PVector location;
PVector velocity;
PVector gravity;
float mass;
float friction;
PVector min;
PVector max;

void setup () {
  size(800, 600);
  frameRate(60);
  location = new PVector(0.0, 0.0);
  velocity = new PVector(0.0, 0.0);
  gravity = new PVector(0.0, 1.0);
  force = new PVector(12.0, 8.0);
  min = new PVector(0.0, 0.0);
  max = new PVector(width, height);
  mass = 1.0;
  friction = 0.01;
  acceleration = force.mult(mass);
}

void draw () {
  fill(0, 31);
  rect(0, 0, width, height);
  fill(255);
  noStroke();
  acceleration.add(gravity);
  velocity.add(acceleration);
  velocity.mult(1.0 - friction);
  location.add(velocity);
  acceleration.set(0, 0);
  ellipse(location.x, location.y, 20, 20);
  bouceOffWalls();
}

void bouceOffWalls () {
  if (location.x > max.x) {
    location.x = max.x;
    velocity.x *= -1;
  }
  if (location.x < min.x) {
    location.x = min.x;
    velocity.x *= -1;
  }
  if (location.y > max.y) {
    location.y = max.y;
    velocity.y *= -1;
  }
  if (location.y < min.y) {
    location.y = max.y;
    velocity.y *= -1;
  }
}