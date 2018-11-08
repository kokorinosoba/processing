class ParticleVec2 {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector gravity;
  float mass;
  float friction;
  PVector min;
  PVector max;
  float radius;
  float G;
  
  ParticleVec2 () {
    radius = 4.0;
    mass = 1.0;
    friction = 0.01;
    location = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    acceleration = new PVector(0.0, 0.0);
    gravity = new PVector(0.0, 0.0);
    min = new PVector(0.0, 0.0);
    max = new PVector(width, height);
    G = 1.0;
  }
  
  void update () {
    acceleration.add(gravity);
    velocity.add(acceleration);
    velocity.mult(1.0 - friction);
    location.add(velocity);
    acceleration.set(0, 0);
  }
  
  void draw () {
    ellipse(location.x, location.y, mass * radius * 2, mass * radius * 2);
  }

  void bounceOffWalls () {
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
  
  void throughWalls () {
    if (location.x < min.x) {
      location.x = max.x;
    }
    if (location.y < min.y) {
      location.y = max.y;
    }
    if (location.x > max.x) {
      location.x = min.x;
    }
    if (location.y > max.y) {
      location.y = min.y;
    }
  }
  
  void addForce (PVector force) {
    force.div(mass);
    acceleration.add(force);
  }
  
  void attract (PVector center, float _mass, float min, float max) {
    float distance = PVector.dist(center, location);
    distance = constrain(distance, min, max);
    float strength = G * (mass * _mass) / (distance * distance);
    PVector force = PVector.sub(center, location);
    force.normalize();
    force.mult(strength);
    addForce(force);
  }
}