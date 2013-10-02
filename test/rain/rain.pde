
ArrayList<rainDrop> rds;
rainDrop r1;
//PVector p1;
int grps=1;
Ripple ripple1;
ArrayList<Ripple> manyRipples;

public PGraphics pgRain;

void setup(){

  size(720,640,P3D);
  pgRain = createGraphics(100,100);
  //size(550,550);
  
    
    rds = new ArrayList<rainDrop>();
    
    for(int addDrops=0;addDrops<100;addDrops++){
    rds.add(new rainDrop());
    }
     
    ripple1 = new Ripple(width/2,height/2, 2,0); 
     //r1 = new rainDrop();

}


void draw(){

  background(255);
  
  /*
  int numberOfRemovedObjects=0;
  
  if(rds.size()==0){
  
    //rds.createObjs();
    
    //for(int increaseSize=0;increaseSize<30-rds.size();increaseSize++){
    for(int increaseSize=0;increaseSize<50;increaseSize++){
     rds.add(new rainDrop());       
    }
  }
  */
  
  
  for(int i=rds.size()-1;i>=0;i--){
 rainDrop newRd = rds.get(i); 
 //newRd.move();
 int objectExists = newRd.dropShape(grps);
 newRd.finished();
 
 /*
 pg.beginDraw();
 pg.ripple1.move(2);
 pg.ripple1.display();
 pg.endDraw();
 image(pg,width/2,height/2);
 */
 
 
// if(newRd.finished() == 1){
// rds.remove(i);  
// }
 
   /*
   if(objectExists == 1){
     //println("newRd.dropSizeAcceleration.z - "+newRd.dropSizeAcceleration.z);
     rds.remove(i);
     //numberOfRemovedObjects++;
     rds.add(new rainDrop());
     } */
 
  }
  
  
  //pushMatrix();
  //rotateX(radians(45));
  //ripple1.move(2);
  //ripple1.display();
  
  //popMatrix();
  
  
  
  /*
  
  if(numberOfRemovedObjects>0){
  
  for(int nob=0;nob<numberOfRemovedObjects;nob++){
  
    rds.add(new rainDrop());
  
  }
  
  numberOfRemovedObjects=0;
  
  }
  /*
  if(rds.size()<3){
    for(int addDrops=0;addDrops<30;addDrops++){
    rds.add(new rainDrop());
    }
    
  }*/
  
  //r1.display();
  
}

/*
void mousePressed(){
  
  //p1.set(random(),random(),random());
  //rds.add(new rainDrop(p1));
  
  grps = int(random(3,15));
  
}

void mouseReleased(){
  grps = 1;

}*/
