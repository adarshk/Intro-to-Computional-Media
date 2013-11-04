PImage worldMapImage;
MercatorMap mercatorMap;

PVector berlin;
PVector sydney;
PVector sanFrancisco;

void setup() {
  size(800, 800);
  smooth();
  
  // World map from http://en.wikipedia.org/wiki/File:Mercator-projection.jpg 
  worldMapImage = loadImage("world-map-plain.png");
  // Using default bounding box
  mercatorMap = new MercatorMap(800, 800,85.0511,-85.0511,-180,180);
  
  berlin = mercatorMap.getScreenLocation(new PVector(52, 13));
  sydney = mercatorMap.getScreenLocation(new PVector(-33.86, 151.21));
  sanFrancisco = mercatorMap.getScreenLocation(new PVector(37.8, -122.4));
}

void draw() {
  image(worldMapImage, 0, 0, width, height);

  noStroke();
  fill(255, 0, 0, 200);
  
  ellipse(berlin.x, berlin.y, 6, 6);
  ellipse(sydney.x, sydney.y, 6, 6);
  ellipse(sanFrancisco.x, sanFrancisco.y, 6, 6);
}


