

void setup() {
  size(400, 400);
}

void draw() {
  background(0);

  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y*width;
      
      float d = dist(x,y,mouseX,mouseY);
      pixels[index] = color(map(d,0,100,255,0));
    }
  }
  updatePixels();
}

