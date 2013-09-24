class Ripple {
  color c;
  float xpos;
  float ypos;
  float speed;
  float size;
  float positionX;
  float positionY;

//Ripple constructor
  /*
  Ripple(float tempX, float tempY, float tempSize, color tempC) {
    xpos = tempX;
    ypos = tempY;
    size = tempSize;
    c = tempC;
    
  }
  */
  //New ripple constructor where additionally I am passing in speed and X & Y postions.
  Ripple(float tempX, float tempY, float tempSize, color tempC, float rspeed,float MouseXValue, float MouseYValue) {
    xpos = tempX;
    ypos = tempY;
    size = tempSize;
    c = tempC;
    speed=rspeed;
    positionX=MouseXValue;
    positionY=MouseYValue;
  }
  
  /*
  void move(float tspeed) {
    size = size + tspeed;
    if (this.getSize() > width) {
      this.reset(width/2,height/2,tspeed,c);
    }
  }*/
  
  //New ripple move without the speed 
  void move() {
    size = size + speed;
    if (this.getSize() > width) {
      this.reset(positionX,positionY,speed,c);
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
    ellipseMode(CENTER);
    ellipse(xpos,ypos, size, size);
  }
  
}
