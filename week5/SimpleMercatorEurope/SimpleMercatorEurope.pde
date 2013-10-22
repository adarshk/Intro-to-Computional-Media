PImage europeMapImage;
MercatorMap mercatorMap;

PVector berlin;
PVector london;
PVector venice;
PVector istanbul;

void setup() {
  size(700, 395);
  smooth();
  
  // Loading exported image
  europeMapImage = loadImage("europe.png");
  // Map with dimension and bounding box
  mercatorMap = new MercatorMap(700, 395, 56.54, 39.88, -12.56, 32.34);

  berlin = mercatorMap.getScreenLocation(new PVector(52.5, 13.34));
  london = mercatorMap.getScreenLocation(new PVector(51.5f, -0.1f));
  venice = mercatorMap.getScreenLocation(new PVector(45.44, 12.34));
  istanbul = mercatorMap.getScreenLocation(new PVector(41.01, 28.98));
}

void draw() {
  image(europeMapImage, 0, 0, width, height);

  stroke(0, 40);
  fill(0, 255, 200, 100);
  
  ellipse(berlin.x, berlin.y, 12, 12);
  ellipse(london.x, london.y, 12, 12);
  ellipse(venice.x, venice.y, 12, 12);
  ellipse(istanbul.x, istanbul .y, 12, 12);
}

