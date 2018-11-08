class Flower {
  float angle;
  color c;
  PVector location;
  PVector velocity;
  int size;
  
  Flower() {
    angle = 0;
    switch (int(random(4))) {
      case 0: c = color(#c71585); break;
      case 1: c = color(#ff1493); break;
      case 2: c = color(#ff69b4); break;
      case 3: c = color(#4169e1); break;
    }
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, random(1, 2));
    size = 10;
  }
  
  void draw() {
    pushMatrix();
    translate(location.x, location.y);
    noStroke();
    fill(c);
    rotate(angle);
    for(int i = 0; i < 8; i++) {
      ellipse(2 * size, 0, 2 * size, size);
      rotate(radians(-45));
    }
    popMatrix();
    angle += 0.02;
    location.add(velocity);
    
    if (location.y > 2 * size + height) {
      location.y = - 2 * size;
    }
  }
}
