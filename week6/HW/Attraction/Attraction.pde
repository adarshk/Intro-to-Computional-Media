import toxi.physics2d.constraints.*;
import toxi.physics.*;
import toxi.physics.constraints.*;
import toxi.physics2d.behaviors.*;
//import toxi.physics.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
FFT fft;

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
   
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height-20));
  physics.setDrag(0.05f);
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));
  
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
  song = minim.loadFile("Synth1.wav",512);
  song.play();
  
  fft = new FFT(song.bufferSize(),song.sampleRate());
}


void draw(){

  background(255);
  physics.update();
  
  for(Particle p:particles){
     p.borderCheck();
     p.display();
  }
  
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
  
  fft.forward(song.mix);
  
  stroke(255, 0, 0, 128);
  // draw the spectrum as a series of vertical lines
  // I multiple the value of getBand by 4 
  // so that we can see the lines better
  for(int i = 0; i < fft.specSize(); i++)
  {
    line(i, height, i, height - fft.getBand(i)*4);
  }
 
  stroke(0);
  // I draw the waveform by connecting 
  // neighbor values with a line. I multiply 
  // each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  for(int i = 0; i < song.left.size() - 1; i++)
  {
    line(i, 50 + song.left.get(i)*50, i+1, 50 + song.left.get(i+1)*50);
    line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }

}

  void mousePressed(){

    //particles.add(new Particle(new Vec2D(mouseX,mouseY)));

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

