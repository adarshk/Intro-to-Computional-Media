class Windmill{
  
  int x,y;
  float wd,ht;
  float speed;
 
  Windmill(int leftX,int leftY,float wid, float het){
  
    x=leftX;
    y=leftY;
    wd=wid;
    ht=het;
    
  
  }
  
  
  void triangles(){}
  
  void tower(){
    
  pushMatrix();
  translate(x,y);
  rect(x,y,wd,ht);
  popMatrix();
  }
 
 
   int windmillMove(){
   
   
     return speed;
   }
   
   
   void blowWind(){
   
   
     
   }
 
 
  
}
