int arc_size = 500;

size(600, 600);
background(255);
colorMode(HSB, 360, 100, 100, 100);
smooth();
noStroke();
translate(width/2, height/2);
textAlign(CENTER, CENTER);

for (int i = 0; i < 360; i++) {
  fill(i, 100, 100);
  arc(0, 0, arc_size, arc_size, radians(i)-HALF_PI, radians(i+2)-HALF_PI);
  if (i % 10 == 0) {
    fill(0);
    text(str(i), arc_size * cos(radians(i-90)) * 0.53, arc_size * sin(radians(i-90)) * 0.53);
  }
}