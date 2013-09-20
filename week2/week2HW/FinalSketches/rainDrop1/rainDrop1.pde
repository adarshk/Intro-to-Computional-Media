int move=0;
int move2=0;
boolean dragging=false;


float x = 300;
float y = 600;
float w = 15;
float h = 15;
// Start and end of slider
float sliderStartX = 150;
float sliderEndX = 450;
float sliderStartY = 540;
float sliderEndY = 640;
// Offset for dragging slider
float offsetX = 0;
float offsetY = 0;

int endRotate = 0;
float i = 0; 
float speed = 0; 
int flag=0;
float mouseSpeed=0;
float mouseSpeed2=0;
int temp;

void setup(){

size(720,720);

noStroke();
fill(100);  

}

void draw(){
  
  pushMatrix();
  
  translate(0,-50);
  rotate(radians(-20));
  background(255);
  
  if(move>height-200){move=0;}
  for(int j=1;j<10;j++){
  pushMatrix();
    translate((j*20)+20,(j*20)+move);
    rotate(radians(random(j,10)));
  for(int i=0;i<8;i++){
    
  ellipse(10*j, 50-i, 8-i, 8-i);
  
  }
  popMatrix();
  
  }
  
  
  if(move2>height){move2=0;}
  for(int j=1;j<10;j++){
  pushMatrix();
    translate((j*20),(j*15)+move2);
  
  for(int i=0;i<10;i++){
    
  ellipse(10*j, 50-i, 10-i, 10-i);
  
  }
  popMatrix();
  
  }
  
  
  
move+=2;
move2+=1;

popMatrix();

  pushMatrix();
  speed=offsetX;
  rectMode(CENTER);
  //translate(300, 300); 
  rect(300, 400, 10, 200);
  
  //if(speed==0)i=0;
  println(i+=speed);
  translate(300, 300); 
  rotate(radians(i+=speed)); 
   //draw the windmill
  triangle(0, 0, 0, -20, -100, - 100); 
  triangle(0, 0, 0, 20, 100, 100);
 
 
 //if(mouseX>50 && mouseX<100 && mouseY>10 && mouseY<20){
  //if(mouseX>pmouseX){

  //blowAir();
  popMatrix();
  
  if (dragging) {
    x = mouseX + offsetX;
    y = mouseY + offsetY;
  }
  
   x = constrain(x, sliderStartX, sliderEndX-w);
   y = constrain(y, sliderStartY, sliderEndY-h);
  
  
  pushMatrix();
  //translate(30,70);
  noStroke();
  fill(100);
  rect(0,600,width*2,120);

  // Draw a line for slider
  stroke(255);
  line(sliderStartX, 600, sliderEndX, 600);
  line(300,sliderStartY,300,sliderEndY);

  stroke(0);
  // Fill according to state
  if (dragging) {
    fill (50);
  } else {
    fill(175);
  }
  // Draw rectangle for slider
  //rect(x, y-25, w, h);
  ellipse(x,y,w,h);
  
  popMatrix();
  
}



void mousePressed() {
  
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    dragging = true;
    
    offsetX = x-mouseX;
    offsetY = y-mouseY;
    
  }
}

void mouseReleased() {
  
  dragging = false;
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
  
}

