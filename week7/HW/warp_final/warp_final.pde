import gab.opencv.*;
import org.opencv.imgproc.Imgproc;
import org.opencv.core.MatOfPoint2f;
import org.opencv.core.Point;
import org.opencv.core.Size;

import org.opencv.core.Mat;
import org.opencv.core.CvType;
import processing.video.*;

import toxi.physics2d.constraints.*;
import toxi.physics.*;
import toxi.physics.constraints.*;
import toxi.physics2d.behaviors.*;
//import toxi.physics.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;

VerletPhysics2D physics;
Particle p1;
Particle p2;
float temp=2.0;

ArrayList<Particle> particles;
BaseRepel repeller;
//Speaker speaker;
AttractionBehavior mouseAttractor;
Vec2D mousePos;

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
int u=0,v=0;
int swt=0;int swt2=0;

Contour contour;
ArrayList<Contour> contours;
ArrayList <PImage> cards;

void setup() {
  //src = loadImage("cards.png");
  //size(src.width + cardWidth, src.height);
  
  size(960,600,P3D);
  
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height-20));
  physics.setDrag(0.05f);
  //physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));
  particles = new ArrayList<Particle>();
  
  repeller = new BaseRepel(new Vec2D(0,height-20));
  
  
  textureMode(NORMAL);
  //cardImage = loadImage("cards.png");
  
  String[] cameras = Capture.list();
  
  for(int i=0;i<cameras.length;i++){
  println(cameras[i]);
  }
  
  cam = new Capture(this,480,360,"Logitech Camera",30);
  cam2 = new Capture(this,320,240,"Logitech Camera #2",30);
  //cam2 = new Capture(this,640,480);
  opencv = new OpenCV(this,cam);
  opencv2 = new OpenCV(this,cam2);
  //opencv = new OpenCV(this, 640/2,height/2);
   
   //card = createImage(cardWidth, cardHeight, ARGB);  
   //card = createImage(640/2, height/2, ARGB);  

  cam.start();
  cam2.start();
  
}

void draw() {
  
  background(255);
  physics.update();
  opencv2.loadImage(cam2);
  
   for(Particle p:particles){
     p.borderCheck();
     p.display();
  }
  
  
  frontCamImage = opencv2.getInput();
  image(frontCamImage,width/2-150,300);
  //frontCamImage = opencv2.getOutput();
  //frontCamImage = opencv2.getSnapshot();
   
  opencv.loadImage(cam);
  image(cam, 0, 0);
  pushMatrix();
  opencv.findCannyEdges(20,75);
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
    textureMode(NORMAL);
    beginShape(QUAD);
    pushMatrix();
    //scale(0.1);
    texture(frontCamImage);
    //image()
    popMatrix();
    
    
    //println("points size -" + points.size());
    for (int i = 0; i < points.size(); i++) {
    //text(i, points.get(i).x, points.get(i).y);
    //pointFlag++;
    if(i==0){u=0;v=0;}
    if(i==1){u=1;v=0;}
    if(i==2){u=1;v=1;}
    if(i==3){u=0;v=1;}
    vertex(points.get(i).x, points.get(i).y,u,v);
  }
    
    endShape();
    
    if(swt==1){
    
      
     
   
  
  
  
  frontCamImage.loadPixels();
  
      for (int x = 0; x < frontCamImage.width; x++) {
    for (int y = 0; y < frontCamImage.height; y++) {
      int index = x+ y*width;
      particles.add(new Particle(new Vec2D(x+width/2-150,y+300))); 
      
      
    }
      }
  
  
  frontCamImage.updatePixels();
  
  }  
    
  }
  
  pointFlag=0;
  
    
    
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



 void mousePressed(){

    //particles.add(new Particle(new Vec2D(mouseX,mouseY)));
    //swt=1;
    mousePos = new Vec2D(mouseX,mouseY);
    mouseAttractor = new AttractionBehavior(mousePos,250,0.9f);
    physics.addBehavior(mouseAttractor);


  }

  void mouseReleased(){

  physics.removeBehavior(mouseAttractor);

  }

  void mouseDragged(){
  mousePos.set(mouseX,mouseY);
  
  }

