int R; //ひし形の大きさ調整用

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  background(255);

  
  //ひし形
  noFill();
  strokeWeight(2);
  stroke(200, 0, 0);
  fill(#ff0000);

  pushMatrix();
  translate(width/2, height/2);
  beginShape();
  for (int i = 0; i < 4; i++) {
    if (i % 2 == 0) {
      R = 90;
    } else {
      R = 180;
    }
    vertex(R*cos(radians(90*i)), R*sin(radians(90*i)));
  }
  endShape(CLOSE);
  popMatrix();
}
