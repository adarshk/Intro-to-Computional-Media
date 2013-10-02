class Ripple {
  color c;
  float xpos;
  float ypos;
  float speed;
  float size;
  float valueOfMouseX;
  float valueOfMouseY;
  

//Ripple constructor
  
   Ripple(){}

  Ripple(float tempX, float tempY, float tempSize, color tempC) {
    xpos = tempX;
    ypos = tempY;
    size = tempSize;
    c = tempC;
    
  }
  
  
  Ripple(float tempX, float tempY, float tempSize, color tempC, float rspeed,float MouseXValue, float MouseYValue) {
    xpos = tempX;
    ypos = tempY;
    size = tempSize;
    c = tempC;
    speed=rspeed;
    valueOfMouseX=MouseXValue;
    valueOfMouseY=MouseYValue;
  }
  
  boolean move(float tspeed) {
    size = size + tspeed;
    if (this.getSize() > width/8) {
      return true;
      //this.reset(width/2,height/2,tspeed,c);
    }
    return false;
  }
  
  void move() {
    size = size + speed;
    if (this.getSize() > width/8) {
      reset(valueOfMouseX,valueOfMouseX,speed,c);
    }
  }
  
  float moveRipple(PVector pos, float drpSize) {
    //void moveRipple(PVector pos) {
    if(pos.y < width/8)
    drpSize = drpSize + pos.z;
    return drpSize;
    //size = size + pos.z;
   // if (this.getSize() > width/4) {
      
      //reset(pos.x,pos.y,speed,c);
    //}
  }
  
  float getSize() {
    return size;
  }
  
  void reset(float tx, float ty,float tsize, color tC) {
    pushMatrix();  
    xpos = tx;
    ypos = ty;
    c = tC;
    fill(c,c,c,100);
    size = tsize;
    ellipse(xpos,ypos, size, size);
    popMatrix();
  }

  void display() {
    
    pushMatrix();
    
    stroke(2,2);
    fill(c,100);
    //noFill();
    //stroke(0);
   // translate();
    //scale(0,0,0);
    translate(0,400);
    rotateX(radians(90));  
    ellipseMode(CENTER);
    ellipse(xpos,ypos, size, size);
    popMatrix();
  }
  
  void displayAtEndOfRainDrops(PVector drawPos,float dropSize) {
    
    
    
    //while(dropSize>width/8){
    pushMatrix();
    
    stroke(2,2);
    fill(0);
    //fill(c,100);
    //noFill();
    //stroke(0);
   // translate();
    //scale(0,0,0);
    //translate(0,400);
    //rotateX(radians(90));  
    println("I am here");
    ellipseMode(CENTER);
    ellipse(drawPos.x,drawPos.y, dropSize, dropSize);
    //dropSize = dropSize + drawPos.z;
    popMatrix();
    
    //dropSize = dropSize + drawPos.z;
    //return dropSize;
  }//}
  
  
}
