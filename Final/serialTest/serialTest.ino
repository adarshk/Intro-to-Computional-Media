#include <Servo.h>      // include the servo library

Servo servoMotor;       // creates an instance of the servo object to control a servo
int servoPin = 3;       // Control pin for servo motor

int pin =12;
int incomingByte = 0;
int flag=0;
int ser=0;

void setup()
{
  Serial.begin(9600);
  //servoMotor.attach(servoPin);
  pinMode(12,OUTPUT);
  Serial.setTimeout(1000);
}

void loop(){
  flag++;
  if (Serial.available() > 0) {
  //if(Serial.read()==48){
    incomingByte = Serial.read();
    
  
  Serial.println(incomingByte,DEC);
  //if(flag%100==0){
  digitalWrite(pin,HIGH);
  //}
  //digitalWrite(pin,LOW);
  
  
  
//  else{
//  digitalWrite(pin,LOW);
//  }
  
//servoMotor.write(ser);  
  }
if(ser==179)
ser=0;

if(flag==1000){
  ser++;
  flag=0;
}  
  //digitalWrite(2,LOW); 
  
//  else{
//   digitalWrite(2,HIGH); 
//  }
}
