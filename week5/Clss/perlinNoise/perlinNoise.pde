float t2=0;
void setup() {

  size(600, 400);
}


void draw() {

  background(0);
  randomSeed(5);

  stroke(255);
  noFill();

  beginShape();
  float t1 = 0;
  for (int i=0;i<width;i++)

    //float offset = random(-100,100);
    float offset = map(noise(t1, t2), 0, 1, -100, 100));
  vertex(i, 200+offset);
  t1 = t1+0.01;

  endShape();
  t2 = t2 + 0.01;
}

