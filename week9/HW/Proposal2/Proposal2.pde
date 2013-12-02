import gab.opencv.*;
import org.opencv.imgproc.Imgproc;
import org.opencv.core.MatOfPoint2f;
import org.opencv.core.Point;
import org.opencv.core.Size;

import org.opencv.core.Mat;
import org.opencv.core.CvType;
import processing.video.*;
import java.awt.Rectangle;

import org.opencv.imgproc.Imgproc;
import org.opencv.core.Core;

import org.opencv.core.Mat;
import org.opencv.core.MatOfPoint;
import org.opencv.core.MatOfPoint2f;
import org.opencv.core.MatOfPoint2f;
import org.opencv.core.CvType;

import org.opencv.core.Point;
import org.opencv.core.Size;

PImage img;
PImage camGrab;
OpenCV opencv,opencvCam,opencv2;
Histogram histogram;
Capture cam;

int lowerb = 65;
int upperb = 110;
ArrayList<Contour> contours;

ArrayList<Contour> polygons;
Contour contour;
int u=0,v=0;
Rectangle r;
float wd,ht;
int size = 80;
int num =0;


PImage  src, dst, markerImg;
ArrayList<MatOfPoint> contours2;
ArrayList<MatOfPoint2f> approximations;
ArrayList<MatOfPoint2f> markers;

boolean[][] markerCells;


void setup() {
  
  // String[] cameras = Capture.list();
  
 /* for(int i=0;i<cameras.length;i++){
  println(cameras[i]);
  }
  */
  cam = new Capture(this,480,360,"Logitech Camera",30);
  //cam = new Capture(this,480,320);
  //opencvCam = new OpenCV(this,cam);
  r = new Rectangle();
  size(800, 600, P2D);
  
  //img = loadImage("colored_balls.jpg");
  opencv = new OpenCV(this, cam);
  cam.start();
 
 
opencv2 = new OpenCV(this, "marker_test.jpg");
  size(opencv2.width, opencv2.height/2);
  src = opencv2.getInput();

  // hold on to this for later, since adaptiveThreshold is destructive
  Mat gray = opencv2.imitate(opencv2.getGray());
  opencv2.getGray().copyTo(gray);

  Mat thresholdMat = opencv2.imitate(opencv2.getGray());

  opencv2.blur(5);
  
  Imgproc.adaptiveThreshold(opencv2.getGray(), thresholdMat, 255, Imgproc.ADAPTIVE_THRESH_GAUSSIAN_C, Imgproc.THRESH_BINARY_INV, 451, -65);

  contours2 = new ArrayList<MatOfPoint>();
  Imgproc.findContours(thresholdMat, contours2, new Mat(), Imgproc.RETR_LIST, Imgproc.CHAIN_APPROX_NONE);

  approximations = createPolygonApproximations(contours2);

  markers = new ArrayList<MatOfPoint2f>();
  markers = selectMarkers(approximations);

  //// Mat markerMat = grat.submat();
  //  Mat warped = opencv2Pro.imitate(gray);
  //  
  MatOfPoint2f canonicalMarker = new MatOfPoint2f();
  Point[] canonicalPoints = new Point[4];
  canonicalPoints[0] = new Point(0, 350);
  canonicalPoints[1] = new Point(0, 0);
  canonicalPoints[2] = new Point(350, 0);
  canonicalPoints[3] = new Point(350, 350);
  canonicalMarker.fromArray(canonicalPoints);

  println("num points: " + markers.get(0).height());

  Mat transform = Imgproc.getPerspectiveTransform(markers.get(0), canonicalMarker);
  Mat unWarpedMarker = new Mat(50, 50, CvType.CV_8UC1);  
  Imgproc.warpPerspective(gray, unWarpedMarker, transform, new Size(350, 350));


  Imgproc.threshold(unWarpedMarker, unWarpedMarker, 125, 255, Imgproc.THRESH_BINARY | Imgproc.THRESH_OTSU);

  float cellSize = 350/7.0;

  markerCells = new boolean[7][7];

  for (int row = 0; row < 7; row++) {
    for (int col = 0; col < 7; col++) {
      int cellX = int(col*cellSize);
      int cellY = int(row*cellSize);

      Mat cell = unWarpedMarker.submat(cellX, cellX +(int)cellSize, cellY, cellY+ (int)cellSize); 
      markerCells[row][col] = (Core.countNonZero(cell) > (cellSize*cellSize)/2);
    }
  }

  for (int col = 0; col < 7; col++) {
    for (int row = 0; row < 7; row++) {
      if (markerCells[row][col]) {
        print(1);
      } 
      else {
        print(0);
      }
    }
    println();
  }

  dst  = createImage(350, 350, RGB);
  opencv2.toPImage(unWarpedMarker, dst);
}
  


void draw() {
  
  background(255);
   //pushMatrix();
  //opencvCam.loadImage(cam);
  opencv.useColor(RGB);
  image(opencv.getSnapshot(), 0, 0);

//popMatrix();
    pushMatrix();
  opencv.loadImage(cam);
    
  opencv.useColor(HSB);
  opencv.setGray(opencv.getH().clone());
  opencv.inRange(lowerb, upperb);
  histogram = opencv.findHistogram(opencv.getH(), 255);

  image(opencv.getOutput(), 3*width/4, 3*height/4, width/4,height/4);

  //opencv.gray();
  //opencv.threshold(70);
  //camGrab = opencv.getOutput();

  contours = opencv.findContours(false,true);
  println("found " + contours.size() + " contours");
  
  if(contours.size()>=2){
   
 
    contour = opencv.findContours(false, true).get(0).getPolygonApproximation();
    r = contour.getBoundingBox();
    wd = r.width;
    ht = r.height;
    noFill();
    stroke(255,0,0);
    strokeWeight(5);
    //contour.draw();
    
    
    
    ArrayList<PVector> points = contour.getPoints();
    println("Number of Points - "+contour.numPoints());
    
    float px1 = points.get(0).x;
    float py1 = points.get(0).y;
    float px2 = points.get(int(contour.numPoints()/3)).x;
    float py2 = points.get(int(contour.numPoints()/3)).y;
   float px3 = points.get(int(2*contour.numPoints()/3)).x;
    float py3 = points.get(int(2*contour.numPoints()/3)).y;
    float px4 = points.get(contour.numPoints()-1).x;
    float py4 = points.get(contour.numPoints()-1).y;
    
    ellipse((px1+px2+px3+px4)/4,(py1+py2+py3+py4)/4,5,5);
    

    
    switch(num){
     case 1:
     text("Text",(px1+px2+px3+px4)/4,(py1+py2+py3+py4)/4);
     break;
     
     case 2:
     text("Sound",(px1+px2+px3+px4)/4,(py1+py2+py3+py4)/4);
     break;
     
     case 3:
     text("Image",(px1+px2+px3+px4)/4,(py1+py2+py3+py4)/4);
     break;
      
    }
    
    
    pushMatrix();
    translate(-250,0);
        float posx = (px1+px2+px3+px4)/4;
    float posy = (py1+py2+py3+py4)/4;
    if(posx>700 && posx<800 && posy>100 && posy<180)
    num = 1;
    
    
    
    fill(85,63,91);
    noStroke();
    ellipse(700,100,80,80);
    noFill();
    strokeWeight(1);
    stroke(85,63,91);
    //ellipse(700,100,size,size);
    size=size+1;
    if(size>150)size=80;
    fill(255);
    textSize(16);
    text("Text",680,105);
    
    
    fill(192,85,234);
    noStroke();
    ellipse(700,200,80,80);
    noFill();
    strokeWeight(1);
    stroke(192,85,234);
    ellipse(700,200,size,size);
    size=size+1;
    if(size>150)size=80;
    fill(255);
    textSize(16);
    text("Sound",680,205);
    
    fill(241,245,47);
    noStroke();
    ellipse(700,300,80,80);
    noFill();
    strokeWeight(1);
    stroke(241,245,47);
    //ellipse(700,300,size,size);
    size=size+1;
    if(size>150)size=80;
    fill(255);
    textSize(16);
    text("Image",680,305);
    
    popMatrix();
//    ellipse();
    
    /*
    noFill();
   strokeWeight(5);
  stroke(255,0,0);
    beginShape();
    for (int i = 0; i < points.size(); i++) {
    //text(i, points.get(i).x, points.get(i).y);
    //pointFlag++;
    if(i==0){u=0;v=0;}
    if(i==1){u=1;v=0;}
    if(i==2){u=1;v=1;}
    if(i==3){u=0;v=1;}
    vertex(points.get(i).x, points.get(i).y,u,v);
  }
  */
  
  }
  
  /*
  
  noStroke(); fill(0);
  histogram.draw(10, height - 230, 400, 200);
  noFill(); stroke(0);
  line(10, height-30, 410, height-30);

  text("Hue", 10, height - (textAscent() + textDescent()));

  float lb = map(lowerb, 0, 255, 0, 400);
  float ub = map(upperb, 0, 255, 0, 400);

  stroke(255, 0, 0); fill(255, 0, 0);
  strokeWeight(2);
  line(lb + 10, height-30, ub +10, height-30);
  ellipse(lb+10, height-30, 3, 3 );
  text(lowerb, lb-10, height-15);
  ellipse(ub+10, height-30, 3, 3 );
  text(upperb, ub+10, height-15);
  opencv.useColor(HSB);
  */
  popMatrix();
  
  
    pushMatrix();
  background(125);
  scale(0.5);
  image(src, 0, 0);

  noFill();
  smooth();
  strokeWeight(5);
  stroke(0, 255, 0);
  drawcontours22f(markers);  
  popMatrix();

  pushMatrix();
  translate(src.width/2, 0);
  strokeWeight(1);
  image(dst, 0, 0);

  float cellSize = dst.width/7.0;
  for (int col = 0; col < 7; col++) {
    for (int row = 0; row < 7; row++) {
      if(markerCells[row][col]){
        fill(255);
      } else {
        fill(0);
      }
      stroke(0,255,0);
      rect(col*cellSize, row*cellSize, cellSize, cellSize);
      //line(i*cellSize, 0, i*cellSize, dst.width);
    //line(0, i*cellSize, dst.width, i*cellSize);
    }
  }

  popMatrix();
 
 
  
}

void mouseMoved() {
 /*
  if (keyPressed) {
    upperb += mouseX - pmouseX;
  } 
  else {
    if (upperb < 255 || (mouseX - pmouseX) < 0) {
      lowerb += mouseX - pmouseX;
    }

    if (lowerb > 0 || (mouseX - pmouseX) > 0) {
      upperb += mouseX - pmouseX;
    }
  }

  upperb = constrain(upperb, lowerb, 255);
  lowerb = constrain(lowerb, 0, upperb-1);
  */
  
}



ArrayList<MatOfPoint2f> selectMarkers(ArrayList<MatOfPoint2f> candidates) {
  float minAllowedcontours2ide = 50;
  minAllowedcontours2ide = minAllowedcontours2ide * minAllowedcontours2ide;

  ArrayList<MatOfPoint2f> result = new ArrayList<MatOfPoint2f>();

  for (MatOfPoint2f candidate : candidates) {

    if (candidate.size().height != 4) {
      continue;
    } 

    if (!Imgproc.isContourConvex(new MatOfPoint(candidate.toArray()))) {
      continue;
    }

    // eliminate markers where consecutive
    // points are too close together
    float minDist = src.width * src.width;
    Point[] points = candidate.toArray();
    for (int i = 0; i < points.length; i++) {
      Point side = new Point(points[i].x - points[(i+1)%4].x, points[i].y - points[(i+1)%4].y);
      float squaredLength = (float)side.dot(side);
      // println("minDist: " + minDist  + " squaredLength: " +squaredLength);
      minDist = min(minDist, squaredLength);
    }

    //  println(minDist);


    if (minDist < minAllowedcontours2ide) {
      continue;
    }

    result.add(candidate);
  }

  return result;
}

ArrayList<MatOfPoint2f> createPolygonApproximations(ArrayList<MatOfPoint> cntrs) {
  ArrayList<MatOfPoint2f> result = new ArrayList<MatOfPoint2f>();

  double epsilon = cntrs.get(0).size().height * 0.01;
  println(epsilon);

  for (MatOfPoint contour : cntrs) {
    MatOfPoint2f approx = new MatOfPoint2f();
    Imgproc.approxPolyDP(new MatOfPoint2f(contour.toArray()), approx, epsilon, true);
    result.add(approx);
  }

  return result;
}

void drawcontours2(ArrayList<MatOfPoint> cntrs) {
  for (MatOfPoint contour : cntrs) {
    beginShape();
    Point[] points = contour.toArray();
    for (int i = 0; i < points.length; i++) {
      vertex((float)points[i].x, (float)points[i].y);
    }
    endShape();
  }
}

void drawcontours22f(ArrayList<MatOfPoint2f> cntrs) {
  for (MatOfPoint2f contour : cntrs) {
    beginShape();
    Point[] points = contour.toArray();

    for (int i = 0; i < points.length; i++) {
      vertex((float)points[i].x, (float)points[i].y);
    }
    endShape(CLOSE);
  }
}
