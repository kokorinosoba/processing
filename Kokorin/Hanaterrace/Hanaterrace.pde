PhotoSelector photo;
public final float myFrameRate = 1;

void setup() {
  size(1920, 1080);
  frameRate(myFrameRate);
  photo = new PhotoSelector();

  PFont font = createFont("MPLUSRounded1c-Regular.ttf", 100);
  textFont(font);
  photo.setTextSize();
}
void draw() {
  photo.draw();
}

void mousePressed() {
  photo.tweet.loadTweetFromCSV();
  photo.tweet.tweetIndex = 0;
  photo.displayCounter = 0;
  photo.setTextSize();
}
