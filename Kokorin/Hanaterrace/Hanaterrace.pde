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
  photo.photoIndex = 0;
  // println(tweet.getTweet());
  // tweet.indexIncrement();
  // photo.draw();
  // photo.counter();
  // println(photo.tweet.getTweet());
  // println(frameRate);
}
