class Speaker extends VerletParticle2D{

  Vec2D pos;
  //int ht;
  Speaker(Vec2D loc){
    super(loc);
    //pos = loc;
    //physics.addBehavior(new AttractionBehavior(this,50,1,1));
    physics.addBehavior(new AttractionBehavior(this,25,-75));
    //super(location);
  /*
    //ht=20;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this,0,1));
    physics.addBehavior(new AttractionBehavior(this,0,-2));
    //physics.addBehavior(new AttractionBehavior(this,));
  */
  }
  
  
  void display(){
  
  //fill(0);
  noFill();
  //noStroke();
  rect(x,y,150,350);
  
  }
  
}
