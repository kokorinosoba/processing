int num = 500;
//Snow[] snows = new Snow[num];

float max_r = 10;
float min_r = 1;
float max_z = 20;
float min_z = 0;
float max_ys = 3;
float min_ys = 1;


float wind = 0;
boolean flag = false;

//float snows = [num];

void setup(){
  size(600,800);
  colorMode(HSB,360,100,100,100);
  //frameRate(10);
  //blendMode(ADD);
  background(0);
  smooth();
  noStroke();
  fill(255,100);
  
  for (int i =0; i < num; i++){
     snows[i] = new Snow(i);
  }
}
void draw(){
  background(0);
  for (int i = 0; i < num; i++){
    snows[i].fall(wind);
    snows[i].show();
    //snows[i].draw();
  }
}
    void keyPressed(){
      if(keyCode == RIGHT_ARROW && flag == false && wind <10){
        wind++;
        flag = true;
      }else if(keyCode == LEFT_ARROW && flag == false && wind > -10){
        wind--;
        flag = true;
      }
      
    }
    
    void keyReleased(){
      flag = false;
    }
  void Snow(){
   this.x = random(-width/2-wind*100,width+width/2-wind*100);
   this.y = random(-height,0);
   this.z = random(min_z,max_z);
   this.r = map(this.z , min_z , max_z , min_r , max_r);
   this.yspeed = map(this.z , min_z , max_z,min_ys , max_ys);
   this.my_num = i;
   
   this.fall= void(wind)
     this.y=this.y+this.yspeed; 
     if(this.y>0){
       this.x+=wind*map(this.z,min_z,max_z,0.3,1);
    }
     
    if(frameCount%20==0){
      this.x+=random(-1.5,1.5);
    }
    if(this.y>height){
      snows[this.my_num] = new Snow(this.my_num);
    }
  };
   

    
      
      
    
