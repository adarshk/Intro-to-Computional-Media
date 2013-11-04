
PImage src;
PImage dest;

void setup() {
  size(800, 400);
  src = loadImage("manatee.jpg");
  dest = createImage(src.width,src.height,ARGB);
}

void draw() {
  background(255,0,0);
  
  float factor = map(mouseX,0,width,0,15);
  
  src.loadPixels();
  dest.loadPixels();
  for (int x = 0; x < src.width; x++) {
    for (int y = 0; y < src.height; y++) {
      int index = x + y*src.width;
      float newx = x + random(-factor,factor);
      float newy = y + random(-factor,factor);
      int newindex = int(newx) + int(newy)*src.width;
      newindex = constrain(newindex,0,dest.pixels.length-1);
      dest.pixels[index] = src.pixels[newindex];
    }
  }
  dest.updatePixels();
  
  image(dest,0,0);
}

