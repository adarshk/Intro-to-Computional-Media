import gab.opencv.*;
import org.opencv.imgproc.Imgproc;
import org.opencv.core.MatOfPoint2f;
import org.opencv.core.Point;
import org.opencv.core.Size;

import org.opencv.core.Mat;
import org.opencv.core.CvType;
import processing.video.*;


float temp=2.0;


OpenCV opencv,opencv2,opencv3;
PImage src,dst,canny,loaded,frontCamImage,frontCamImage2;
PImage card;
int cardWidth = 250;
int cardHeight = 350;
Capture cam,cam2,cam3;
int savedFrame=0;
int flag =0;
int pointFlag =0;
int contoursSize=0;
//PApplet parent;
PImage cardImage;
int u=0,v=0;
int swt=0;int swt2=0;
int cellSize = 15;
color pixelColor;

Contour contour,contour2,contour3;
ArrayList<Contour> contours;
ArrayList <PImage> cards;

void setup() {
  //src = loadImage("cards.png");
  //size(src.width + cardWidth, src.height);
  
  size(960,600,P3D);
  
  
  textureMode(NORMAL);
  //cardImage = loadImage("cards.png");
  
  String[] cameras = Capture.list();
  
  for(int i=0;i<cameras.length;i++){
  println(cameras[i]);
  }
  
  cam = new Capture(this,480,360,"Logitech Camera",30);
  cam2 = new Capture(this,320,240,"Logitech Camera #2",30);
  cam3 = new Capture(this,320,240);
  opencv = new OpenCV(this,cam);
  opencv2 = new OpenCV(this,cam2);
  opencv3 = new OpenCV(this,cam3);
  //opencv = new OpenCV(this, 640/2,height/2);
   
   //card = createImage(cardWidth, cardHeight, ARGB);  
   //card = createImage(640/2, height/2, ARGB);  

  cam.start();
  cam2.start();
  //cam3.start();
  
}

void draw() {
  
  background(255);

  opencv2.loadImage(cam2);
  //opencv3.loadImage(cam3);
  
 
  
  
  frontCamImage = opencv2.getInput();
  //image(frontCamImage,width/2-200,300);
  //frontCamImage = opencv2.getOutput();
  //frontCamImage = opencv2.getSnapshot();
  // frontCamImage2 = opencv3.getInput();
  //image(frontCamImage2,width/2+200,300);
   
  /*
  cam.loadPixels();
  
  for (int x = width/2; x < width/2 +1; x++) {
    for (int y = 0; y < 1; y++) {
      int index = x + y*cam.width;
  
              pixelColor = pixels[index];
  
    }
  }
   
   */
  opencv.loadImage(cam);
  opencv.contrast(0.5);
  image(cam, 0, 0);
  
  
  pushMatrix();
  opencv.findCannyEdges(20,75);
  opencv.blur(1);
  //opencv.threshold(120);
  opencv.threshold(150);
  //card = opencv.getOutput();
  dst = opencv.getOutput();
  contours = opencv.findContours(false,true);
  if(contours.size()>=2){
  contour = opencv.findContours(false, true).get(0).getPolygonApproximation();
  contour2 = opencv.findContours(false, true).get(1).getPolygonApproximation();
  contour3 = opencv.findContours(false, true).get(2).getPolygonApproximation();
  //dst = opencv.getSnapshot();
  
  
 
  //stroke(0, 255, 0);
   // contour.draw();
    contour2.draw();
   // contour3.draw();
    
    //stroke(255, 0, 0);
    //tint(255,126);
    ArrayList<PVector> points = contour.getPoints();
    ArrayList<PVector> points2 = contour2.getPoints();
  
    
    
    
    fill(0);
   strokeWeight(5);
  stroke(0);
    beginShape(QUAD);
    for (int i = 0; i < points2.size(); i++) {
    //text(i, points.get(i).x, points.get(i).y);
    //pointFlag++;
    if(i==0){u=0;v=0;}
    if(i==1){u=1;v=0;}
    if(i==2){u=1;v=1;}
    if(i==3){u=0;v=1;}
    vertex(points2.get(i).x, points2.get(i).y,u,v);
  }
    
    endShape();
    
    
    
    noStroke();
    noFill();
    pushMatrix();  
    translate(0,-50);
    //fill(0);
    //textureWrap(REPEAT);
   // textureMode(NORMAL);
    beginShape(QUAD);
   // pushMatrix();
    //scale(0.1);
    //texture(frontCamImage);
    //image()
   // popMatrix();
    
    
    
    //println("points size -" + points.size());
    for (int i = 0; i < points2.size(); i++) {
    //text(i, points.get(i).x, points.get(i).y);
    //pointFlag++;
    if(i==0){u=0;v=0;}
    if(i==1){u=1;v=0;}
    if(i==2){u=1;v=1;}
    if(i==3){u=0;v=1;}
    vertex(points2.get(i).x, points2.get(i).y,u,v);
  }
    
    endShape();
    
    popMatrix();
    
    //noFill();
    
    if(swt==1){
    
      
     
   
  
  
 
  
  }  
    
  }

    
    
    //image(dst,width/2,0);
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



 void mousePressed(){

    

  }

