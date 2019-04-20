int nb_r;
float all_diam;
float average_diam;

ArrayList<Root> r;

PImage[] img = new PImage[5];
PGraphics pg1;
PGraphics pg2;

int current_img;

void preload() { // We have to load image before setup()
  for (int i = 0; i < 5; i++) {
      img[i] = loadImage("merle_"+(i + 1)+".jpg");
  }
}

void setup() {
  preload();
  size(500, 500);
  pixelDensity(1); // Set 1 because it's too slow on firefox
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();

  nb_r = int(random(12, 18));
  r = new ArrayList<Root>();
  for (int i = 0; i < nb_r; i++) {
    r.add(new Root());
  }  

  current_img = 0;
  pg1 = createGraphics(width, height);
  pg2 = createGraphics(width, height);
  pg1.beginDraw();
  pg1.background(#FFFFFF);
  pg1.endDraw();
  image(pg1, 0, 0, width, height);
}

void draw() {
  //image(img, 0, 0, width, height);

  for (int i = 0; i < r.size(); i++) {
    r.get(i).update();
   }
   
   pg1.beginDraw();
   //pg1.noStroke();
   pg1.noFill();
   for(int j = 0; j < r.size(); j++) {
     //pg1.fill(r[j].c);
    pg1.stroke(r.get(j).c);
    pg1.strokeWeight(width/750);
     //pg1.ellipse(r[j].loc.x, r[j].loc.y, 10, 10);

     pg1.beginShape();
     for (int k = 1; k <= 3; k++) {
       pg1.vertex(r.get(j).loc.x + sin(r.get(j).angle+(radians(120)*k)) * r.get(j).diam, r.get(j).loc.y + cos(r.get(j).angle+(radians(120)*k)) * r.get(j).diam);
     }
     pg1.endShape(CLOSE);
     r.get(j).angle+=0.1;
   }
   pg1.endDraw();
  
   //image(pg1, 0, 0, width, height);

  pg2.beginDraw();
  pg2.clear(); // On efface les pixels précédents
  //pg2.blendMode(ADD);
  //pg2.blendMode(LIGHTEST);
  pg2.blendMode(SCREEN);
  pg2.image(img[current_img], 0, 0, width, height);
  pg2.image(pg1, 0, 0, width, height);
  pg2.endDraw();
  image(pg2, 0, 0, width, height);


  for (int j = 0; j < r.size(); j++) {
    all_diam += r.get(j).diam;
  }
  average_diam = all_diam/r.size()-1;
  all_diam = 0;

  if (average_diam <= .5) {
    pg1.beginDraw();
    pg1.background(#FFFFFF);
    pg1.endDraw();
/*
    for (int i = 0; i <= nb_r; i++) {
      r.pop();
    }
*/
    r.clear(); // pop replacement
    
    nb_r = int(random(12, 18));
    for (int j = 0; j < nb_r; j++) {
      r.add(new Root());
    }
    for (int k = 0; k < r.size(); k++) {
      r.get(k).init();
   } 

    current_img += 1; 
    if (current_img > 4) {
      current_img = 0;
    }
  }
}
