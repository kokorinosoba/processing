function Snow(i){
  this.x = random(-width/2-wind*100,width+width/2-wind*100);
  this.y = random(-height,0);
  this.z = random(min_z,max_z);
  this.r = map(this.z , min_z , max_z , min_r , max_r);
  this.yspeed = map(this.z , min_z , max_z,min_ys , max_ys);
  this.my_num = i;
   
  this.fall=function(wind){
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
   
   
  this.show=function(){
    ellipse(this.x,this.y,this.r,this.r); 
  };
};
