String imageName;
PImage img;
PFont font;
int imageNum = 10;
String tweet = "do you love ? do you love me ? i will never let your love";
int tweetLen;

void setup() {
  size(800, 600);
  img = loadImage(imageSelector(imageNum));
  font = createFont("AmaticSC-Bold.ttf", 100);
  textFont(font);
  tweetLen = tweet.length();
  println(tweetLen);
  textSize(tweetLen * -0.438022 + 60.7992);
}
void draw() {
  image(img, 0, 0, width, height);
  switch (imageNum) {
  case 0:
    noStroke();
    fill(0, 80);
    rect(50, 0, width/2, height);
    rectMode(LEFT);
    fill(255);
    text(tweet, 60, 50, width/2, height);
    break;
  case 1: //保留
    noStroke();
    fill(255, 90);
    rect(0, 350, 800, 300);
    rectMode(CORNER);
    fill(0);
    text(tweet, 30, 370, 790, 290);
    break;
  case 2:
    noStroke();
    fill(#ffa500,200);
    rect(0,150,width/2,height/2);
    fill(0);
    text(tweet, 30,170,360,280);
    break;
  case 3:
    noStroke();
    fill(#ffffff,120);
    rect(0,0,330,height);
    fill(0);
    text(tweet,20,20,310,height);
    break;
  case 4:
    fill(255);
    text(tweet,400,20,380,300);
    break;
  case 5:
    noStroke();
    fill(255,180);
    rect(40,0,280,400);
    fill(0);
    text(tweet,60,10,260,380);
    break;
  case 6:
    fill(255);
    text(tweet,100,250,600,250);
    break;
  case 7:
    fill(255);
    text(tweet,20,350,550,230);
    break;
  case 8:
    fill(255);
    text(tweet,20,20,400,200);
    break;
  case 10:
    fill(#8b5413);
    noStroke();
    beginShape();
     vertex(0,100);
     vertex(600,200);
     vertex(600,300);
     vertex(0,250);
    endShape();
    break;
   
    
    
    
    
    
    
    
  default:
  }
}

String imageSelector(int x) {
  String imageName;
  switch (x) {
  case 0: 
    imageName = "faves.JPG"; 
    break;
  case 1: 
    imageName = "kouho00001.JPG"; 
    break;
  case 2: 
    imageName = "kouho00002.JPG"; 
    break;
  case 3: 
    imageName = "kouho00003.JPG"; 
    break;
  case 4: 
    imageName = "kouho00004.JPG"; 
    break;
  case 5: 
    imageName = "kouho00005.JPG"; 
    break;
  case 6: 
    imageName = "kouho00006.JPG"; 
    break;
  case 7: 
    imageName = "kouho00007.JPG"; 
    break;
  case 8: 
    imageName = "kouho00008.JPG"; 
    break;
  case 10: 
    imageName = "kouho00010.JPG"; 
    break;
  case 12: 
    imageName = "kouho00012.JPG"; 
    break;
  default:
    imageName = "faves.JPG";
  }
  return imageName;
}
