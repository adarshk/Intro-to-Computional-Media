//Week 6 HW - Particle system
//I use soundcipher library to generate sound
//however I commented out that code and only using minim for demo

//This project is also part of PComp midterm for which other parts are commented out

import toxi.physics2d.constraints.*;
import toxi.physics.*;
import toxi.physics.constraints.*;
import toxi.physics2d.behaviors.*;
//import toxi.physics.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;

import gifAnimation.*;
import rwmidi.*;

import processing.serial.*;

Serial myPort; 

MidiOutput output;

// variables for note generation from keystrike
int c3Channel,  d3Channel,  e3Channel,  f3Channel,g3Channel,a3Channel,b3Channel,c4Channel,d4Channel,  e4Channel,  f4Channel,g4Channel,a4Channel,b4Channel,c5Channel;
int c3Note,     d3Note,     e3Note,     f3Note,g3Note,a3Note,b3Note,c4Note,d4Note,     e4Note,     f4Note,g4Note,a4Note,b4Note,c5Note;
int c3Velocity, d3Velocity, e3Velocity, f3Velocity,g3Velocity,a3Velocity,b3Velocity,c4Velocity,d4Velocity, e4Velocity, f4Velocity,g4Velocity,a4Velocity,b4Velocity,c5Velocity;
int c3Success,  d3Success,  e3Success,  f3Success,g3Success,a3Success,b3Success,c4Success,d4Success,  e4Success,  f4Success,g4Success,a4Success,b4Success,c5Success;

Gif loopingGif,loopingGif2,loopingGif3,parachuteGif,parachuteGif2,drummerGif,drummerGif2;
boolean pause = false;
int gifTranslate=width-10;
int gifTranslate2=width;
int gifTranslate3=width;

VerletPhysics2D physics;
Particle p1;
Particle p2;
float temp=2.0;

ArrayList<Particle> particles;
ArrayList<BaseRepel> repellers;
ArrayList<Notes> notes;
BaseRepel repeller;
int repellerSize =60;
int keySize = 100;

AttractionBehavior mouseAttractor;
Vec2D mousePos;
//VerletSpring2D spring;
Speaker speaker,speaker2;
int change1=0;
int change2=0;

PImage bagpiper;

void setup(){
  
  size(1600,900,P3D);
  

  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height-repellerSize));
  physics.setDrag(0.05f);
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));
  
  particles = new ArrayList<Particle>();
  for(int i=0;i<20;i++){
  particles.add(new Particle(new Vec2D(random(width),random(height))));
  }
  
  p1 = new Particle(new Vec2D(width*3/4,20),1);
  p2 = new Particle(new Vec2D(width*3/4+160,20));
  p1.lock();
  VerletSpring2D spring = new VerletSpring2D(p1,p2,160,0.01);
  physics.addParticle(p1);
  physics.addParticle(p2);
  physics.addSpring(spring);

  

  repeller = new BaseRepel(new Vec2D(0,height-repellerSize),repellerSize);
  speaker = new Speaker(new Vec2D(250,height/2-250));
  speaker2 = new Speaker(new Vec2D(width-400,height/2-250));
  
  
  
  notes = new ArrayList<Notes>();
  for(int n=0;n<width;n+=keySize){
  notes.add(new Notes(new PVector(n,height-repellerSize),keySize));
  }
  
  
  println("gifAnimation " + Gif.version());
  // create the GifAnimation object for playback
  loopingGif = new Gif(this, "animated_piper.gif");
  loopingGif.loop();
  loopingGif2 = new Gif(this, "animated_piper2.gif");
  loopingGif2.loop();
  loopingGif3 = new Gif(this, "animated_piper3.gif");
  loopingGif3.loop();
  
  parachuteGif = new Gif(this, "parachute.gif");
  parachuteGif.loop();
  parachuteGif2 = new Gif(this, "parachute.gif");
  parachuteGif2.loop();
  
  drummerGif = new Gif(this, "drummer.gif");
  drummerGif.loop();
  drummerGif2 = new Gif(this, "drummer2.gif");
  drummerGif2.loop();
  
  
  
  output = RWMidi.getOutputDevices()[0].createOutput();  // talks to garageband 
}


void draw(){

  background(255);

  physics.update();
  
 
  
  for(Particle p:particles){
     p.borderCheck();
     p.display();
  }
  
  for(Notes nt:notes){
     nt.display();
  }
  
  //repeller.display();
  speaker.display();
  speaker2.display();
  
  //image(bagpiper,width/2,height/2);
  
  
  pushMatrix();
  translate(gifTranslate,0);
  scale(0.1);
  //image(loopingGif, width-100, height-repellerSize - loopingGif.height / 2);
  image(loopingGif, (gifTranslate), ((height-repellerSize) - (loopingGif.height)*0.1)*10);
  
  popMatrix();
  
  pushMatrix();
  translate(gifTranslate2,0);
  scale(0.1);
  //image(loopingGif, width-100, height-repellerSize - loopingGif.height / 2);
  
  image(loopingGif2, (gifTranslate2-100), ((height-repellerSize) - (loopingGif.height)*0.1)*10);
  
  popMatrix();
  
  pushMatrix();
  translate(gifTranslate3,0);
  scale(0.1);
  //image(loopingGif, width-100, height-repellerSize - loopingGif.height / 2);
  image(loopingGif3, (gifTranslate3-200), ((height-repellerSize) - (loopingGif.height)*0.1)*10);
  popMatrix();
  
  if(gifTranslate>=width || gifTranslate<=0)
  //gifTranslate = gifTranslate * -1;
  gifTranslate = width-10;  
  else {gifTranslate-=0.0001;}

  if(gifTranslate2>=width || gifTranslate2<=0)
  //gifTranslate = gifTranslate * -1;
  gifTranslate2 = width;  
  else {gifTranslate2-=0.001;}
  
  if(gifTranslate3>=width || gifTranslate3<=0)
  //gifTranslate = gifTranslate * -1;
  gifTranslate3 = width;  
  else {gifTranslate3-=0.01;}
 
 
  
    if(change1<(height/2)+400){
  pushMatrix();
  scale(0.2);
  image(parachuteGif,(250*5),0+change1);
  popMatrix();
  
  change1+=1;
    }
    
   else {
   
     scale(0.2);
     image(drummerGif,250*5,height-50);
   
 
    } 
    
    
    
    
    if(change2<(height/2)+400){
  pushMatrix();
  scale(0.2);
  image(parachuteGif2,((width-400)*5),0+change2);
  popMatrix();
  
  change2+=1;
    }
    
   else {
   
     scale(0.2);
     image(drummerGif2,500*5,height-50);
   
 
    } 
  //if(change1>=height/2 - 250)parachuteGif.stop();
  
}

  void mousePressed(){

    particles.add(new Particle(new Vec2D(mouseX,mouseY)));

    mousePos = new Vec2D(mouseX,mouseY);
    mouseAttractor = new AttractionBehavior(mousePos,250,0.9f);
    physics.addBehavior(mouseAttractor);

  //chain.contains(mouseX,mouseY);
  }

  void mouseReleased(){

  physics.removeBehavior(mouseAttractor);

  }

  void mouseDragged(){
  mousePos.set(mouseX,mouseY);
  
  }


void stop(){

//  song.close();
//  minim.stop();
  
//  super.stop();

}


void serialEvent(Serial myPort){

  String myString = myPort.readStringUntil('\n');
  
  if(myString!=null){
  
  myString = trim(myString);
  
  
  int sensors[] = int(split(myString,','));
  
  for(int sensorNum=0;sensorNum<sensors.length;sensorNum++){
  print("Sensor" + sensorNum + ": " + sensors[sensorNum]+ "\t");  
  }
  
  print("\n");
  
  if(sensors.length>1){
    
    
  
  }
  
  myPort.write("A");
  
  }

}



