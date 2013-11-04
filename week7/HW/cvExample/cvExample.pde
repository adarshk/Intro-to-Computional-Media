import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
PImage src, canny, scharr, sobel;
Capture cam,cam2;
int savedFrame=0;

void setup() {
  //src = loadImage("test.jpg");
  //size(src.width, src.height, P2D);
  size(640,480);
  String[] cameras = Capture.list();
  
  for(int i=0;i<cameras.length;i++){
  println(cameras[i]);
  }
  
  
  cam = new Capture(this,640,480,"Logitech Camera",30);
  opencv = new OpenCV(this, 640,480);
  cam.start();
  
  /*
  opencv.findCannyEdges(20,75);
  canny = opencv.getSnapshot();
  
  opencv.loadImage(src);
  opencv.findScharrEdges(OpenCV.HORIZONTAL);
  scharr = opencv.getSnapshot();
  
  opencv.loadImage(src);
  opencv.findSobelEdges(1,0);
  sobel = opencv.getSnapshot();
  */
}


void draw() {
  
  //if (cam.available() == true) {
  //  cam.read();
  //}
  
  opencv.loadImage(cam);
  opencv.findCannyEdges(20,21);
  canny = opencv.getSnapshot();
  //image(canny, 0, 0);
  
  image(cam,0,0);
  
  
  /*
  pushMatrix();
  scale(0.5);
  image(src, 0, 0);
  image(canny, src.width, 0);
  image(scharr, 0, src.height);
  image(sobel, src.width, src.height);
  popMatrix();

  text("Source", 10, 25); 
  text("Canny", src.width/2 + 10, 25); 
  text("Scharr", 10, src.height/2 + 25); 
  text("Sobel", src.width/2 + 10, src.height/2 + 25);
*/

}

void captureEvent(Capture video){

  video.read();

}


void keyPressed(){

  if(key == 's'){saveFrame(savedFrame + ".png");
    savedFrame++;
    }

}

