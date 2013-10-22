float t = 50;
float l = 100;

void setup(){
size(600,400);

}
 
void draw() {
//We need the noise value for a specific moment in time.

  background(0);
  
  float m = noise(t);
  float n = noise(l);
  float clr = map(m,0,1,0,255);
  m=map(m,0,1,0,width);
  n=map(n,0,1,0,height);
  
  fill(clr);
  ellipse(m,n,40,40);
  println("m - "+m+"n - "+ n);
  
  t = t+0.01;
  l=l+0.01;
}
