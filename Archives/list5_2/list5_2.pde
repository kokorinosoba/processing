PVector location;
PVector velocity;

void setup() {
  size(800, 600);
  frameRate(60);
  noStroke();
  location = new PVector(random(width), random(height));
  velocity = new PVector(random(-4, 4), random(-4, 4));
}

void draw() {
  background(0);
  fill(255);
  ellipse(location.x, location.y, 20, 20);
  
  location.add(velocity);
  
  if (location.x < 0 || location.x > width) {
    velocity.x = velocity.x * -1;
  }
  if (location.y < 0 || location.y > height) {
    velocity.y = velocity.y * -1;
  }
}