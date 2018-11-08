void setup() {
  size(400, 400);
}

void draw() {
  background(100);
  float len = 100;
  stroke(255);
  translate(200,height);
  branch(100);
}

void branch(float len) {
  line(0, 0, 0, -len);
  translate(0,-len);
  if(len > 1){
    pushMatrix();
    rotate(PI/6);
    branch(len*0.67);
    popMatrix();
    pushMatrix();
    rotate(-PI/6);
    branch(len * 0.67);
    popMatrix();
  }
}