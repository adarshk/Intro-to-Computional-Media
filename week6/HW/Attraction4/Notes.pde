class Notes{
  
  PVector pos;
  int size;
  color c;
 Notes(PVector loc,int repelSize){
 
   pos = loc;
   size = repelSize;
   c = color(random(255),random(255),random(255));
 }
 
 void display(){
  //fill(0);
  //noFill();
  fill(c);
  rect(pos.x,pos.y,size,height-size);
  
 } 
 
 
 void setColor(){
  
  c = color(random(255),random(255),random(255));
   
 }
}
