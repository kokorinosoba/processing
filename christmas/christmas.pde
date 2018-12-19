float max_r = 10;
float min_r = 1;
float max_z = 20;
float min_z = 0;
float max_ys = 3;
float min_ys = 1;

int num = 500;
Snow[] snows = new Snow[num];

void setup(){
  size(600,800);
 // colorMode(HSB,360,100,100,100);
  frameRate(10);
  //blendMode(ADD);
  smooth();
  noStroke();
  
  for (int i =0; i < num; i++){
    snows[i] = new Snow();
  }
}
void draw(){
  background(0);
  for (int i = 0; i < num; i++){
    snows[i].draw();
  }
}
