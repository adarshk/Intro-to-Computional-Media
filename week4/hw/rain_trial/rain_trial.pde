
ArrayList<rainDrop> rds;
rainDrop r1;
PVector p1;

void setup(){

  
    size(550,550,P3D);
    rds = new ArrayList<rainDrop>();
    
    rds.add(new rainDrop());
     r1 = new rainDrop();

}


void draw(){

  background(255);
  
  fill(205);
 
 /* 
  for(int i=rds.size();i>=0;i--){
 rainDrop newRd = rds.get(i); 
 //newRd.move();
 newRd.display();
 
  }*/
  
  r1.display();
  
}

/*
void mousePressed(){
  
  p1.set(random(),random(),random());
  rds.add(new rainDrop(p1));
  
}

*/
