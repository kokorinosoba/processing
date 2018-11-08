class Flower {
 float angle;
 color c ;
 int x,y;
 int size;
 Flower(){
   angle = 0;
   switch( int(random(4))){ 
     case 0: c = color(199,21,133);break;
     case 1: c = color(255,20,147);break;
     case 2: c = color(255,105,180);break;
     case 3: c = color(219,112,147);break;
   }
   x = int(random(width));
   y = int(random(height));
   size = 10;
 }
 
 void draw(){
   pushMatrix();
   translate(x,y);
  noStroke();
  fill(c);
  rotate(angle);
  for (int i = 0; i < 8; i++) {
    ellipse(2*size, 0, 2*size, 1*size);
    rotate(radians(-45));
  }
  popMatrix();
  angle += 0.02;
 }
}
