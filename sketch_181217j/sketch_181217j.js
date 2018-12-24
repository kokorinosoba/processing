const max_r = 10;
const min_r = 1;
const max_z = 20;
const min_z = 0;
const max_ys = 3;
const min_ys = 1;

const num = 500; 
var wind = 0;
var flag = false;

var snows = [num];

function setup() {
  createCanvas(windowWidth, windowHeight);
  colorMode(HSB, 360, 100, 100, 100);
  
  
  background(0);
  smooth();
  noStroke();
  fill(255,100);
  
  for (var i=0; i<num; i++) {
    snows[i]= new Snow(i);
  }

}

function draw() {
  background(0);
  for (var i=0; i<num; i++) {
    snows[i].fall(wind);
    snows[i].show();
  }
}

function keyPressed(){
  
  if(keyCode === RIGHT_ARROW && flag==false && wind<10){
    wind++;
    flag=true;
  }else if(keyCode === LEFT_ARROW && flag==false && wind>-10){
    wind--; 
    flag=true;
  }
  
}

function keyReleased(){
  flag=false; 
}
