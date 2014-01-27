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
import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.analysis.*;
//import arb.soundcipher.*;

import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
 
Minim minim;
AudioPlayer song;
AudioOutput out;
FFT fft;
Oscil fm;

PBox2D box2d;
ArrayList<box2dParticle> box2dParticles;
Boundary wall;

VerletPhysics2D physics;
Particle p1;
Particle p2;
float temp=2.0;

ArrayList<Particle> particles;
BaseRepel repeller;
Speaker speaker;
AttractionBehavior mouseAttractor;
Vec2D mousePos;
//VerletSpring2D spring;

Chain chain;

void setup(){
  
  size(680,680,P3D);
  
  box2d = new PBox2D(this);
  box2d.createWorld();

  // Turn on collision listening!
  box2d.listenForCollisions();

  // Create the empty list
  box2dParticles = new ArrayList<box2dParticle>();
   
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height-20));
  physics.setDrag(0.05f);
  //physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));
  
  particles = new ArrayList<Particle>();
  for(int i=0;i<20;i++){
  particles.add(new Particle(new Vec2D(random(width),random(height))));
  }
  //p1 = new Particle(new Vec2D(random(30,width-30),random(0,height-200)));
  //p2 = new Particle(new Vec2D(random(30,width-30),random(0,height-200)));
  p1 = new Particle(new Vec2D(width*3/4,20),1);
  p2 = new Particle(new Vec2D(width*3/4+160,20));
  p1.lock();
  VerletSpring2D spring = new VerletSpring2D(p1,p2,160,0.01);
  physics.addParticle(p1);
  physics.addParticle(p2);
  physics.addSpring(spring);
  
  

  repeller = new BaseRepel(new Vec2D(0,height-20));
  speaker = new Speaker(new PVector(width/2-25,300));

  //int springConn1 = int(random(0,20));
  //int springConn2 = int(random(0,20));
  
  chain = new Chain(180,20,4,0.2);
  
  minim = new Minim(this);
  out = minim.getLineOut();
  Oscil wave = new Oscil(200,0.8,Waves.TRIANGLE);
  song = minim.loadFile("Synth1.wav",512);
  //song.play();
  fft = new FFT(song.bufferSize(),song.sampleRate());
  
  /*
  fm   = new Oscil( 10, 2, Waves.SINE );
  fm.offset.setLastValue( 200 );
  fm.patch( wave.frequency );
  wave.patch( out );
  */
  
  
  for(int j=0;j<20;j++){
  box2dParticles.add(new box2dParticle(random(width),20,4));
  }
  wall = new Boundary(width/2, height-5, width, 10);
  
}


void draw(){

  background(255);
  box2d.step();
  physics.update();
  
  
  // Look at all particles
  for (int k = box2dParticles.size()-1; k >= 0; k--) {
    box2dParticle p1 = box2dParticles.get(k);
    p1.display();
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    if (p1.done()) {
      box2dParticles.remove(k);
    }
  }
  
  for(Particle p:particles){
     p.borderCheck();
     p.display();
  }
  
  chain.updateTail(mouseX,mouseY);
  chain.display();
  
  /*
  
  // Draw a line between the particles
  stroke(0);
  strokeWeight(2);
  line(p1.x,p1.y,p2.x,p2.y);

  // Display the particles

  
  //p1.borderCheck();
  p1.display(temp);
  //p2.borderCheck();
  p2.display(p2.x,p2.y);
 
  
  //repeller.lock();
  //repeller.display();
  speaker.display();
  
  chain.updateTail(mouseX,mouseY);
  chain.display();
  
  /*
  if (mousePressed) {
    p2.lock();
    p2.x = mouseX;
    p2.y = mouseY;
    p2.unlock();
  } 
  */
  
  wall.display();

}

  void mousePressed(){

    particles.add(new Particle(new Vec2D(mouseX,mouseY)));

    mousePos = new Vec2D(mouseX,mouseY);
    mouseAttractor = new AttractionBehavior(mousePos,250,0.9f);
    physics.addBehavior(mouseAttractor);

  chain.contains(mouseX,mouseY);
  }

  void mouseReleased(){

  physics.removeBehavior(mouseAttractor);
  chain.release();
  }

  void mouseDragged(){
  mousePos.set(mouseX,mouseY);
  
  }


void stop(){

  song.close();
  minim.stop();
  
  super.stop();

}


// Collision event functions!
void beginContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1.getClass() == box2dParticle.class && o2.getClass() == box2dParticle.class) {
    box2dParticle p_1 = (box2dParticle) o1;
    p_1.change();
    box2dParticle p_2 = (box2dParticle) o2;
    p_2.change();
  }

}

// Objects stop touching each other
void endContact(Contact cp) {
}

