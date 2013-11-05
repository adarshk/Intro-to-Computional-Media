import gab.opencv.*;
import processing.video.*;

PImage src, dst,canny,loaded;
OpenCV opencv;
Capture cam;
int savedFrame=0;

ArrayList<Contour> contours;
ArrayList<Contour> polygons;

void setup() {
  
   size(640,480);
   
  cam = new Capture(this,width/2,height/2,"Logitech Camera",30);
  opencv = new OpenCV(this, width/2,height/2);
  //dst = createImage(width/2,height/2,ARGB);

  
  
  cam.start();
}

void draw() {
  
  
  opencv.loadImage(cam);
  opencv.gray();
  opencv.threshold(70);
  dst = opencv.getOutput();

  contours = opencv.findContours();
  println("found " + contours.size() + " contours");
  
  

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
  
  image(cam, 0, 0);
  image(dst, width/2, 0);
  
}


void captureEvent(Capture video){

  video.read();

}


void keyPressed(){

  if(key == 's'){saveFrame(savedFrame + ".png");
    savedFrame++;
    }

}
