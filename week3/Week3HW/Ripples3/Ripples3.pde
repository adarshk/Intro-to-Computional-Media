//Ripple ripple;
//Ripple ripple2;
//Ripple ripple3;
ArrayList<Ripple> manyRipples;


void setup() {
  size(1200,800);
  background(0,100,100);
  manyRipples = new ArrayList<Ripple>();
  
  manyRipples.add(new Ripple(width/2,height/2, 2,0,7,width/2,height/2, width/2));
  
  manyRipples.add(new Ripple(width/2,height/2, 1,255,7*.8,width/2,height/2, width/2));
  
  manyRipples.add(new Ripple(width/2,height/2, 1,color(0,122,121),7*.5,width/2,height/2, width/2));
  
  manyRipples.add(new Ripple(width/2,height/2, 1,255,7*.7,width/2,height/2, width/2));
  
  manyRipples.add(new Ripple(width/2,height/2, 1,color(0,122,121),7*.6,width/2,height/2, width/2));
}

void draw() {
  
  
  if(manyRipples.size()==0){
  
  manyRipples.add(new Ripple(width/2,height/2, 2,0,7,width/2,height/2, width/2));
  
  manyRipples.add(new Ripple(width/2,height/2, 1,255,7*.8,width/2,height/2, width/2));
  
  manyRipples.add(new Ripple(width/2,height/2, 1,color(0,122,121),7*.5,width/2,height/2, width/2));
  
  manyRipples.add(new Ripple(width/2,height/2, 1,255,7*.7,width/2,height/2, width/2));
  
  manyRipples.add(new Ripple(width/2,height/2, 1,color(0,122,121),7*.6,width/2,height/2, width/2));
  }
  
  for(int i=manyRipples.size()-1;i>=0;i--){
  
    Ripple newRipple = manyRipples.get(i);
    newRipple.move();
    newRipple.display();
  }
  
 
  
  
}


void mousePressed(){
  
  //variable speed and maxSize
//  float tSpeed = random(0.6, 7.2);
  float maxSize = random(width/5, width);
  float tSpeed = map(maxSize, width/5, width, 2, 7.2);
//  manyRipples.add(new Ripple(mouseX,mouseY,2,color(random(0,255),random(0,255),random(0,255)),tSpeed,mouseX,mouseY));
  manyRipples.add(new Ripple(mouseX,mouseY,2,color(random(0,50),262,random(200,255)),tSpeed,mouseX,mouseY, maxSize));  
  manyRipples.add(new Ripple(mouseX,mouseY,1,color(random(3,50),random(50,255),200),tSpeed*.5,mouseX,mouseY, maxSize));
  manyRipples.add(new Ripple(mouseX,mouseY,1,color(random(0,100),100,100),tSpeed*.8,mouseX,mouseY, maxSize));
  manyRipples.add(new Ripple(mouseX,mouseY,1,color(random(3,50),random(50,255),200),tSpeed*.5,mouseX,mouseY, maxSize));
  manyRipples.add(new Ripple(mouseX,mouseY,1,color(random(0,100),100,100),tSpeed*.8,mouseX,mouseY, maxSize));
}


void keyPressed() {

  //remove ripples from the Array
  if (manyRipples.size()>=5) {
    for(int k=manyRipples.size() - 1;k>=0;k--){
    manyRipples.remove(k);
    
   /*   
    manyRipples.remove(manyRipples.size() - 1);
    manyRipples.remove(manyRipples.size() - 1);
    manyRipples.remove(manyRipples.size() - 1);
    manyRipples.remove(manyRipples.size() - 1);
    manyRipples.remove(manyRipples.size() - 1);*/
  }}
  
  background(0,100,100);
}
