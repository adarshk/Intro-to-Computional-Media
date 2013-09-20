// Windmill Sketch 
//Aaron Arntz

//mouse controls speed of windmill along x-axis

float r = 0; 
float speed = 0; 
float slowdownSpeed = 0.1;


int diam= 6;
int drops = 10;
float [] xpos= new float[drops];
float [] ypos= new float[drops];
float [] xspeed= new float[drops];
float [] yspeed= new float[drops];
boolean dragging = false;
float x = 100;
float y = 400;
float w = 200;
float h = 100;
float offsetX = 0;
float offsetY = 0;
float mapX=0;
float mapY=0;
float sliderStartX = 100;
float sliderEndX = 300;
float sliderStartY = 400;
float sliderEndY = 600;
float previousX = 0;
float previousY = 0;


void setup() {
  size(400, 500);
  for(int i=0; i<10; i++) {
    xpos[i]= random(diam, width-diam);
    ypos[i]=random(diam, height-h-diam);
    xspeed[i]=random(2, 4);
    yspeed[i]=random(2, 4);
  }
  //mapX=map(x,100,300,-50,50);
  //mapY=map(y,400,500,-50,50);
}


void draw() {

  if(dragging){
  x=mouseX+offsetX;
  y=mouseY+offsetY;
  }
  
  //x=constrain(x,sliderStartX,sliderEndX);
  //y=constrain(y,sliderStartY,sliderEndY);
  
  PImage windmillBackground = loadImage("resizedwindmillbg.jpg");
  image(windmillBackground, 0, 0);
  //background(windmillBackground);
  
  //rectMode(CENTER);
  pushMatrix();
  translate(width/2, (height/2)-50); 
  fill(255);
  rect(-5, 0, 9, 180);
  rotate(radians(r+=speed)); 
  //println(r);
  //println(speed);
  triangle(0, 0, 0, -20, -70, - 70); 
  triangle(0, 0, 0, 20, 70, 70);
  popMatrix();
  
  
  noStroke();
  fill(0);
  rect(0,windmillBackground.height,width,height-windmillBackground.height);
  stroke(255);
  line(100,450,300,450);
  line(200,400,200,500);
  //ellipse(200,450,4,4);
  ellipse(x+(w/2),y+(h/2),4,4);
  stopWindmill();
  
  
  if(speed==0){
  for(int i=0; i<drops; i++){
    xpos[i] +=xspeed[i];
    ypos[i] +=yspeed[i];
      //to bounce
      if(xpos[i] < diam/2 || xpos[i] > width-diam/2){
       xspeed[i]*=-1;
      }
      if(ypos[i] < diam/2 || ypos[i] > height-h-diam/2){
      yspeed[i]*=-1;
      }
  }
    for(int i=0; i<drops; i++){
       ellipse(xpos[i], ypos[i], diam,diam);
    }
  }
  
  else if(speed>0){
  for(int i=0; i<drops; i++){
    xpos[i] +=xspeed[i];
    ypos[i] +=yspeed[i];
    
    
      //to bounce
      if(xpos[i] < diam/2 || xpos[i] > width-diam/2){
       xspeed[i]*=-1;
      xpos[i] = random(0,2)+1;
      }
      if(ypos[i] < diam/2 || ypos[i] > height-h-diam/2){
      yspeed[i]*=-1;
      ypos[i] =random(0,400)+1;
      }
  }
    for(int i=0; i<drops; i++){
       ellipse(xpos[i], ypos[i], diam,diam);
    }
  }
  
  else if(speed<0){
  for(int i=0; i<drops; i++){
    
    xpos[i] +=xspeed[i];
    ypos[i] +=yspeed[i];
    //xpos[i] = random(width-2,width)+1;
    //ypos[i] =random(0,400)+1;
      //to bounce
      if(xpos[i] < diam/2 || xpos[i] > width-diam/2){
       xspeed[i]*=-1;
       xpos[i] = random(width-2,width)+1;
    
      }
      if(ypos[i] < diam/2 || ypos[i] > height-h-diam/2){
      yspeed[i]*=-1;
      ypos[i] =random(0,400)+1;
      }
  }
    for(int i=0; i<drops; i++){
       ellipse(xpos[i], ypos[i], diam,diam);
    }
  }
  
}
void mousePressed() {
  // Did I click on slider?
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    dragging = true;
    offsetX = x-mouseX;
    previousX = mouseX-pmouseX;
    println("OffsetX - "+offsetX);
    println("PreviousX - "+previousX);
    previousY = mouseY-pmouseY;
    println("OffsetY - "+offsetY);
    println("PreviousY - "+previousY);
  }
  
}

void mouseReleased() {
  dragging = false;
}
void mouseMoved() {
  speed = (mouseX-pmouseX);
  speed = map(speed, -100, 100, -50, 50);
}


void stopWindmill() {
  if (speed >= slowdownSpeed) {
    speed = speed - slowdownSpeed;
  } 
  else if (speed<=-(slowdownSpeed)) {
    speed = speed + slowdownSpeed;
  }
  else {
    speed = 0;
  }
}

