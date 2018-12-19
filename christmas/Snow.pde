class Snow{
  color col;
  //float snow_size;
  float x;
  float y;
  float r;
  float z;
  PVector location;
  PVector velocity;
  
  Snow(){
   //snow_size = random(30,100);
   location = new PVector(random(0,width),random(0,height));
   velocity = new PVector(0,random(30,100));
   col = color(255);
  }
  
  void draw(){
   // fill(col);
    //pushMatrix();
    //translate(location.x, location.y);
    //ellipse(10,10,10,snow_size);
   // popMatrix();
    pushMatrix();
    translate(location.x,location.y);
    x = random(-width/2,width+width/2);
    y = random(-height,0);
    z = random(min_z,max_z);
    r = map(z,min_z,max_z,min_r,max_r);
    ellipse(x,y,r,z);
    popMatrix();
    location.add(velocity);
    
    if ((location.y < 0) || (location.y > height)){
      location.x = random(0,width);
      location.y = 0;
    }
  }
}
    
    
    
    
  

  
  
 

   
   
