import gab.opencv.*;
import org.opencv.imgproc.Imgproc;
import org.opencv.core.MatOfPoint2f;
import org.opencv.core.Point;
import org.opencv.core.Size;

import org.opencv.core.Mat;
import org.opencv.core.CvType;
import processing.video.*;


OpenCV opencv;

ArrayList<Contour> contours;
ArrayList<Contour> polygons;

Capture cam;
PImage firstCam;

Histogram histogram;

int lowerb = 75;
int upperb = 180;

void setup(){
  
 
 size(960,720,P3D);
 
 String[] cameras = Capture.list();
  
  
  for(int i=0;i<cameras.length;i++){
  println(cameras[i]);
  }
  
  //cam = new Capture(this,480,360,"Logitech Camera",30);
  cam = new Capture(this,480,320);
  opencv = new OpenCV(this,cam);
  opencv.useColor(HSB);
  
  
  
  cam.start();
  
}


void draw(){
  
 // background(0);
  
  image(cam,0,0);
  opencv.loadImage(cam);
  //secondCam = opencv2.getOutput();
  
  
   opencv.setGray(opencv.getH().clone());
  opencv.inRange(lowerb, upperb);
  //histogram = opencv.findHistogram(opencv.getH(), 100);

  image(opencv.getOutput(), 480,0,width/2,height/2);
  
}


void captureEvent(Capture video){

  video.read();

}
