
ArrayList<rainDrop> rds;
rainDrop r1;
int grps=1;
Ripple ripple1;
ArrayList<Ripple> manyRipples;
PVector pRipple;
boolean som;
boolean rippleBool;

public PGraphics pgRain;

void setup() {

  size(720, 640, P3D);
  pgRain = createGraphics(100, 100);
  //size(550,550);


  rds = new ArrayList<rainDrop>();
  manyRipples = new ArrayList<Ripple>();

  for (int addDrops=0;addDrops<200;addDrops++) {
    rds.add(new rainDrop());
  }

  ripple1 = new Ripple(width/2, height/2, 10, 0); 
  //r1 = new rainDrop();
}


void draw() {



  //if(som==false){
  background(255);

  for (int i=rds.size()-1;i>=0;i--) {
    rainDrop newRd = rds.get(i); 
    
    /*
    if (rainDrop.isFinished()) {
       ripples.add(new Ripple(rainDrop.x,rainDrop.y));
       rds.remove(i); 
    }
    */
    pRipple = newRd.dropShape(grps);
    som = newRd.finished();

    //ripple1.move();
    //ripple1.display();

    //}
    //if(som==true){
    /*
 Ripple nr = new Ripple(pRipple.x,pRipple.y,10,0);
     som2 = nr.move(2);
     nr.display();
     
     if(rippleBool==true){som = false;}
     
     //}
     */
  }
}

