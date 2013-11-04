class Speaker {

  PVector pos;
  //int ht;
  Speaker(PVector loc){
    pos = loc;
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
  
  fill(0);
  rect(pos.x,pos.y,50,50);
  
  }
  
}
