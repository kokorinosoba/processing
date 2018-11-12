PhotoSelector photo;

void setup() {
  size(800, 600);
  frameRate(10);
  photo = new PhotoSelector();
}
void draw() {
  photo.draw();
  println(frameCount, photo.photoNames.length);
}
