var R = 50;

var x1;
var y1;

var x2;
var y2;

var xSpeed = 1;

var moveFlag1 = true;
var moveFlag2 = false;

function setup() {
  createCanvas(300, 300);
  background(255);

  x1 = width/2;
  y1 = height/2;

  x2 = -R/2;
  y2 = y1;

  rectMode(CENTER);
  noStroke();
}

function draw() {
  background(200);

  fill(0);
  rect(x1, y1, R, R);
  rect(x2, y2, R, R);
  
  if (moveFlag1) {
    x1 += xSpeed;
  }

  if (moveFlag2) {
    x2 += xSpeed;
  }

  if (x1 > width - R/2) {
    moveFlag2 = true;
  }
  
  if(x2 > width - R/2){
    moveFlag1 = true;
  }

  if(x1 > width + R/2){
    x1 = -R/2;  
    moveFlag1 = false;
  }
  
  if(x2 > width + R/2){
    x2 = -R/2;  
    moveFlag2 = false;
  }
}
