int NUM = 1000;
ParticleVec2[] particles = new ParticleVec2[NUM];

void setup () {
  size(800, 600, P2D);
  frameRate(60);
  for(int i = 0; i < NUM; i++) {
    particles[i] = new ParticleVec2();
    particles[i].location.set(width/2.0, height/2.0);
    float angle = random(PI * 2.0);
    float length = random(20);
    float posX = cos(angle) * length;
    float posY = sin(angle) * length;
    particles[i].acceleration.set(posX, posY);
    particles[i].gravity.set(0.0, 0.1);
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

void mouseReleased () {
  for (int i = 0; i < NUM; i++) {
    float angle = random(PI * 2.0);
    float length = random(20);
    PVector force = new PVector(cos(angle) * length, sin(angle) * length);
    particles[i].addForce(force);
  }
}