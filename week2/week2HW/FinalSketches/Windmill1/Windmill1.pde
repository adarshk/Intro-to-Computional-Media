// Windmill Sketch 

/*1. Setup window
2. Draw windmill in center of screen, Start and Stop button and speed fader 
3. rotate windmill
3. When Start is pushed, rotate windmill
4. Fader controls speed
5. When Stop is pushed, windmill stops
*/


int endRotate = 0;
float i = 0; 
float speed = 0; 
int flag=0;
float mouseSpeed=0;
float mouseSpeed2=0;
int temp;

void setup() {
  size(800,800);
  //background(100); 
}

void draw(){
 frameRate(60);
  background(100);
  rectMode(CENTER);
  translate(width/2, height/2); 
  rect(0, 90, 10, 180);
  
  //if(speed==0)i=0;
  println(i+=speed);
  rotate(radians(i+=speed)); 
   //draw the windmill
  triangle(0, 0, 0, -20, -100, - 100); 
  triangle(0, 0, 0, 20, 100, 100);
 
 
 //if(mouseX>50 && mouseX<100 && mouseY>10 && mouseY<20){
  //if(mouseX>pmouseX){

  blowAir();    
    
  //}

//}
 
  //speed = mouseX/10; 
   
}
  

void blowAir(){
  
  if(mouseX>0 && mouseX<width && mouseY>0 && mouseY<height){
  
  mouseSpeed=(mouseX-pmouseX);
  
  if(flag==0){
  if((mouseSpeed>speed || mouseSpeed<speed) && (mouseSpeed<360 && mouseSpeed>-360)){
  speed=mouseSpeed;println(speed);flag=2;
  //mouseSpeed=speed;
  }}
  
  
  
  if(flag==2){
  if(speed>=0.1){  
  speed=speed-0.1;
  }
  
  else if(speed<=-0.1){  
  speed=speed+0.1;
  }

  else{flag=0;println(flag);}
}
  
  }
  
  
  /*
  mouseSpeed2=(mouseX-pmouseX);
  
 if((mouseSpeed2)<speed && flag==0){
  speed=mouseSpeed2;
  //mouseSpeed=speed;
  }
  
  
  else if(speed<=-0.1){  
  speed=speed+0.1;
  
  

}
  
  else if(speed==0){i=0;flag=1;}
  */
  
}


void rotateWindmill() {
  
 // pushMatrix();
  //translate(width/2, height/2);
  rotate(i++); 
  triangle(width/2, height/2, width/2, (height/2 -20), width/2 -100, height/2 - 100); 
  triangle(width/2, height/2, width/2, (height/2 + 20), width/2 +100, height/2 + 100);
 // popMatrix(); 

}
