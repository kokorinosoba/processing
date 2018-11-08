float r = 150;

void setup(){
  size(600,600);
  background(0);
  noFill();
}

void draw(){
  frameRate(50);
  translate(300,300);
  noStroke();
  
  float g = random(0,60);
  float b = random(0,60);
  
  float x = random(-150,150);
  float y = random(-150,150);
  
  fill(255,g,b);
  noStroke();
  if (x * x + y * y < r * r) {
  ellipse(x,y,20,20);
  }
}
