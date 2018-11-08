class Star {
  float size;
  float power;
  float x, y, z;
  float radianS = radians(random(180));
  float radianT = radians(random(360));
  float noiser;

  Star() {
    this.size = random(0.5, 0.8);
    this.power = 0.5;
    this.x = random(height*0.7) * sin(radianS) * cos(radianT);
    this.y = random(height*0.7) * sin(radianS) * sin(radianT);
    this.z = random(height*0.7) * cos(radianS);
    this.noiser = random(TWO_PI);
  }
  void draw() {
    pushMatrix();
    translate(x, y, z);
    fill(power * 255, 200);
    sphere(size);
    popMatrix();

    this.power = fluctuation(this.power, this.noiser);
    this.noiser += 0.01;
  }
  float fluctuation(float pw, float noiser) {
    pw = noise(noiser);
    return pw;
  }
}