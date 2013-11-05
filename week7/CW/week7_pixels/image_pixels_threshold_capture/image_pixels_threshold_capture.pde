import processing.video.*;

//PImage img;
Capture video;


void setup() {
  size(640, 480);
  //img = loadImage("manatee.jpg");
  video = new Capture(this, 640, 480);
  video.start();
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  background(0);


  float threshold = map(mouseX, 0, width, 0, 255);

  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y*width;

      float bright = brightness(video.pixels[index]);

      if (bright > threshold) {
        pixels[index] = color(255);
      } 
      else {
        pixels[index] = color(0);
      }
    }
  }
  updatePixels();
}

