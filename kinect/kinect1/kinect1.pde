import SimpleOpenNI.*;
import controlP5.*;

SimpleOpenNI kinect;
ControlP5 GUI;

float nearThreshold, farThreshold;

void setup() {

  size(640, 480, P2D);
  

  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  kinect.setMirror(true);
  
  
  kinect.enableHand();
  kinect.startGesture(SimpleOpenNI.GESTURE_WAVE);

  nearThreshold = 1445;
  farThreshold = 2500;
  GUI = new ControlP5(this);
  GUI.addSlider("nearThreshold").setPosition(10,10).setRange(0,8000);
  GUI.addSlider("farThreshold").setPosition(10,30).setRange(0,8000);
}


void draw() {

  background(255);

  //returns new pixels
  kinect.update();

  int[] depth = kinect.depthMap();
  
  float sumX=0,sumY=0,totalDepth=0;
  int count=0;

  loadPixels();
  for (int x=0;x<640;x++) {
    for (int y=0;y<480;y++) {

      int rawDepth = depth[x+y*640];

      if (rawDepth>nearThreshold && rawDepth <farThreshold) {
      pixels[x+y*640] = color(0,200,40);
      
      sumX +=x;
      sumY +=y;
      totalDepth +=rawDepth;
      count++;
      
      }

      else {
        
        pixels[x+y*640] = kinect.depthImage().pixels[x+y*640];
      }
    }
  }
  
  updatePixels();
  
  float newX = sumX/count;
  float newY = sumY/count;
  float averageDepth = totalDepth/count;
  
  noStroke();
  fill(0,50,255,150);
  ellipse(newX,newY,50,50);
  ellipse(newX,newY,10,10);
  
  
  loadPixels();
  
  for (int x=0;x<640;x++) {
    for (int y=0;y<480;y++) {

      int rawDepth = depth[x+y*640];

      if (rawDepth>averageDepth && rawDepth <averageDepth+10) {
      pixels[x+y*640] = color(0,200,40);
     
      
      }

      else {
        
        pixels[x+y*640] = kinect.depthImage().pixels[x+y*640];
      }
    }
  }
 
 updatePixels();
  
}


void initGUI(){


}

void onTrackedHand(SimpleOpenNI curContext,int handId,PVector pos)
{
  println("onTrackedHand - handId: " + handId + ", pos: " + pos );
  
 
}


void onLostHand(SimpleOpenNI curContext,int handId)
{
  println("onLostHand - handId: " + handId);
  
}



void onCompletedGesture(SimpleOpenNI curContext,int gestureType, PVector pos)
{
  println("onCompletedGesture - gestureType: " + gestureType + ", pos: " + pos);
  
  int handId = kinect.startTrackingHand(pos);
  println("hand stracked: " + handId);
}



// -----------------------------------------------------------------
// Keyboard event
void keyPressed()
{

  switch(key)
  {
  case ' ':
    kinect.setMirror(!kinect.mirror());
    break;
  case '1':
    kinect.setMirror(true);
    break;
  case '2':
    kinect.setMirror(false);
    break;
  }
}
