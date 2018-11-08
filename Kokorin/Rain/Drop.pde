class Drop {
  color col;
  float rain_length, angle;
  PVector location;
  PVector velocity;
  
  Drop() {
    rain_length = random(30, 100);
    location = new PVector(random(0, width), random(0, height));
    // PVector.x :: Driving Constant
    velocity = new PVector(0, random(30, 100));
    angle = atan2(velocity.x, velocity.y);
    col = color(255);
  }
  
  void draw() {
    fill(col);
    pushMatrix();
    translate(location.x, location.y);
    rotate(-angle);
    ellipse(0, 0, 1, rain_length);
    popMatrix();
    
    location.add(velocity);
    /*
    if ((location.x < 0) || (location.x > width)) {
      velocity.x = velocity.x * -1;
    }
    */
    if ((location.y < 0) || (location.y > height)) {
      location.x = random(0, width);
      location.y = 0;
    }
  }
}
