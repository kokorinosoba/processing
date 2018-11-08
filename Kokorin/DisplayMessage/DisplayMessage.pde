Tweet tweet;
Table csv;
String[] texts;

void setup() {
  size(800, 800);
  // Japanese Font Settings
  PFont font = createFont("MS Gothic", 48);
  textFont(font);
  textSize(28);
  textAlign(CENTER, CENTER);
  load();
  
  tweet = new Tweet("テストツイート");
  tweet.move = true;
}

void draw() {
  background(0);
  tweet.draw();
}

void load() {
  csv = loadTable("output.csv");
  texts = new String[csv.getRowCount()];
  for (int i = 1; i < csv.getRowCount(); i++) {
    texts[i] = csv.getString(i, 3);
    println(texts[i]);
  }
}

void reload() {
  csv = loadTable("output1.csv");
  texts = new String[csv.getRowCount()];
  for (int i = 1; i < csv.getRowCount(); i++) {
    texts[i] = csv.getString(i, 3);
    println(texts[i]);
  }
}

void mousePressed() {
  reload();
}
