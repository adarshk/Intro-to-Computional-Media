class Particle extends VerletParticle2D {

  float r;
  float radius=4;
  Vec2D force, springVel;
  Vec2D tem;
  Rect rt, rt2;
  float modulateAmount;
  float modulateFrequency;
  
  //SoundCipher sc = new SoundCipher();
  Particle(Vec2D vecNew) {

    super(vecNew);
    r=8;

    force = new Vec2D(0, 0);
    physics.addParticle(this);
    //this.addBehavior(new AttractionBehavior(this, r*3, -1));
    physics.addBehavior(new AttractionBehavior(this, r*3, -1));
    

    force = this.addVelocity(new Vec2D(0, 0.1));
    //physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.15f)));
    
    modulateAmount = random(1,220);
    modulateFrequency = random(0.1,100);
    
    
  } 


  Particle(float x, float y) {

    super(x, y);
  }

  Particle(Vec2D fixedSpring, int id) {

    super(fixedSpring);
    ;
    //physics.removeBehavior(new GravityBehavior(new Vec2D(0, 0.5)));
    //springVel = this.addVelocity(new Vec2D(0,0.9));
  }


  void borderCheck() {

    rt = physics.getWorldBounds();
    //println(rt.height);
    if (x<=rt.x) {
      this.addVelocity(new Vec2D(random(1, 4), random(-2, 2)));
    }

    if (x>=rt.width) {
      this.addVelocity(new Vec2D(random(-1, -4), random(-2, 2)));
      
      /*
      Oscil wave = new Oscil( int(random(400,450)), random(0,1), Waves.SINE );
      wave.patch(out);
      
      
      modulateAmount = random(1,220);
    modulateFrequency = random(0.1,100);
    
    fm.frequency.setLastValue( modulateFrequency );
    fm.amplitude.setLastValue( modulateAmount );
     */ 
      
    }

    if (y<=rt.y) {
      this.addVelocity(new Vec2D(random(-2, 2), random(1, 4)));
    }

    if (y>=rt.height) {
      this.addVelocity(new Vec2D(random(-2, 2), random(-25, -100)));
    }
    
    
    if(x>=((width/2)-25) && x<=((width/2)+25) && y>=300 && y<=350){
    
      
      //sc.instrument(random(80));
      //sc.pan(mouseX);
      //sc.playNote(random(40) + 60 , random(50)+70,0.2);
    
   
   //song.play(); 
   //fft.forward(song.mix);
  
  //stroke(0);
  // I draw the waveform by connecting 
  // neighbor values with a line. I multiply 
  // each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  //for(int i = 0; i < song.left.size() - 1; i++)
  //{
    //line(i+200, height-200 + song.left.get(i)*50, (i+1)+200, height-200 + song.left.get(i+1)*50);
    //line(i+200, height-50 + song.right.get(i)*50, (i+1)+200, height-50 + song.right.get(i+1)*50);
  //}
    
    }
    
   /* 
    Vec2D checkVel = this.getVelocity();
    
    if(checkVel.x<=0.3 && checkVel.y<=0.3){
    
    if(x>=0 && x<rt.width && y>0 && y<rt.height){
    
        this.addVelocity(new Vec2D(random(-5, 5), random(-5, 5)));
      
    }}
    */
    
    Vec2D checkVel = this.getVelocity();
    
    if(checkVel.x<0.3 && checkVel.y<0.3){
    //this.addVelocity(new Vec2D(checkVel.x, checkVel.y));
    }
    
    
  }

  void display() {

    //this.addVelocity(force);
    
    fill(0);
    ellipse(x, y, r*2, r*2);
  }

  void display(int chainCalledHere) {

    //this.addVelocity(force);  
    fill(0);
    ellipse(x, y, radius*2, radius*2);
  }


  void display(float fixedSpringCalledHere) {
    fill(127);
    stroke(0);
    strokeWeight(2);
    ellipse(x, y, 32, 32);

    //tem = this.getVelocity();
    //if(tem.y<5 || tem.x<5)
    //this.addForce(new Vec2D(0,10));


    //this.addVelocity(new Vec2D(random(-5,5),random(-5,5)));
  }


  void display(float m, float n) {
    fill(127);
    stroke(0);
    strokeWeight(2);
    ellipse(x, y, 32, 32);

    tem = this.getVelocity();
    if (tem.x<0.1 || tem.y<0.1) {
      Vec2D prevPos = this.getPreviousPosition();
      if (prevPos.x<x) {
        this.addVelocity(new Vec2D(1, -1));
      }
      else if (prevPos.x>x) {
        this.addVelocity(new Vec2D(-1, -1));
      }

      //this.addVelocity(new Vec2D(random(-3,3),0));
    }




    //this.addVelocity(new Vec2D(random(-5,5),random(-5,5)));
  }
}

