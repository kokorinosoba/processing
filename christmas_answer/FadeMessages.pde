class FadeMessages {
  float alpha = 0.0F;
  boolean fadeMode;
  PFont font;
  String fontName = "komorebi-gothic-P.ttf";
  String[] messages;
  int cnt = 0;
  int mcnt = 0;
  int showSecond = 7;
  float fadeSecond = 3;
  float fadeSpeed = 255 / (fadeSecond * myFrameRate);

  FadeMessages() {
    font = createFont(fontName, 32);
    messages = new String[]{"\n\n\n泰世へ", 
      "たのしんで、大学生活\nいろんなことを経験して\nせかいを広げてね！\nいつかまた会おう\n月曜にいた田中", 
      "大学合格おめでとう！！大学は泰世が思っているよりもきっとずっと楽しいところです（笑）東京では慣れないことも多いと思うけど、持ち前の明るさで是非楽しんでください。\n中山翔也", 
      
      
      "校長先生に提出する論文の作成に長い間考えていたのが、ついこの間のようです。１年もない短い間だったけど、仲良くなれたかなと自分では思っています。おめでとう。そしてこれからも頑張って！！\nくまもん水口", 
      "５年間、先生でいれたことが何より自分の宝物です。良いところも、もっと頑張ってほしいところもたくさんみてきたけど、やっぱり泰世はいい子だ！！色んなことを経験して、しあわせになってほしいです。\nありがとう。\n植田"}; 
      fadeMode = true;
    textFont(font);
  }

  void draw() {
    textSize(32);
    //text("Time waits for no one");
    if (mcnt <= messages.length-1) {
      execFade(messages[mcnt]);
    } else {
      for (String message : messages) {
        message = null;
      }
      exit();
    }
  }

  void execFade(String message) {
    fill(255f, alpha);
    rectMode(CENTER);
    textAlign(CENTER);
    text(message, width/2, height/2, 530, height*5/6);
    if (cnt >= frameRate*showSecond) {
      fadeMode = !fadeMode;
      cnt = 0;
    }
    if (fadeMode) {
      // IN 
      if (alpha < 255.0F) {
        alpha = alpha + fadeSpeed;
        cnt = 0;
        println("IN");
      } else {
        alpha = 255f;
        cnt++;
        println("show");
      }
    } else {
      // OUT
      println("OUT");
      if (alpha > 0.0F) {
        alpha = alpha - fadeSpeed;
        cnt = 0;
      } else {
        println("next!!");
        fadeMode = !fadeMode;
        cnt =0;
        mcnt++;      // 次の画像に進むためのカウンタを+1
      }
    }
  }
}
