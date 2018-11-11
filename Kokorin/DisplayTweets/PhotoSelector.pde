class PhotoSelector {
  int photoNumber;
  String[] photoNames = {"photo1.jpg", 
    "photo2.jpg", 
    "photo3.jpg", 
    "photo4.jpg"
  };
  PImage photo;

  PhotoSelector() {
    photoNumber = 0;
    photo = loadImage(photoNames[photoNumber]);
  }

  void draw() {
    imageSelector();
    image(photo, 0, 0, width, height);
  }

  void imageSelector() {
    if (frameCount % 10 == 0) {
      photo = loadImage(photoNames[++photoNumber]);
      if (photoNumber >= photoNames.length) {
        photoNumber = 0;
      }
    }
  }
}
