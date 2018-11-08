int NUM = 2000;
ParticleVec2[] particles = new ParticleVec2[NUM];

void setup () {
  size(800, 600, P2D);
  frameRate(60);
  for(int i = 0; i < NUM; i++) {
    particles[i] = new ParticleVec2();
    particles[i].location.set(random(width), random(height));
    particles[i].gravity.set(0.0, 0.0);
    particles[i].friction = 0.01;
  }
}
void draw () {
  fill(0, 31);
  rect(0, 0, width, height);
  noStroke();
  fill(255);
  for (int i = 0; i < NUM; i++) {
    particles[i].update();
    particles[i].draw();
    particles[i].bounceOffWalls();
  }
}

void mouseDragged () {
  for (int i = 0; i < NUM; i++) {
    PVector mouseLoc = new PVector(mouseX, mouseY);
    particles[i].attract(mouseLoc, 200, 5, 20);
  }
}