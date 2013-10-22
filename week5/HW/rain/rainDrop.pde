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
 
 PVector dropShape(int groups){
 
  fill(0);
  
  pushMatrix();
    
  rotate(this.rotateRandom);
  
  for(int dr =0;dr<this.rainDropSize;dr++){
  ellipse(dropSizeAcceleration.x,dropSizeAcceleration.y-dr,this.rainDropSize-dr,this.rainDropSize-dr);
  }
  
  popMatrix();
   
  return dropSizeAcceleration;
   
  
  }
  
  boolean finished(){
  
    if(this.dropSizeAcceleration.y>(height)){
    
    this.dropSizeAcceleration.x = int(random(200,width-200));  
    this.dropSizeAcceleration.y = 0;//int(random(0,8));
    this.dropSizeAcceleration.z = int(random(1,6));
    //endRipple.displayAtEndOfRainDrops(dropSizeAcceleration,rainDropSize);
    return true;
  }
   else {
    this.dropSizeAcceleration.y +=this.dropSizeAcceleration.z;
        return false;
        }
    
  }


  void createObjs(){
  
  for(int increaseSize=0;increaseSize<30;increaseSize++){
     rds.add(new rainDrop());       
    }
  }

}
