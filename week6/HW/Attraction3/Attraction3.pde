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



VerletPhysics2D physics;
Particle p1;
Particle p2;
float temp=2.0;

ArrayList<Particle> particles;
ArrayList<BaseRepel> repellers;
BaseRepel repeller;
int repellerSize =60;
Speaker speaker;
AttractionBehavior mouseAttractor;
Vec2D mousePos;
//VerletSpring2D spring;



PImage bagpiper;

void setup(){
  
  size(680,680,P3D);
  

  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height-repellerSize));
  physics.setDrag(0.05f);
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));
  
  particles = new ArrayList<Particle>();
  for(int i=0;i<20;i++){
  particles.add(new Particle(new Vec2D(random(width),random(height))));
  }

  

  repeller = new BaseRepel(new Vec2D(0,height-repellerSize),repellerSize);
  
  
}


void draw(){

  background(255);

  physics.update();
  
 
  
  for(Particle p:particles){
     p.borderCheck();
     p.display();
  }
  
  
  
  repeller.display(5,5);
  
  //image(bagpiper,width/2,height/2);
}

  void mousePressed(){

    //particles.add(new Particle(new Vec2D(mouseX,mouseY)));

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




