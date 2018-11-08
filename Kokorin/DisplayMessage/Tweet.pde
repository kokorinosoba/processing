class Tweet {
  String text;
  PVector location;
  PVector velocity;
  int displayCount; // 中央にとどめておくための変数
  boolean move;

  Tweet(String _text) {
    text = _text;
    location = new PVector(width, height / 2);
    velocity = new PVector(-10, 0);
    displayCount = 0;
    move = false;
  }

  void draw() {
    text(text, location.x, location.y);
    if (move == true) {
      location.add(velocity);
      if (location.x == width / 2) {
        move = false;
      }
    } else {
      displayCount++;
      if (displayCount == 300) {
        move = true;
      }
    }
  }
}
