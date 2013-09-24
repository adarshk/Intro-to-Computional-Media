Ripple ripple;
Ripple ripple2;
Ripple ripple3;
ArrayList<Ripple> manyRipples;


void setup() {
  size(300,300);
  background(255,0,0);
  //ripple = new Ripple(width/2,height/2, 2.1,0);
  //ripple2 = new Ripple(width/2,height/2, 2,255);
  manyRipples = new ArrayList<Ripple>();
  //The statement below is same as ripple1 above.
  manyRipples.add(new Ripple(width/2,height/2, 2,0,2.1,width/2,height/2));
  
  //The statement below is same as ripple2 above.
  manyRipples.add(new Ripple(width/2,height/2, 2,255,2,width/2,height/2));
  
  //This is a new ripple that I am making
  manyRipples.add(new Ripple(width/2,height/2, 2,100,2,width/2,height/2));
  
}

void draw() {
  
  for(int i=manyRipples.size()-1;i>=0;i--){
  
    Ripple newRipple = manyRipples.get(i);
    newRipple.move();
    newRipple.display();
  }
  
 
  
  
}


void mousePressed(){
  
  //If you need from the mouse position
  manyRipples.add(new Ripple(mouseX,mouseY,2,50,4,mouseX,mouseY));
  
  

}

