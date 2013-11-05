class BaseRepel extends VerletParticle2D{

  int wd;
  
  
  BaseRepel(Vec2D location,int repelSize){
    
    super(location);
  
    wd = repelSize;
    //ht=20;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this,0,random(-20,-100)));
    //physics.addBehavior(new AttractionBehavior(this,));
  
  }


  void display(){
  
  fill(0);
  
  //rect(x,y,wd,height);
  
  //rect(x,y,width,ht);
  }


  void display(int wid2,int ht2){
  
  fill(0);
  rect(width/2-100,height/2-100,50,100);
  
  //rect(x,y,wid2,ht2);
  }

}
