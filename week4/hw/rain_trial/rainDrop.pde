class rainDrop{
  
  color c;
  PVector dropSizeAcceleration;
  int xPosition,yPosition,acceleration;
  int numberOfRainDrops;
  float rainDropSize;
  float rotateRandom=0;
  int speedOfDrop=0;
  
 rainDrop(){
 
   xPosition = int(random(100,450));
   yPosition = 20;
   acceleration = 0;
   dropSizeAcceleration.set(random(100,450),0,0);
   c=color(random(0,255),random(0,255),random(0,255));
   numberOfRainDrops = int(random(5,15));
   rainDropSize = int(random(2,8));
   println("rainDropSize - "+rainDropSize);
   rotateRandom = random(-10,10);
   
   }
 
 /*
 rainDrop(PVector drpAcc){
 
   dropSizeAcceleration = drpAcc;
   c=color(random(0,255),random(0,255),random(0,255));
   
 }
 
 rainDrop(PVector drpAcc2,color rd){
 
   dropSizeAcceleration = drpAcc2;
   c=rd;
 
 }
 
 int move(){
 
   //return speedOfDrop+1;
   return dropSizeAcceleration.z + 1;
 
 }
 */
 void display(){
 
  /* 
   for(int dr =0;dr<this.rainDropSize;dr++){
   
     //ellipse(dropSizeAcceleration.x,dropSizeAcceleration.y-dr,this.rainDropSize-dr,this.rainDropSize-dr);
     //println("this.xPosition - "+this.xPosition,this.yPosition-dr,this.rainDropSize-dr,this.rainDropSize-dr);
     ellipse(this.xPosition,this.yPosition-dr,this.rainDropSize-dr,this.rainDropSize-dr);
     
   }
   
    this.dropSizeAcceleration.x +=this.rotateRandom;
    this.dropSizeAcceleration.y +=10; 
 
 }
  */
  
  ellipse(300,300,10,10);
  
  
}
