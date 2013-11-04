import gab.opencv.*;
import processing.video.*;

PImage src, dst;
OpenCV opencv;
Capture cam;
int savedFrame=0;

ArrayList<Contour> contours;
ArrayList<Contour> polygons;

void setup() {
  size(640,480);
  //src = loadImage("test.jpg"); 
  //size(width,height, P2D);
  cam = new Capture(this,640,height);
  //cam = new Capture(this,640,480,"Logitech Camera",30);
  opencv = new OpenCV(this, 640,480);
  
  cam.start();

 
}

void draw() {
  
 //  opencv.gray();
  //opencv.threshold(70);
  //dst = opencv.getOutput();

  image(cam, 0, 0);
  
  opencv.loadImage(cam);
  
  //opencv.updateBackground();
  
  opencv.dilate();
  opencv.erode();

  contours = opencv.findContours();
  println("found " + contours.size() + " contours");
  
  //scale(0.5);
  
  //image(dst, src.width, 0);

  noFill();
  strokeWeight(3);
  
  for (Contour contour : contours) {
    stroke(0, 255, 0);
    contour.draw();
    
    stroke(255, 0, 0);
    beginShape();
    for (PVector point : contour.getPolygonApproximation().getPoints()) {
      vertex(point.x, point.y);
    }
    endShape();
  }
  
  
  
}

void captureEvent(Capture video){

  video.read();

}


void keyPressed(){

  if(key == 's'){saveFrame(savedFrame + ".png");
    savedFrame++;
    }

}
