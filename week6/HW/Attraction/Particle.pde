class Particle extends VerletParticle2D {

  float r;
  float radius=4;
  Vec2D force, springVel;
  Vec2D tem;
  Rect rt, rt2;
  Particle(Vec2D vecNew) {

    super(vecNew);
    r=8;

    force = new Vec2D(0, 0);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*3, -1));


    force = this.addVelocity(new Vec2D(0, 0.1));
    //physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.15f)));
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
      this.addForce(new Vec2D(random(2, 15), random(-5, 5)));
    }

    if (x>=rt.width) {
      this.addForce(new Vec2D(random(-2, -15), random(-5, 5)));
    }

    if (y<=rt.y) {
      this.addForce(new Vec2D(random(-3, 3), random(0, 10)));
    }

    if (y>=rt.height) {
      this.addForce(new Vec2D(random(-3, 3), random(-25, -90)));
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

