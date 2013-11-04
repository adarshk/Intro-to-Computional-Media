class BaseRepel extends VerletParticle2D{

  int ht;
  BaseRepel(Vec2D location){
    
    super(location);
  
    ht=20;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this,0,-5));
    //physics.addBehavior(new AttractionBehavior(this,));
  
  }


  void display(){
  
  //fill(0);
  //rect(x,y,width,ht);
  }


  void display(int wid2,int ht2){
  
  //fill(0);
  //rect(x,y,wid2,ht2);
  }

}
