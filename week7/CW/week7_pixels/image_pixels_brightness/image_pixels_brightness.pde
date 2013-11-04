
PImage img;
void setup() {
  size(400, 339);
  img = loadImage("manatee.jpg");
}

void draw() {
  background(0);
  
  float factor = map(mouseX,0,width,0,5);
  
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y*width;
      
      //float d = dist(x,y,mouseX,mouseY);
      //pixels[index] = color(map(d,0,100,255,0));
      
      float r = factor*red(img.pixels[index]);
      float g = factor*green(img.pixels[index]);
      float b = factor*blue(img.pixels[index]);
      
      pixels[index] = color(r,g,b);
    }
  }
  updatePixels();
}

