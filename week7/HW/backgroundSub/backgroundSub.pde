import gab.opencv.*;
import processing.video.*;

PImage src, dst,canny;
OpenCV opencv;
Capture cam;
int savedFrame=0;

ArrayList<Contour> contours;
ArrayList<Contour> polygons;

void setup() {
  size(640,480);
  //src = loadImage("test.jpg"); 
  //size(width,height, P2D);
  cam = new Capture(this,320,240,"Logitech Camera",30);
  opencv = new OpenCV(this, 640,480);
  
  //opencv.startBackgroundSubtraction(5, 3, 0.5);
  
  cam.start();

 
}

void draw() {
  
  
  pushMatrix();
  //scale(0.5);
  image(cam,0,0);
  opencv.loadImage(cam);
  opencv.findCannyEdges(20,75);
  canny = opencv.getSnapshot();
  
  image(canny,320,0);
  popMatrix();
  
  
}

void captureEvent(Capture video){

  video.read();

}


void keyPressed(){

  if(key == 's'){saveFrame(savedFrame + ".png");
    savedFrame++;
    }

}
