import processing.serial.*;
Serial myPort;

import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;
void setup()
{
  //frameRate(10);
  myPort = new Serial(this, Serial.list()[5], 9600);
  
   oscP5 = new OscP5(this,8000);
   myRemoteLocation = new NetAddress("127.0.0.1",5001);
}

void draw()
{
  //myPort.write("0");
  //delay(10);
}

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  
  if(theOscMessage.checkAddrPattern("/trigger/speaker")==true) {
  //  String thirdValue = theOscMessage.get(0).stringValue();
 // println("mouse button received - "+thirdValue);
 println("speaker received");
  }
  
  if(theOscMessage.checkAddrPattern("/trigger/motor")==true) {
    println("motor received");
    //myPort.write("1");
  }
  
  if(theOscMessage.checkAddrPattern("/trigger/led")==true) {
  println("led received");
  myPort.write("0");
  }
  
  //if(theOscMessage.addrPattern() == "/mouse/button"){
    
  //arduino.digitalWrite(2,Arduino.HIGH);
  //}
}
