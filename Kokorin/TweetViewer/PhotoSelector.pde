class PhotoSelector {
  String[] photoNames = {"photo00000.JPG", "photo00001.JPG", "photo00002.JPG", "photo00003.JPG", "photo00004.JPG", "photo00005.JPG", "photo00006.JPG", "photo00007.JPG", "photo00008.JPG", "photo00009.JPG", "photo00010.JPG"};
  int photoIndex;
  int displayCounter;
  int displaySecond;
  int reloadCounter;
  int reloadSecond;
  PImage img;
  TweetSelector tweet;

  PhotoSelector() {
    photoIndex = 0;  // initial photoIndex
    img = loadImage(photoNames[photoIndex]);
    tweet = new TweetSelector();
    displayCounter = 0;
    reloadCounter = 0;
    // interval parameters
    // set values in display > reload otherwise reloadSecond in vain
    displaySecond = 6;
    reloadSecond = 30;
  }

  void draw() {
    image(img, 0, 0, width, height);
    showText();
    if (displayCounter / myFrameRate >= displaySecond) {
      counter();
      if (reloadCounter / myFrameRate >= reloadSecond) {
        tweet.loadTweetFromCSV();
        println("CSV reloaded!");
        reloadCounter = 0;
      }
    }
    println(displayCounter, myFrameRate);
    displayCounter++;
    reloadCounter++;
  }

  void counter() {
    indexIncrement();
    img = loadImage(photoNames[photoIndex]);
    tweet.indexIncrement();
    setTextSize();
    displayCounter = 0;
  }

  void indexIncrement() {
    photoIndex++;
    if (photoIndex >= photoNames.length) {
      photoIndex = 0;
    }
  }

  void setTextSize() {
    int len = tweet.getTweet().length();
    float size = - 1.58563617754798 * len + 0.01251608685432 * len * len - 0.00003688468394 * len * len * len + 110.79920079920268;
    textSize(size*0.5);
  }

  void showText() {
    switch (photoIndex) {
    case 0:
      noStroke();
      fill(0, 80);
      rect(width / 16, 0, width/2, height);
      fill(255);
      text(tweet.getTweet(), width * 3 / 40, height / 12, width / 2 - width / 40, height);
      break;
    case 1:
      noStroke();
      fill(255, 150);
      rect(0, height * 7 / 12, width, height * 5 / 12);
      rectMode(CORNER);
      fill(0);
      text(tweet.getTweet(), width * 3 / 80, height * 37 / 60, width * 74 / 80, height * 29 / 60);
      break;
    case 2:
      noStroke();
      fill(#ffa500, 200);
      rect(0, height / 4, width / 2, height / 2);
      fill(0);
      text(tweet.getTweet(), width * 3 / 80, height * 9 / 30, width * 9 / 20, height * 3 / 10);
      break;
    case 3:
      noStroke();
      fill(255, 120);
      rect(0, 0, width * 33 / 80, height);
      fill(0);
      text(tweet.getTweet(), width / 40, height / 30, width * 3 / 8, height);
      break;
    case 4:
      fill(255);
      text(tweet.getTweet(), width / 2, height / 30, width * 19 / 40, height / 2);
      break;
    case 5:
      noStroke();
      fill(255, 180);
      rect(width / 20, 0, width * 7 / 20, height * 2 / 3);
      fill(0);
      text(tweet.getTweet(), width * 3 / 40, height / 60, width * 12 / 40, height * 19 / 30);
      break;
    case 6:
      fill(255);
      text(tweet.getTweet(), width / 8, height * 5 / 12, width * 3 / 4, height * 5 / 12);
      break;
    case 7:
      fill(255);
      text(tweet.getTweet(), width / 40, height * 7 / 12, width *  11 / 16, height * 23 / 60);
      break;
    case 8:
      fill(255);
      text(tweet.getTweet(), width / 40, height / 30, width / 2, height / 3);
      break;
    case 9:
      noStroke();
      fill(0, 100);
      rect(width * 3 / 8, height * 7 / 12, width * 5 / 8, height * 5 / 12);
      fill(255);
      text(tweet.getTweet(), width * 2 / 5, height * 37 / 60, width * 23 / 40, height * 23 / 60);
      break;
    case 10:
      fill(255);
      text(tweet.getTweet(), width / 40, height * 11 / 20, width / 2, height * 7 / 15);
      break;
    default:
      fill(0);
      textAlign(CENTER, CENTER);
      rectMode(CENTER);
      text(tweet.getTweet(), width / 2, height / 2, width / 2, height);
    }
  }
}
