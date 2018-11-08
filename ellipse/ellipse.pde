void setup(){
  size(600,600);
}
void draw(){
  noStroke();
  color c1 = color(218,112,214);
  color c2 = color(128,0,128);
  if (mousePressed){
    fill(c1);
  } else {
    fill(c2);
  }
    ellipse(mouseX, mouseY, 100,100);
}  
