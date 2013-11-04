class Particle extends VerletParticle2D {

  float r;
  float radius=4;
  Vec2D force, springVel;
  Vec2D tem;
  Rect rt, rt2;
  float modulateAmount;
  float modulateFrequency;
  color c;
  
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
    
    c = color(random(255),random(255),random(255));
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
      
      if(x<=100){
      c3Channel = 1;
    c3Note = 60;
    c3Velocity = 127;
    c3Success = output.sendNoteOn(c3Channel, c3Note, c3Velocity);
      }
      
      if(x>100 && x<=200){
      d3Channel = 1;
    d3Note = 61;
    d3Velocity = 127;
    d3Success = output.sendNoteOn(d3Channel, d3Note, d3Velocity);
      }
      
     if(x>200 && x<=300){
      e3Channel = 1;
    e3Note = 62;
    e3Velocity = 127;
    e3Success = output.sendNoteOn(e3Channel, e3Note, e3Velocity);
      }
      
    if(x>300 && x<=400){
      f3Channel = 1;
    f3Note = 63;
    f3Velocity = 127;
    f3Success = output.sendNoteOn(f3Channel, f3Note, f3Velocity);
      }
      
      if(x>400 && x<=500){
      g3Channel = 1;
    g3Note = 64;
    g3Velocity = 127;
    g3Success = output.sendNoteOn(g3Channel, g3Note, g3Velocity);
      }
      
     if(x>500 && x<=600){
      a3Channel = 1;
    a3Note = 65;
    a3Velocity = 127;
    a3Success = output.sendNoteOn(a3Channel, a3Note, a3Velocity);
      }
      
      if(x>600 && x<=700){
      b3Channel = 1;
    b3Note = 66;
    b3Velocity = 127;
    b3Success = output.sendNoteOn(b3Channel, b3Note, b3Velocity);
      }
      
      if(x>700 && x<=800){
      c4Channel = 1;
    c4Note = 67;
    c4Velocity = 127;
    c4Success = output.sendNoteOn(c4Channel, c4Note, c4Velocity);
      }
      
      
      if(x>100 && x<=200){
      d4Channel = 1;
    d4Note = 61;
    d4Velocity = 127;
    d4Success = output.sendNoteOn(d4Channel, d4Note, d4Velocity);
      }
      
     if(x>200 && x<=300){
      e4Channel = 1;
    e4Note = 62;
    e4Velocity = 127;
    e4Success = output.sendNoteOn(e4Channel, e4Note, e4Velocity);
      }
      
    if(x>300 && x<=400){
      f4Channel = 1;
    f4Note = 63;
    f4Velocity = 127;
    f4Success = output.sendNoteOn(f4Channel, f4Note, f4Velocity);
      }
      
      if(x>400 && x<=500){
      g4Channel = 1;
    g4Note = 64;
    g4Velocity = 127;
    g4Success = output.sendNoteOn(g4Channel, g4Note, g4Velocity);
      }
      
     if(x>500 && x<=600){
      a4Channel = 1;
    a4Note = 65;
    a4Velocity = 127;
    a4Success = output.sendNoteOn(a4Channel, a4Note, a4Velocity);
      }
      
      if(x>600 && x<=700){
      b4Channel = 1;
    b4Note = 66;
    b4Velocity = 127;
    b4Success = output.sendNoteOn(b4Channel, b4Note, b4Velocity);
      }
      
      if(x>700 && x<=800){
      c5Channel = 1;
    c5Note = 67;
    c5Velocity = 127;
    c5Success = output.sendNoteOn(c5Channel, c5Note, c5Velocity);
      }
      
      this.addVelocity(new Vec2D(random(-2, 2), random(-70, -100)));
      
      
      
      
      c3Success = output.sendNoteOff(c3Channel, c3Note, c3Velocity);
      d3Success = output.sendNoteOff(d3Channel, d3Note, d3Velocity);
      e3Success = output.sendNoteOff(e3Channel, e3Note, e3Velocity);
      f3Success = output.sendNoteOff(f3Channel, f3Note, f3Velocity);
      g3Success = output.sendNoteOff(g3Channel, g3Note, g3Velocity);
      a3Success = output.sendNoteOff(a3Channel, a3Note, a3Velocity);
      b3Success = output.sendNoteOff(b3Channel, b3Note, b3Velocity);
      c4Success = output.sendNoteOff(c4Channel, c4Note, c4Velocity);
      d4Success = output.sendNoteOff(d4Channel, d4Note, d4Velocity);
      e4Success = output.sendNoteOff(e4Channel, e4Note, e4Velocity);
      f4Success = output.sendNoteOff(f4Channel, f4Note, f4Velocity);
      g4Success = output.sendNoteOff(g4Channel, g4Note, g4Velocity);
      a4Success = output.sendNoteOff(a4Channel, a4Note, a4Velocity);
      b4Success = output.sendNoteOff(b4Channel, b4Note, b4Velocity);
      c5Success = output.sendNoteOff(c5Channel, c5Note, c5Velocity);
      
      
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
    
    fill(c);
    ellipse(x, y, r*2, r*2);
  }

  void display(int chainCalledHere) {

    //this.addVelocity(force);  
    fill(c);
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

