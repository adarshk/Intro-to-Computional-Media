


class rainDrop{
  
  color c;
  PVector dropSizeAcceleration; //z value is speed
  int numberOfRainDrops;
  float rainDropSize;
  float rotateRandom=0;
  float rotateActualDrop=0;
  //ArrayList<rainDrop> rds2;
  Ripple endRipple;
  ArrayList<Ripple> dropRipples;
  PGraphics pg;
  
 rainDrop(){
 
   dropSizeAcceleration = new PVector(random(200,width-200),0,int(random(1,6)));
   c=color(random(0,255),random(0,255),random(0,255));
   numberOfRainDrops = int(random(5,15));
   rainDropSize = int(random(4,9));
   println("rainDropSize - "+rainDropSize);
   rotateRandom = int(random(-10,10));
   rotateActualDrop = int(random(-2,2));
   //endRipple = new Ripple(dropSizeAcceleration.x,dropSizeAcceleration.y,10,0);
   //endRipple=new Ripple();
   
   dropRipples = new ArrayList<Ripple>();
   }
   
   
   rainDrop(PGraphics _pgs){
     
   pg=_pgs;
   dropSizeAcceleration = new PVector(random(200,width-200),0,int(random(1,6)));
   c=color(random(0,255),random(0,255),random(0,255));
   numberOfRainDrops = int(random(5,15));
   rainDropSize = int(random(4,9));
   println("rainDropSize - "+rainDropSize);
   rotateRandom = int(random(-10,10));
   rotateActualDrop = int(random(-2,2));
   dropRipples = new ArrayList<Ripple>();
   }
 
 /*
 rainDrop(PVector drpAcc){
 
   dropSizeAcceleration = drpAcc;
   c=color(random(0,255),random(0,255),random(0,255));
   
 }*/
 
 rainDrop(PVector drpAcc2,color rd){
 
   dropSizeAcceleration = drpAcc2;
   c=rd;
 
 }
 
 int move(){
 
   //return speedOfDrop+1;
   return int(dropSizeAcceleration.z) + 1;
 
 }
 
 int dropShape(int groups){
 
  fill(0);
  
  pushMatrix();
  
  //for(int groupsOfDrops=0;groupsOfDrops<groups;groupsOfDrops++){
  
  rotate(this.rotateRandom);
  
  for(int dr =0;dr<this.rainDropSize;dr++){
   
     //ellipse(dropSizeAcceleration.x + (20*groupsOfDrops),dropSizeAcceleration.y-dr,this.rainDropSize-dr,this.rainDropSize-dr);
  ellipse(dropSizeAcceleration.x,dropSizeAcceleration.y-dr,this.rainDropSize-dr,this.rainDropSize-dr);
     
   }
  
  /*
    if(this.dropSizeAcceleration.y>height){return 1;}
   else {
  
    this.dropSizeAcceleration.x +=this.rotateRandom;
    this.dropSizeAcceleration.y +=10;
    
        }*/
  //}
  
  popMatrix();
   
  return 0;
   
  
  }
  
  int finished(){
  
    if(this.dropSizeAcceleration.y>(height-200)){
    
    //endRipple = new Ripple(300,300,10,0);  
    //println("I printed ripple");
    
    
    
    
    
    //rainDropSize = endRipple.moveRipple(dropSizeAcceleration);
    //endRipple = new Ripple(dropSizeAcceleration.x,dropSizeAcceleration.y, 2,0);
    //endRipple.move(2);
    //endRipple.display();
    
    //for(int k=0;k<width/8;k++){
    //ellipse(this.dropSizeAcceleration.x,this.dropSizeAcceleration.y,rainDropSize,rainDropSize);
    //}
    
    
    
    this.dropSizeAcceleration.x = int(random(200,width-200));  
    this.dropSizeAcceleration.y = 0;//int(random(0,8));
    this.dropSizeAcceleration.z = int(random(1,6));
    //endRipple.displayAtEndOfRainDrops(dropSizeAcceleration,rainDropSize);
    return 1;
  }
   else {
  
    //this.dropSizeAcceleration.x +=this.rotateActualDrop;
    //this.dropSizeAcceleration.y +=10;
    this.dropSizeAcceleration.y +=this.dropSizeAcceleration.z;
        return 0;
        }
    
  }


  void createObjs(){
  
  for(int increaseSize=0;increaseSize<30;increaseSize++){
     rds.add(new rainDrop());       
    }
  }

}
