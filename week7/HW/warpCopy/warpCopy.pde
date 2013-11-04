import gab.opencv.*;
import org.opencv.imgproc.Imgproc;
import org.opencv.core.MatOfPoint2f;
import org.opencv.core.Point;
import org.opencv.core.Size;

import org.opencv.core.Mat;
import org.opencv.core.CvType;
import processing.video.*;


PImage label;
PShape can;
float angle;

PShader texShader;

OpenCV opencv,opencv2;
PImage src,dst,canny,loaded,frontCamImage;
PImage card;
int cardWidth = 250;
int cardHeight = 350;
Capture cam,cam2;
int savedFrame=0;
int flag =0;
int pointFlag =0;
int contoursSize=0;
//PApplet parent;
PImage cardImage;

Contour contour;
ArrayList<Contour> contours;
ArrayList <PImage> cards;

void setup() {
  //src = loadImage("cards.png");
  //size(src.width + cardWidth, src.height);
  
  size(960,960,P3D);
  textureMode(NORMAL);
  cardImage = loadImage("cards.png");
  
  String[] cameras = Capture.list();
  
  for(int i=0;i<cameras.length;i++){
  println(cameras[i]);
  }
  
  cam = new Capture(this,640/2,240,"Logitech Camera #2",30);
  cam2 = new Capture(this,320,240,"Logitech Camera",30);
  //cam2 = new Capture(this,640,480);
  opencv = new OpenCV(this,cam);
  opencv2 = new OpenCV(this,cam2);
  //opencv = new OpenCV(this, 640/2,height/2);
   
   //card = createImage(cardWidth, cardHeight, ARGB);  
   //card = createImage(640/2, height/2, ARGB); 
  
  
  label = loadImage("lachoy.jpg");
  can = createCan(100, 200, 32, label);
  texShader = loadShader("texfrag.glsl", "texvert.glsl"); 

  cam.start();
  cam2.start();
  
}

Mat getPerspectiveTransformation(ArrayList<PVector> inputPoints, int w, int h) {
  Point[] canonicalPoints = new Point[4];
  canonicalPoints[0] = new Point(w, 0);
  canonicalPoints[1] = new Point(0, 0);
  canonicalPoints[2] = new Point(0, h);
  canonicalPoints[3] = new Point(w, h);

  MatOfPoint2f canonicalMarker = new MatOfPoint2f();
  canonicalMarker.fromArray(canonicalPoints);

  Point[] points = new Point[4];
  for (int i = 0; i < 4; i++) {
    points[i] = new Point(inputPoints.get(i).x, inputPoints.get(i).y);
  }
  MatOfPoint2f marker = new MatOfPoint2f(points);
  return Imgproc.getPerspectiveTransform(marker, canonicalMarker);
}

Mat warpPerspective(ArrayList<PVector> inputPoints, int w, int h) {
  Mat transform = getPerspectiveTransformation(inputPoints, w, h);
  Mat unWarpedMarker = new Mat(w, h, CvType.CV_8UC1);    
  Imgproc.warpPerspective(opencv.getColor(), unWarpedMarker, transform, new Size(w, h));
  println("here");
  return unWarpedMarker;
}


void draw() {
  background(0);
  
  opencv2.loadImage(cam2);
  
  
  frontCamImage = opencv2.getInput();
  image(frontCamImage,0,240);
  //frontCamImage = opencv2.getOutput();
  //frontCamImage = opencv2.getSnapshot();
   
  opencv.loadImage(cam);
  image(cam, 0, 0);
  pushMatrix();
  opencv.blur(1);
  //opencv.threshold(120);
  opencv.threshold(150);
  //card = opencv.getOutput();
  dst = opencv.getOutput();
  contours = opencv.findContours(false,true);
  if(contours.size()>0){
  contour = opencv.findContours(false, true).get(0).getPolygonApproximation();
  //dst = opencv.getSnapshot();
  
  
  
  stroke(0, 255, 0);
    contour.draw();
    
    stroke(255, 0, 0);
    //tint(255,126);
    ArrayList<PVector> points = contour.getPoints();
    //textureWrap(REPEAT);
    
    beginShape(QUAD);
    pushMatrix();
    //scale(0.1);
    texture(frontCamImage);
    //image()
    popMatrix();
    
    /*
    for (int i = 0; i < points.size(); i++) {
    //text(i, points.get(i).x, points.get(i).y);
    vertex(points.get(i).x, points.get(i).y);
  }*/
    
    for (PVector point : contour.getPolygonApproximation().getPoints()) {
     // pointFlag++;
      vertex(point.x, point.y);
    }
    
    //println("point flags - "+ pointFlag);
    endShape();
  }
  
  pointFlag=0;
  /*
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
  */
  
   /*
  if(contours.size()>0){contoursSize=1;println("found " + contours.size() + " contours");}
  
  
  if(contoursSize>0){
  contour = opencv.findContours(false, true).get(0).getPolygonApproximation();
  
 
  
  ArrayList<PVector> inputPoints = contour.getPoints();
  println("found " + contour.getPoints() + " points");
  
  Mat returnedImage = warpPerspective(inputPoints, cardWidth, cardHeight);
  println(" channels - " + returnedImage.channels());
  
  card.loadPixels();
  
  if(returnedImage.channels() == 4){
        byte[] matPixels = new byte[width*height*4];
        returnedImage.get(0,0, matPixels);
        for(int i = 0; i < returnedImage.width()*returnedImage.height()*4; i+=4){          
          //card.pixels[this.floor(i/4)] = this.color(matPixels[i+2]&0xFF, matPixels[i+1]&0xFF, matPixels[i]&0xFF, matPixels[i+3]&0xFF);
        }
      }
      
      card.updatePixels();
  
  //opencv.toPImage(returnedImage, new PImage);
  
  //opencv.toPImage(warpPerspective(inputPoints, cardWidth, cardHeight), card);
  //println("found " + contours.size() + " contours");
  }
  */
  
  //contour = contours.getPolygonApproximation;
  
  //for(int df=0;df<1;df++){
  //  contours[df]
  //}
  
  //for (Contour contour : contours) {
  //println("Points - "+contour.getPoints());
  
  /*
  
  //contours.add(opencv.findContours(false, true).get(0).getPolygonApproximation());
  contours = opencv.findContours(false, true);
  println("found " + contours.size() + " contours");
 
  
  //for (Contour contour : contours) {
  //opencv.toPImage(warpPerspective(contour.getPoints(), cardWidth, cardHeight), card);

  
  
  noFill(); 
  stroke(0, 255, 0); 
  strokeWeight(4);
  contour.draw();
  fill(255, 0);
  ArrayList<PVector> points = contour.getPoints();
  for (int i = 0; i < points.size(); i++) {
    text(i, points.get(i).x, points.get(i).y);
  }

  pushMatrix();
  translate(640, 0);
  image(card, 0, 0);
  popMatrix();
  
  flag++;
  image(cam, 0, 0);
  
  */
  
    //}
    
   /* 
    shader(texShader);  
    
  translate(width/2, height/2);
  rotateY(angle);  
  shape(can);  
  angle += 0.01;
   */ 
    image(dst,width/2,0);
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


PShape createCan(float r, float h, int detail, PImage tex) {
  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  sh.noStroke();
  sh.texture(tex);
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float z = cos(i * angle);
    float u = float(i) / detail;
    sh.normal(x, 0, z);
    sh.vertex(x * r, -h/2, z * r, u, 0);
    sh.vertex(x * r, +h/2, z * r, u, 1);    
  }
  sh.endShape(); 
  return sh;
}
