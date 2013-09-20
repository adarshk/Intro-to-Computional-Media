int move=0;
int move2=0;

int move3=0;
int move4=0;
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
float size=3.0;
float size2=2.0;
float numberOfGroups=5;
float numberOfDrops=13;
float rotateDirection = -20;
float tranRandom=30;

int ellSize= 8;
int drops = 10;
float [] xpos= new float[drops];
float [] ypos= new float[drops];
float [] xspeed= new float[drops];
float [] yspeed= new float[drops];

void setup(){

size(1080,720);

noStroke();
fill(100);  

}

void draw(){
  
  pushMatrix();
  
  //translate(0,-50);
  rotate(radians(rotateDirection));
  background(255);
  //if(size>=10){
  //size = 6;}
  
  
//for(int translateMe=0;translateMe<5;translateMe++){
  if(move>height){move=0;size=3;size2=2;}
  
  for(int groups=0;groups<numberOfGroups;groups++){
  for(int j=1;j<numberOfDrops;j++){
  
    pushMatrix();
    
    //translate((j*randomTranslate1)+randomTranslate2,(j*20)+move);
    
    //translate(tranRandom,j*10+move);
    translate((j*20)+move2-(groups*10),(j*20)+move-(groups*10));
    //translate(random(0,25),random(0,25));
    //rotate(radians(random(j,10)));
  
  for(int i=0;i<size;i++){
    
    
    
  ellipse(10*j, 50-i, size-i, size-i);
  
  }
  popMatrix();
  
  }}
  
 
  
  //delay(10);
//}
  /*
  if(move2>height){move2=0;}
  for(int j=1;j<10;j++){
  pushMatrix();
    translate((j*20),(j*15)+move2);
  
  for(int i=0;i<10;i++){
    
  ellipse(10*j, 50-i, 10-i, 10-i);
  
  }
  popMatrix();
  
  }
  */
  
  if(move==0){move2+=random(0,100);
numberOfGroups=random(6,16);numberOfDrops=random(5,15);
rotateDirection = random(-30,10);
 tranRandom = random(0,500);
   }
move+=random(1,4);

//size++;
//if(frameCount%70==0){
if(frameCount%30==0 && size<=8){
  size++;}
  if(frameCount%30==0 && size2<=8){
  size2++;}
//}
popMatrix();


  pushMatrix();
  speed=offsetX;
  rectMode(CENTER);
  //translate(300, 300); 
  rect(300, 400, 10, 200);
  
  //if(speed==0)i=0;
  //println(i+=speed);
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

