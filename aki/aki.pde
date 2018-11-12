PImage img;
String t = "ワインツーリズム楽しみ！ワインツーリズム楽しみ！ワインツーリズム楽しみ！ワインツーリズム楽しみ！ワインツーリズム楽しみ！ワインツーリズム楽しみ！ワインツーリズム楽しみ！ワインツーリズム楽しみ！ワインツーリズム楽しみ！";

void setup() {
  size(800, 600);
  img = loadImage("kudamono.jpg");
  PFont font = createFont("MS Gosic", 40);
  textFont(font);
  rectMode(CENTER);
  textSize(100/sqrt(t.length()));
  
}

void draw() {
  image(img, 0, 0, 800, 600);
  textAlign(CENTER ,CENTER);
  text(t, 400,300, width/2, height);
}
