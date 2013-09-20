//Elephant, Adarsh Kosuru, ICM Week 1

int flag=0;

size(510,350);
background(229,201,171);
    
    //Grey Background
    color c = color(188,188,188);
    fill(c);
    noStroke();
    rect(30,20,450,320,15);
  
  
if(flag==0){
  int [] yCoordinates1 = {65,30,50,75,100,150,180,240,250};
  int coords=0;

  int [] yCoordinates2 = {115,130,145,155,170,195,300};

  noFill();

  stroke(137,81,22);

  //Translate the entire drawing below to the right
    translate(50,0);
  
  //Head Curve
    strokeWeight(4);
    curve(155, 90, 150, 70, 270, 70, 265, 90);

    strokeWeight(1);
  
  
    curve(155, 170, 190, 150, 230, 150, 265, 170);
    curve(155, 190, 180, 170, 240, 170, 265, 190);
  
    curve(155, 190, 180, 195, 240, 195, 265, 190);
    curve(155, 270, 170, 240, 250, 240, 265, 270);
  
   
   //Left eye
     noFill();
     ellipse(170,110,20,8);
   
   //Right eye
     pushMatrix();
     translate(80,0);
     ellipse(170,110,20,8);
     popMatrix();
   
     strokeWeight(2);

  for(int i=0;i<30;i=i+10){
  curve(165,42,148,75,120+i,100,120,130);
  }
  
  for(int i=0;i<30;i=i+10){
  curve(255,42,272,75,292-i,100,292,130);
  }
  
  //curve(145,75,);
  stroke(139,74,48);
  
  //Left Ear
    noFill();
    strokeWeight(2);
    beginShape();
    curveVertex(145,yCoordinates1[coords]);
    curveVertex(145,yCoordinates1[coords]);
  
    curveVertex(110,yCoordinates1[++coords]);
    curveVertex(90,yCoordinates1[++coords]);
    curveVertex(60,yCoordinates1[++coords]);
    curveVertex(45,yCoordinates1[++coords]);
    curveVertex(3,yCoordinates1[++coords]);
    curveVertex(12,yCoordinates1[++coords]);
    curveVertex(60,yCoordinates1[++coords]);
  
  
    curveVertex(130,yCoordinates1[++coords]);
    curveVertex(130,yCoordinates1[coords]);
    endShape();
  
  
  //Right Ear
    coords=0;
    noFill();
    strokeWeight(2);
    beginShape();
    curveVertex(275,yCoordinates1[coords]);
    curveVertex(275,yCoordinates1[coords]);
  
    curveVertex(310,yCoordinates1[++coords]);
    curveVertex(330,yCoordinates1[++coords]);
    curveVertex(360,yCoordinates1[++coords]);
    curveVertex(375,yCoordinates1[++coords]);
    curveVertex(417,yCoordinates1[++coords]);
    curveVertex(408,yCoordinates1[++coords]);
    curveVertex(360,yCoordinates1[++coords]);
  
    curveVertex(290,yCoordinates1[++coords]);
    curveVertex(290,yCoordinates1[coords]);
    endShape();
  
  
    coords=0;
    pushMatrix();
    translate(20,40);
  
  
    stroke(137,68,41);
    //Face - left side
    noFill();
    strokeWeight(2);
    beginShape();
    curveVertex(140,yCoordinates2[coords]);
    curveVertex(140,yCoordinates2[coords]);
  
    curveVertex(132,yCoordinates2[++coords]);
    curveVertex(140,yCoordinates2[++coords]);
    curveVertex(140,yCoordinates2[++coords]);
    curveVertex(125,yCoordinates2[++coords]);
    curveVertex(145,yCoordinates2[++coords]);
  
    curveVertex(145,yCoordinates2[++coords]);
    curveVertex(145,yCoordinates2[coords]);
  
    endShape();
  
  //Left tusk
    curve(150,183,130,178,100,270,135,230);
    line(145,195,100,270);
  
    popMatrix();
 
    coords=0;
  
  //Face - right side 
    pushMatrix();
    translate(-20,40);  
    noFill();
    strokeWeight(2);
    beginShape();
    curveVertex(280,yCoordinates2[coords]);
    curveVertex(280,yCoordinates2[coords]);
  
    curveVertex(288,yCoordinates2[++coords]);
    curveVertex(280,yCoordinates2[++coords]);
    curveVertex(280,yCoordinates2[++coords]);
    curveVertex(295,yCoordinates2[++coords]);
    curveVertex(275,yCoordinates2[++coords]);
  
    curveVertex(275,yCoordinates2[++coords]);
    curveVertex(275,yCoordinates2[coords]);
    endShape();

  //Right tusk
    line(290,178,320,270);
    line(275,195,320,270);
  
     popMatrix();
  
}

else if(flag==1){}
