import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim = new Minim(this);
AudioPlayer player;
String fileName = "kaede.mp3";

PImage img;

final int max_r = 10;
final int min_r = 1;
final int max_z = 20;
final int min_z = 0;
final int max_ys = 3;
final int min_ys = 1;
public int myFrameRate = 20;

final int num = 500; 
int wind = 0;
Boolean flag = false;
float volume = 0;

Snow[] snows = new Snow[num];
FadeMessages messages;

void setup() {
  size(800, 600);
  frameRate(myFrameRate);
  img = loadImage("cherry.jpg");

  //img = loadImage("cherry.jpg");
  //font = createFont("AmaticSC-Bold",100);
  // textFont(font);
  //textSize(60);

  colorMode(HSB, 360, 100, 100, 100);
  background(0);
  smooth();
  noStroke();
  fill(255, 100);
  //textLeading(0);

  for (int i=0; i<num; i++) {
    snows[i]= new Snow(i);
  }
  messages = new FadeMessages();
  
  //minim = new Minim(this);
  player = minim.loadFile(fileName);
  player.play();
  
}

void draw() {
  image(img, 0, 0, width, height);
  //background(0);
  for (int i=0; i<num; i++) {
    snows[i].fall(wind);
    snows[i].show();
  }
  messages.draw();
  if (messages.musicFade) {
    player.setGain(volume);
    volume -= 0.5;
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
void mouseClicked() {
  messages.mcnt++;
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}
