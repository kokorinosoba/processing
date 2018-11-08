ArrayList<Particle> particles;

void setup() {
  size(600, 600);
  frameRate(60);
  noStroke();
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 1; i++) {
    particles.add(new Particle());
  }
}
void draw() {
  background(200);
  translate(width/2, height/2);
  particles.add(new Particle());
  for (int i = 0; i < particles.size(); i++) {
    particles.get(i).draw();
  }
}