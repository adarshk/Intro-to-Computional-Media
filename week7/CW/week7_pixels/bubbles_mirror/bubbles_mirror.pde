import processing.video.*;

Capture video;

Bubble[] bubbles = new Bubble[1000];

void setup() {
  size(640, 480);
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubble(random(width), random(height));
  }
  video = new Capture(this, 640, 480);
  video.start();
  background(0);
}

void captureEvent(Capture video) {
  video.read();
}
void draw() {
  //image(video, 0, 0);
  for (Bubble b : bubbles) {
    b.display();
    b.ascend();
  }
}

