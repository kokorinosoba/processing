class Root {
  PVector loc = new PVector(width/2, height/2);
  // PVector speed = new PVector();
  PVector speed = PVector.random2D();
  PVector bam = new PVector();
  float diam = width/20;
  float angle = random(TAU); // TAU = TWO_PI (btw)
  color c = color(random(360), 100, 50, 30);

  void init() {
    loc = new PVector(width/2, height/2);
    diam = width/20;
    angle = random(TAU);
    c = color(random(360), 100, 50, 30);
  }

  void update() {
    diam -= random(0.01, 0.05);
    diam = constrain(diam, 0.5, width/20); 

    if (diam >= .5) {
      bam = PVector.random2D(); // movement will be a bit erractic
      bam.mult(0.85);
      speed.add(bam);
      speed.normalize();
      speed.mult(1.5);
      loc = loc.add(speed);
    }
  } // End of update()
} // End of class
