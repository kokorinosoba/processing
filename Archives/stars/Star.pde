class Star {
  float size;
  float brightness;
  float x, y, z;
  float radianS = radians(random(180));
  float radianT = radians(random(360));

  Star() {
    this.size = random(0.5, 0.8);
    this.brightness = 0.5;

    // Set coordinates randomly like a sphere
    this.x = random(height*0.7) * sin(radianS) * cos(radianT);
    this.y = random(height*0.7) * sin(radianS) * sin(radianT);
    this.z = random(height*0.7) * cos(radianS);
  }

  void draw() {
    pushMatrix();
    translate(x, y, z);
    fill(brightness * 255);
    sphere(size);
    popMatrix();


    this.brightness = fluctuation(this.brightness);
  }

  // Function of calculating 1/f fluctuation(noise)
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