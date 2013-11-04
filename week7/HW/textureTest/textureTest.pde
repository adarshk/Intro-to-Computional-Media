PImage img;
void setup(){
size(300, 300, P3D);
noStroke();
img = loadImage("cards.png");
}

void draw(){

  
  //image(img,0,0);
textureMode(IMAGE);  
  beginShape(QUAD);
//pushMatrix();
//translate(-10,0,0);
//scale(2);
texture(img);
//image(img,0,0);


vertex(10, 20, 0, 0);
vertex(80, 5, 100, 0);
vertex(95, 90, 100, 100);
vertex(40, 95, 0, 100);
endShape();
//popMatrix();

}
