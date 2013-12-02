import librarytests.*;
import org.openkinect.*;
import org.openkinect.processing.*;


void setup(){
 
 Kinect k = new Kinect(this);
 k.start();
 k.tilt(15);
  
}

