final int N_STAR = 500;
Star[] star = new Star[N_STAR];

void setup () {
  size(1200, 900, P3D);
  background(0);
  noStroke();
  //noStroke();
  for (int i = 0; i < N_STAR; i++) {
    star[i] = new Star();
  }
}

void draw () {
  translate(width/2, height/2, 0);
  background(0, 16);
  rotateX(frameCount*0.001);
  rotateY(frameCount*0.001);
  for (int i = 0; i < N_STAR; i++) {
    star[i].draw();
  }
}