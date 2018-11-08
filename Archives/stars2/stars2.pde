final int N_STAR = 300;
Star[] star = new Star[N_STAR];

void setup () {
  size(1200, 900, P3D);
  background(0);
  noStroke();

  for (int i = 0; i < N_STAR; i++) {
    star[i] = new Star();
  }
}

void draw () {
  translate(width/2, height/2, 0);
  fill(0, 20);
  sphere(height);  // Draw in light black to leave trail
  //rotateX(frameCount*0.01);
  //rotateY(frameCount*0.01);
  //rotateZ(frameCount*0.01);
  for (int i = 0; i < N_STAR; i++) {
    star[i].draw();
  }
}