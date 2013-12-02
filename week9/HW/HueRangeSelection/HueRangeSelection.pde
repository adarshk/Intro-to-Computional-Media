import gab.opencv.*;
import org.opencv.imgproc.Imgproc;
import org.opencv.core.MatOfPoint2f;
import org.opencv.core.Point;
import org.opencv.core.Size;

import org.opencv.core.Mat;
import org.opencv.core.CvType;
import processing.video.*;
import java.awt.Rectangle;

PImage img;
PImage camGrab;
OpenCV opencv,opencvCam;
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
  
  //image(cam, 0, 0);  
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

