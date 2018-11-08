int R; // Variable for Control Text Location //<>// //<>// //<>//
PVector location1;
PVector location2;
PVector velocity = new PVector(-30, 0);
String str1, str2;
int str1idx = 0, str2idx = 1;
boolean moveFlag1 = true;
boolean moveFlag2 = false;
Table csv;
String[] texts;


void setup() {
  size(1200, 800);
  background(255);
  frameRate(30);
  location1 = new PVector(width + width / 2, height / 2); //<>//
  location2 = new PVector(width + width / 2, height / 2); //<>//
  load();
  str1 = texts[str1idx];
  str2 = texts[str2idx];
  rectMode(CENTER);
  noStroke();

  // Japanese Font Settings
  PFont font = createFont("MS Gothic", 48);
  textFont(font);
  textSize(48);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);

  fill(0);
  //println(str1idx, str2idx, texts[1]);
  exText(str1, location1.x, location1.y);
  exText(str2, location2.x, location2.y);

  if (moveFlag1) {
    location1.add(velocity);
  }

  if (moveFlag2) {
    location2.add(velocity);
  }

  // left direction version
  if (location1.x < R / 2) {
    moveFlag2 = true;
  }

  if (location2.x < R / 2) {
    moveFlag1 = true;
  }

  if (location1.x < - width / 2) {
    location1.x = width + width / 2;
    moveFlag1 = false;
    str1idx += 2;
    if (str1idx == texts.length) {
      str1idx = 0;
    } else if (str1idx > texts.length) {
      str1idx = 1;
    }
    str1 = texts[str1idx];
  }

  if (location2.x < - width / 2) {
    location2.x = width + width / 2;
    moveFlag2 = false;
    str2idx += 2;
    if (str2idx == texts.length) {
      str2idx = 0;
    } else if (str2idx > texts.length) {
      str2idx = 1;
    }
    str2 = texts[str2idx];
  }
  /*
  // right direction version
   if (location1.x > width - R / 2) {
   moveFlag2 = true;
   }
   
   if (location2.x > width - R / 2) {
   moveFlag1 = true;
   }
   
   if (location1.x > width + R / 2) {
   location1.x = - width / 2;
   moveFlag1 = false;
   }
   
   if (location2.x > width + R / 2) {
   location2.x = - width / 2;
   moveFlag2 = false;
   }
   */
}

void exText(String c, float x, float y) {
  String[] arr; //<>//
  if (c.length() > 100) {
    arr = new String[3];
    arr[0] = c.substring(0, 50);
    arr[1] = c.substring(50, 100);
    arr[2] = c.substring(100);
  } else if (c.length() > 50) {
    arr = new String[2];
    arr[0] = c.substring(0, 50);
    arr[1] = c.substring(50);
  } else {
    arr = new String[1];
    arr[0] = c;
  }
  float half = arr.length / 2;
  float size = width * 0.03 / sqrt(arr.length);
  textSize(size);
  for (int i = 0; i < arr.length; i++) {
    text(arr[i], x, y + (i - half) * size * 2);
  }
}

void load() {
  csv = loadTable("output.csv", "header");
  texts = new String[csv.getRowCount()];
  for (int i = 0; i < csv.getRowCount(); i++) {
    texts[i] = csv.getString(i, 3);
    println(texts[i]);
  }
}

void reload() {
  csv = loadTable("output1.csv", "header");
  texts = new String[csv.getRowCount()];
  for (int i = 0; i < csv.getRowCount(); i++) {
    texts[i] = csv.getString(i, 3);
    println(texts[i]);
  }
}

void mousePressed() {
  reload();
}
