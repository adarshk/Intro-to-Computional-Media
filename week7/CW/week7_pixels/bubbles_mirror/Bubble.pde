class Bubble {
  float x, y;
  float radius;

  Bubble(float x_, float y_) {
    x = x_;
    y = y_;
    radius = random(20,40);
  }

  void ascend() {
    x = x + random(-2,2);
    y = y - 1;
    
    if (y < -radius) {
      y = height+100; 
    }
  }

  void display() {
    color c = video.get(int(x),int(y));
    
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    
    noStroke();
    fill(r,g,b,10);
    ellipse(x, y, radius, radius);
  }
}

