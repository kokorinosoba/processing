int[] list = {0, 1, 2, 3, 4, 5};
int listIndex = 0;
void setup() {
  frameRate(1);
}
void draw() {
  println(list[listIndex]);
  listIndex++;
  if (listIndex >= list.length) {
    listIndex = 0;
  }
}
