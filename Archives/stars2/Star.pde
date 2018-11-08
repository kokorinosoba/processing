class Star {
  float size;
  float power;
  float radius;
  float angle;
  float speed;
  float x, y, z;
  boolean fluc;

  Star() {
    this.power = 0.5;
    this.radius = random(20, height*0.7);
    this.size = random(0.5, 0.8);  // map(this.radius, 0, height * 0.7, 0.2, 1) * 2);
    this.angle = random(TWO_PI);
    this.speed = random(0.0001, 0.01);
    this.x = radius * cos(angle);
    this.y = radius * sin(angle);
    this.z = 0;
    this.fluc = true;
  }
  void draw() {
    this.x = radius * cos(angle);
    this.y = radius * sin(angle);

    pushMatrix();
    translate(x, y, z);
    fill(power * 255);
    sphere(size);
    popMatrix();

    power = fluctuation(power);
    angle += speed;
  }
  float fluctuation(float pw) {
    if (pw < 0.5) {
      pw = pw + 2 * pw * pw;
    } else {
      pw = pw - 2 * (1 - pw) * (1 - pw);
    }
    if (pw < 0.2 || pw > 0.8) {
      pw = random(255) / 255;
    }
    return pw;
  }
}