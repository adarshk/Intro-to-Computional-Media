/*
arduino_output

Demonstrates the control of digital pins of an Arduino board running the
StandardFirmata firmware.  Clicking the squares toggles the corresponding
digital pin of the Arduino.  

To use:
* Using the Arduino software, upload the StandardFirmata example (located
  in Examples > Firmata > StandardFirmata) to your Arduino board.
* Run this sketch and look at the list of serial ports printed in the
  message area below. Note the index of the port corresponding to your
  Arduino board (the numbering starts at 0).  (Unless your Arduino board
  happens to be at index 0 in the list, the sketch probably won't work.
  Stop it and proceed with the instructions.)
* Modify the "arduino = new Arduino(...)" line below, changing the number
  in Arduino.list()[0] to the number corresponding to the serial port of
  your Arduino board.  Alternatively, you can replace Arduino.list()[0]
  with the name of the serial port, in double quotes, e.g. "COM5" on Windows
  or "/dev/tty.usbmodem621" on Mac.
* Run this sketch and click the squares to toggle the corresponding pin
  HIGH (5 volts) and LOW (0 volts).  (The leftmost square corresponds to pin
  13, as if the Arduino board were held with the logo upright.)
  
For more information, see: http://playground.arduino.cc/Interfacing/Processing
*/

import processing.serial.*;

import cc.arduino.*;

import oscP5.*;
import netP5.*;
  
OscP5 oscP5;

Arduino arduino;
Serial myPort;

void setup() {
  size(470, 200);
  
  oscP5 = new OscP5(this,8000);
  
  // Prints out the available serial ports.
  println(Arduino.list());
  myPort = new Serial(this,Serial.list()[4],9600);
  
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[4], 57600);
  
  // Alternatively, use the name of the serial port corresponding to your
  // Arduino (in double-quotes), as in the following line.
  //arduino = new Arduino(this, "/dev/tty.usbmodem1421", 57600);
  
  // Set the Arduino digital pins as outputs.
  
  //for (int i = 0; i <= 53; i++)
    for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.OUTPUT);
    
    //arduino.pinMode(2, Arduino.OUTPUT);
    arduino.digitalWrite(12,Arduino.HIGH);
    arduino.digitalWrite(2,Arduino.HIGH);
    
    noLoop();
    
}

void draw() {
//  background(off);
  //for (int i = 0; i <= 53; i++)
  //for (int i = 0; i <= 13; i++)
  arduino.digitalWrite(2,Arduino.HIGH);
  
  
}

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  if(theOscMessage.addrPattern() == "/mouse/button"){
  //arduino.digitalWrite(2,Arduino.HIGH);
  }
}

void mousePressed(){
  
 myPort.write(4); 
}
