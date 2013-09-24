Ripple ripple;
Ripple ripple2;
Ripple ripple3;
ArrayList<Ripple> manyRipples;
//Ripple manyRipples;
//int rippleNumber =1;

void setup() {
  size(300,300);
  background(255,0,0);
  ripple = new Ripple(width/2,height/2, 2.1,0);
  ripple2 = new Ripple(width/2,height/2, 2,255);
  manyRipples = new ArrayList<Ripple>();
  manyRipples.add(new Ripple(width/2,height/2, 2,100));
  //manyRipples = new Ripple[10];
  //manyRipples[0] = new Ripple(width/2,height/2, 2,100);
//  ripple3 = new Ripple(width/2,height/2, 2,255);
}

void draw() {
  ripple.move(2.1);
  ripple.display();
  ripple2.move(2);
  ripple2.display();
  
  for(int i=manyRipples.size()-1;i>=0;i--){
  
    Ripple newRipple = manyRipples.get(i);
    newRipple.move(2);
    newRipple.display();
  }
  
  /*
  for(int i=0;i<rippleNumber;i++){
  manyRipples[i].move(2.2);
  manyRipples[i].display();;
  }
  */
  
  
}


void mousePressed(){

  //If you need from middle
  //manyRipples.add(new Ripple(width/2,height/2,2,105));
  
  //If you need from the mouse position
  manyRipples.add(new Ripple(mouseX,mouseY,2,105,2,mouseX,mouseY));
  
  //Using only arrays instead of arraylist
  //manyRipples[rippleNumber] = new Ripple(mouseX,mouseY,2.2,100);
  //rippleNumber++;  

}

