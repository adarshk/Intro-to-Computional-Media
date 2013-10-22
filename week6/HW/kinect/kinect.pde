import SimpleOpenNI.*;
import java.util.Map;
import java.util.Iterator;


SimpleOpenNI kinect;


void setup() {

  size(640, 480, P2D);
  
  kinect = new SimpleOpenNI(this);
  if(kinect.isInit() == false)
  {
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  }   
  
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  kinect.setMirror(true);


  kinect.enableHand();
  kinect.startGesture(SimpleOpenNI.GESTURE_WAVE);  
}


void draw(){

  kinect.update();
  
   image(kinect.depthImage(),0,0);


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
