int R = 50;
PVector location1;
PVector location2;
PVector velocity = new PVector(-1, 0);
boolean moveFlag1 = true;
boolean moveFlag2 = false;

void setup() {
  size(300, 300);
  background(255);
  location1 = new PVector(width / 2, height / 2);
  location2 = new PVector(- R / 2, height / 2);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(255);

  fill(0);
  rect(location1.x, location1.y, R, R);
  rect(location2.x, location2.y, R, R);

  if (moveFlag1) {
    location1.add(velocity);
  }

  if (moveFlag2) {
    location2.add(velocity);
  }
  
  /*
  // right direction version
  if (location1.x > width - R / 2) {
    moveFlag2 = true;
  }

  if (location2.x > width - R / 2) {
    moveFlag1 = true;
  }

  if (location1.x > width + R / 2) {
    location1.x = - R / 2;
    moveFlag1 = false;
  }

  if (location2.x > width + R / 2) {
    location2.x = - R / 2;
    moveFlag2 = false;
  }
  */
  // left direction version
  if (location1.x < R / 2) {
    moveFlag2 = true;
  }

  if (location2.x < R / 2) {
    moveFlag1 = true;
  }

  if (location1.x < - R / 2) {
    location1.x = width + R / 2;
    moveFlag1 = false;
  }

  if (location2.x < - R / 2) {
    location2.x = width + R / 2;
    moveFlag2 = false;
  }
}
