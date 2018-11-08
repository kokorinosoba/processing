class Particle {
  float size;
  float radius;
  float angle;
  float speed;
  PVector location;
  PVector velocity;
  boolean isAlive;

  Particle () {
    this.size = 1;
    this.radius = 0.5;
    this.angle = random(0, TWO_PI);
    this.speed = random(0.1, 1);
    this.location = new PVector(0, 0);
    this.velocity = new PVector(radius * cos(angle), radius * sin(angle));
    this.isAlive = true;
  }

  void draw() {
    if (isAlive == true) {
      ellipse(this.location.x, this.location.y, size, size);
      this.location.x += this.velocity.x * speed;
      this.location.y += this.velocity.y * speed;
      this.size *= 1.008;
      this.speed *= 1.01;
      if (this.location.x < -width/2 || width/2 < this.location.x || this.location.y < -height/2 || height/2 < this.location.y) {
        this.location.x = 0;
        this.location.y = 0;
        this.size = 0;
        this.speed = 1;
        //isAlive = false;
      }
    }
  }
}