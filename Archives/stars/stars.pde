final int N_STAR = 500;  // the number of stars
Star[] star = new Star[N_STAR];

void setup () {
  size(1200, 900, P3D);
  background(0);
  noStroke();  // Drawing runs so slow if adding the stroke
  for (int i = 0; i < N_STAR; i++) {
    star[i] = new Star();
  }
}

void draw () {
  background(0, 16);

  // Set the center of rotation and drawing
  translate(width/2, height/2, 0);

  // Control viewpoint with frameCount
  rotateX(frameCount*0.001);
  rotateY(frameCount*0.001);

  // Draw the stars
  for (int i = 0; i < N_STAR; i++) {
    star[i].draw();
  }
}