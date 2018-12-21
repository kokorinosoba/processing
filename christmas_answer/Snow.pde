class Snow {
  float x = random(-width/2-wind*100, width+width/2-wind*100);
  float y = random(-height, 0);
  float z = random(min_z, max_z);
  float r = map(this.z, min_z, max_z, min_r, max_r);
  float yspeed = map(this.z, min_z, max_z, min_ys, max_ys);
  int my_num;

  Snow(int i) {
    my_num = i;
  }

  void fall(int wind) {
    y = y + yspeed; 
    if (y > 0) {
      x += wind * map(z, min_z, max_z, 0.3, 1);
    }

    if (frameCount%20==0) {
      x += random(-1.5, 1.5);
    }
    if (y > height) {
      snows[my_num] = new Snow(my_num);
    }
  }
  void show() {
    ellipse(x, y, r, r);
  }
}
