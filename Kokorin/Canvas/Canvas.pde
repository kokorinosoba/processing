Windmill[] mil;

void setup() {
  size(800, 800);
  background(255);
  //frameRate(30);
  
  // initialize wmill;
  mil = new Windmill[5];
  mil[0] = new Windmill(300, 200, 20, "Red");
  mil[1] = new Windmill(200, 400, 20, "Blue");
  mil[2] = new Windmill(250, 600, 20, "Red");
  mil[3] = new Windmill(600, 300, 20, "Blue");
  mil[4] = new Windmill(600, 600, 20, "Red");
}

void draw() {
  background(255);
  for (int i = 0; i < 5; i++) {
    mil[i].draw();
  }
}
