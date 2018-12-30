ArrayList<Boar> boars;
PFont font;
float tSize;
public int step;
int k;

void setup() {
  size(600, 800);
  font = createFont("", 100);
  tSize = width/20;
  step = width/4;
  textFont(font);
  textSize(tSize);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  boars = new ArrayList<Boar>();
  for (int x = 0; x <= width; x += step) {
    for (int y = 0; y <= height; y += step) {
      boolean cw = boolean(y % (step * 2))? true : false;
      boars.add(new Boar(x, y, step/35, cw));
    }
  }
}

void draw() {
  background(#ffc0cb);
  for (int i = 0; i < boars.size(); i++) {
    boars.get(i).draw();
  }
}
