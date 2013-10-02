class Ripple {
  color c;
  float xpos;
  float ypos;
  float speed;
  float size;
  float valueOfMouseX;
  float valueOfMouseY;

//Ripple constructor
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
  
  void move(float tspeed) {
    size = size + tspeed;
    if (this.getSize() > width/8) {
      this.reset(width/2,height/2,tspeed,c);
    }
  }
  
  void move() {
    size = size + speed;
    if (this.getSize() > width/8) {
      reset(valueOfMouseX,valueOfMouseX,speed,c);
    }
  }
  
  float getSize() {
    return size;
  }
  
  void reset(float tx, float ty,float tsize, color tC) {
    xpos = tx;
    ypos = ty;
    c = tC;
    fill(c,c,c,100);
    size = tsize;
    ellipse(xpos,ypos, size, size);
  }

  void display() {
    stroke(2,2);
    fill(c,100);
    //noFill();
    //stroke(0);
    pushMatrix();
    translate(0,100);
    rotateX(radians(65));  
    ellipseMode(CENTER);
    ellipse(xpos,ypos, size, size);
    popMatrix();
  }
  
}
