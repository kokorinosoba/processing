PVector force;
PVector acceleration;
PVector location;
PVector velocity;
PVector gravity;
float mass;
float friction;

void setup () {
  size(800, 600);
  frameRate(60);
  location = new PVector(0.0, 0.0);
  velocity = new PVector(0.0, 0.0);
  gravity = new PVector(0.0, 1.0);
  force = new PVector(12.0, 8.0);
  mass = 1.0;
  friction = 0.01;
  acceleration = force.mult(mass);
}

void draw () {
  background(255);
  fill(35);
  noStroke();
  acceleration.add(gravity);
  velocity.add(acceleration);
  velocity.mult(1.0 - friction);
  location.add(velocity);
  acceleration.set(0, 0);
  ellipse(location.x, location.y, 20, 20);
}