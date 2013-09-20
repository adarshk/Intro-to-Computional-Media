int move=0;
int move2=0;

PGraphics pg;

void setup() {
  size(640, 640);
  pg = createGraphics(30, 40);
  //pg = createGraphics();
}

void draw() {
  translate(0,-50);
  
  if(move>height){move=0;}
  
  
  pg.beginDraw();
  pg.background(205);
  pg.stroke(255);
  //pg.line(20, 20, mouseX, mouseY);
  
  for(int j=1;j<10;j++){
  pushMatrix();
    pg.translate((j*20)+20,(j*20)+move);
  
  for(int i=0;i<8;i++){
    
  pg.ellipse(10*j, 50-i, 8-i, 8-i);
  
  }
  popMatrix();
  
  }
  
  pg.endDraw();
  image(pg, 9, 30); 
  image(pg, 51, 30);
}
