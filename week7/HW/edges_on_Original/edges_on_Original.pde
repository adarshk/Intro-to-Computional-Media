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
  //src = loadImage("test.jpg"); 
  //size(width,height, P2D);
  cam = new Capture(this,width/2,height/2,"Logitech Camera",30);
  opencv = new OpenCV(this, width/2,height/2);
  dst = createImage(width/2,height/2,ARGB);
  //opencv.startBackgroundSubtraction(5, 3, 0.5);
  
  cam.start();

 
}

void draw() {
  
  
  //pushMatrix();
  //scale(0.5);
  
  
  opencv.loadImage(cam);
  src = opencv.getSnapshot();
  opencv.findCannyEdges(20,75);
  canny = opencv.getSnapshot();
  
  
  src.loadPixels();
  canny.loadPixels();
  
   for(int x=0;x<src.width;x++){
     for(int y=0;y<src.height;y++){
       int index = x+ y*src.width;
     
       if(canny.pixels[index] == color(255))
        src.pixels[index] = canny.pixels[index];
       
     }
  }
  
  src.updatePixels();
  image(src,0,0);
  image(canny,width/2,0);
 // popMatrix();
  
  
}

void captureEvent(Capture video){

  video.read();

}


void keyPressed(){

  if(key == 's'){saveFrame(savedFrame + ".png");
    savedFrame++;
    }

}
