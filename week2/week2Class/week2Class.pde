void setup(){

size(640,360);
background(255); // IF you draw the background here it doesnt 
//update the display in each frame.

}

void draw(){
//background(255);
background(float(frameCount));

ellipse(mouseX,mouseY,16,16);

}

void mousePressed(){

background(255);
}
