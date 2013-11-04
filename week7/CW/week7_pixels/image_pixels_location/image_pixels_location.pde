
PImage img;
void setup() {
  size(400, 339);
  img = loadImage("manatee.jpg");
}

void draw() {
  background(0);
  
  float factor = map(mouseX,0,width,0,15);
  
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y*width;
      float newx = x + random(-factor,factor);
      float newy = y + random(-factor,factor);
      int newindex = int(newx) + int(newy)*width;
      newindex = constrain(newindex,0,pixels.length-1);
      pixels[index] = img.pixels[newindex];
    }
  }
  updatePixels();
}

