class Ripple {
  color c;
  float xpos;
  float ypos;
  float speed;
  float size;

//Ripple constructor
  Ripple(float tempX, float tempY, float tempSize, color tempC) {
    xpos = tempX;
    ypos = tempY;
    size = tempSize;
    c = tempC;
  }
  
  void move(float tspeed) {
    size = size + tspeed;
    if (this.getSize() > width) {
      this.reset(width/2,height/2,tspeed,c);
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
