class Group1{    
  PVector location = new PVector(265,random(100,650));
  PVector acceleration = new PVector(0,0);
  PVector velocity = new PVector(0,0);
  //PVector target = new PVector(0,0);
  PVector direction = PVector.sub(target1,location);
  float diam = 5;
  
 
  void Response(int thresh){
     target1.set(640,375);
     velocity.limit(vel_limit);
      if(keyPressed){
      if(key==' '){
        target1.set(home1);
        velocity.limit(vel_limit_m);
      }
    }
    else{
      velocity.limit(vel_limit);
    }
    if(thresh == 1){
      target1.set(home1);
      velocity.limit(vel_limit_m);
      direction.mult(dir_mag_m);
    }
  }
  
  void Update(){
    direction = PVector.sub(target1,location);
    direction.normalize();
    direction.mult(dir_mag);
    acceleration.set(direction);
    velocity.add(acceleration);
    velocity.limit(vel_limit);
    location.add(velocity);
  }
  
  void Bounce(){
   if(location.x > width/2-100 /*|| location.x < width/2+100*/){
     location.x=0;
   }
   if(location.y > height || location.y < 0){
     location.y=height/2;
   }
  }
  
  void Display(int Stroke){
    noStroke();
    if(Stroke == 1){
      stroke(0);
    }
    if(keyPressed){
        switch(key){
          case '1':
          fill(255,0,0,transparency);
          break;
          case '2':
          fill(255,165,0,transparency);
          break;
          case '3':
          fill(255,255,0,transparency);
          break;
          case '4':
          fill(0,230,30,transparency);
          break;
          case '5':
          fill(0,250,250,transparency);
          break;
          case '6':
          fill(0,0,250,transparency);
          break;
          case '7':
          fill(180,0,215,transparency);
          break;
          case '8':
          fill(250,110,250,transparency);
          break;
          case '9':
          fill(255,215,0,transparency);
          break;
          case '0':
          fill(192,192,192,transparency);
          break;
          }
      }
      else
    fill(13,21,253,transparency);
    ellipse(location.x,location.y,diam,diam);
  }
}
