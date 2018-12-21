class FadeFonts{
float alpha = 0.0F;
boolean fadeMode;
PFont[] font;
int cnt = 0;
int mcnt = 0;
}
void setup(){
  size(1000,500);
  frameRate(20);
  font = createFont("AmaticSC-Bold.ttf",32);
  font = new PFont[]{"Time waits for no one","merry christmas");
  fadeMode = true;
  textFont(font);
}

void draw(){
  textSize(32);
  //text("Time waits for no one");
  if(mcnt <= font.length-1){
    execFade(font[muct]);
  } else {
    for (PFont fonts : font){
      fonts = null;
    }
    exit();
  }
}

void execFade(PFont font){
  tint(255f,alpha);
  image(font,muct*500,0,500,500);
    if (cnt >= frameRate*3) {
    fadeMode = !fadeMode;
    cnt = 0;
  }
  if (fadeMode) {
    // IN 
    if (alpha < 255.0F) {
      alpha = alpha + 4f;
      cnt = 0;
    } else {
      alpha = 255f;
      cnt++;
    }
  } else {
    // OUT
    if (alpha > 0.0F) {
      alpha = alpha - 4f;
      cnt = 0;
    } else {
      println("next!!");
      fadeMode = !fadeMode;
      cnt =0;
      mcnt++;      // 次の画像に進むためのカウンタを+1
    }
  }    
} 
  
  

  
