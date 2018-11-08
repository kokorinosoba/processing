int k = 0;
boolean drawing = true;

void setup() {
  size(600, 600);
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(0);
  stroke(1);
  background(255);
}

void draw() {
  translate(width/2, height/2);
  if (drawing == true && k < 9) {
    background(255);
    callKoch(k, 500);
    text(k, 0, 0);
  } else if (drawing == true) {
    background(255);
    k = 0;
  }
}


// Function of drawing the Koch snowflake
void callKoch(int k, float size) {
  koch(k, -size/2, -size*sqrt(3)/6, size/2, -size*sqrt(3)/6);
  koch(k, size/2, -size*sqrt(3)/6, 0, size*2*sqrt(3)/6);
  koch(k, 0, size*2*sqrt(3)/6, -size/2, -size*sqrt(3)/6);
}

// Function of drowing the Koch curve 
void koch(int k, float x1, float y1, float x2, float y2) {
  float d = dist(x1, y1, x2, y2);
  float d3 = d / 3;
  float angle = calcAngle(x1, y1, x2, y2);
  pushMatrix();
  translate(x1, y1);
  rotate(angle);

  if (k == 0) {
    line(0, 0, d, 0);
  } else {
    koch(k - 1, 0, 0, d3, 0);
    koch(k - 1, d3, 0, d3 + cos(-PI/3) * d3, sin(-PI/3) * d3);
    koch(k - 1, d3 + cos(-PI/3) * d3, sin(-PI/3) * d3, d3 * 2, 0);
    koch(k - 1, d3 * 2, 0, d, 0);
  }
  popMatrix();
  drawing = false;
  return;
}

// Get an angle between two coordinates
float calcAngle(float x1, float y1, float x2, float y2) {
  pushMatrix();
  translate(x1, y1);
  float angle = atan2(y2-y1, x2-x1);
  popMatrix();
  return angle;
}

void mousePressed() {
  drawing = true;
  k++;
}