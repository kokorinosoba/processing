Table csv;
String[] texts;
String[] photoNames = {"photo1.jpg", "photo2.jpg", "photo3.jpg", "photo4.jpg"};
int tweetCount = 0;
int photoCount = 0;
PImage photo;

void setup() {
  size(800, 800);
  PFont font = createFont("MS Gothic", 48);
  textFont(font);
  textSize(28);
  textAlign(CENTER, CENTER);
  load();
  
  photo = loadImage("photo1.jpg");
}

void draw() {
  image(img, 0, 0, width, height);
  if (frameCount % 100 == 0) {
    tweetCount++;
  }
}

void load() {
  csv = loadTable("output.csv");
  texts = new String[csv.getRowCount()];
  for (int i = 1; i < csv.getRowCount(); i++) {
    texts[i] = csv.getString(i, 3);
    // println(texts[i]);
  }
}

void reload() {
  csv = loadTable("output1.csv");
  texts = new String[csv.getRowCount()];
  for (int i = 1; i < csv.getRowCount(); i++) {
    texts[i] = csv.getString(i, 3);
    // println(texts[i]);
  }
}

void mousePressed() {
  reload();
}
