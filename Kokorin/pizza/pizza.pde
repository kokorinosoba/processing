size(600, 600);
textSize(18);
for (int i = 0; i < width; i += 100) {
  text(i, i, 20);
}
for (int i = 0; i < height; i += 100) {
  text(i, 0, i);
}

fill(#f5deb3);
stroke(#deb887);
strokeWeight(14);
arc(300, 300, 300, 300, 0, QUARTER_PI);

noFill();
stroke(223, 150, 122);
strokeWeight(8);
arc(380, 350, 20, 20, radians(225), radians(405));
