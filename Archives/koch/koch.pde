int k = 5;

void setup() {
  size(600, 600);
  stroke(1);
  background(255);
  translate(width/2, height/2);
  callKoch(k, 500);
}

void draw() {
  
}



void callKoch(int k, float size) {
  koch(k, -size/2, -size*sqrt(3)/6, size/2, -size*sqrt(3)/6);
  koch(k, size/2, -size*sqrt(3)/6, 0, size*2*sqrt(3)/6);
  koch(k, 0, size*2*sqrt(3)/6, -size/2, -size*sqrt(3)/6);
}

void koch(int k, float x1, float y1, float x2, float y2) {
  float d = dist(x1, y1, x2, y2);
  float d3 = d / 3;
  float angle = calcAngle(x1, y1, x2, y2);
  pushMatrix();
  translate(x1, y1);
  rotate(angle);

  if (k == 0) {
    line(0, 0, d, 0);
    /*
    line(0, 0, d3, 0);
    line(d3*2, 0, d, 0);
    pushMatrix();
    translate(d3, 0);
    rotate(-PI/3);
    line(0, 0, d3, 0);
    pushMatrix();
    translate(d3, 0);
    rotate(2*PI/3);
    line(0, 0, d3, 0);
    popMatrix();
    popMatrix();
    */
  } else {
    koch(k - 1, 0, 0, d3, 0);
    koch(k - 1, d3, 0, d3 + cos(-PI/3) * d3, sin(-PI/3) * d3);
    koch(k - 1, d3 + cos(-PI/3) * d3, sin(-PI/3) * d3, d3 * 2, 0);
    koch(k - 1, d3 * 2, 0, d, 0);
  }
  popMatrix();
  return;
}

float calcAngle(float x1, float y1, float x2, float y2) {
  pushMatrix();
  translate(x1, y1);
  float angle = atan2(y2-y1, x2-x1);
  popMatrix();
  return angle;
}

void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("koch-"+k+".tif");
  }
}