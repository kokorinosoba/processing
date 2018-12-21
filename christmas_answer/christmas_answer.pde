PImage img;

final int max_r = 10;
final int min_r = 1;
final int max_z = 20;
final int min_z = 0;
final int max_ys = 3;
final int min_ys = 1;

final int num = 500; 
int wind = 0;
Boolean flag = false;

Snow[] snows = new Snow[num];
FadeFonts[] font = new FadeFonts[font];

void setup() {
  size(800, 600);
  img = loadImage("christmas2.jpg");
  
  //img = loadImage("christmas2.jpg");
  //font = createFont("AmaticSC-Bold",100);
 // textFont(font);
  //textSize(60);
  
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
  smooth();
  noStroke();
  fill(255, 100);

  for (int i=0; i<num; i++) {
    snows[i]= new Snow(i);
  }
}

void draw() {
  image(img,0,0);
  background(0);
  for (int i=0; i<num; i++) {
    snows[i].fall(wind);
    snows[i].show();
  }
}

void keyPressed() {

  if (keyCode == RIGHT && flag==false && wind<10) {
    wind++;
    flag=true;
  } else if (keyCode == LEFT && flag==false && wind>-10) {
    wind--; 
    flag=true;
  }
}

void keyReleased() {
  flag=false;
}
