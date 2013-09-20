float a =0;

void setup(){size(400,400,P3D);}

void draw(){
background(255);

pushMatrix();
translate(100,100);
rotateX(a);
//rotate(a);
scale(5);
fill(100);
rectMode(CENTER);
rect(0,0,50,25);

//Below 2 lines are bad way of coding
//rotate(-a);
//translate(-100,-100);
popMatrix();
translate(300,50);
rotate(-a*2);
rect(0,0,25,50);

a=a+0.02;
}
