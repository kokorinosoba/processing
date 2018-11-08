class Bubble {
  float size;
  float expandSpeed;
  color circleColor;
  PVector location;
  boolean expand;
  boolean isDead;
  
  Bubble(PVector _location) {
    location = _location;
    size = 0;
    expandSpeed = 4.0;
    expand = true;
    isDead = false;
    circleColor = img.get(int(location.x), int(location.y));
  }
  
  void draw() {
    if (expand == true) {
      size += expandSpeed;
    }
    fill(circleColor);
    ellipse(location.x, location.y, size, size);
  }
  
  boolean checkPixel() {
    float nextSize = size + expandSpeed;
    for (float i = 0; i < TWO_PI; i += 0.01) {
      int x = int(cos(i) * nextSize / 2.0 + location.x);
      int y = int(sin(i) * nextSize / 2.0 + location.y);
      color c = get(x, y);
      if ((red(c) + blue(c) + green(c)) > 0 || size > maxSize) {
        expand = false;
      }
    }
    return expand;
  }
}