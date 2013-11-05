PImage worldMapImage;
MercatorMap mercatorMap;

PVector berlin;
PVector sydney;
PVector sanFrancisco;

int tweetIndex;
TwitterSearch tweets;
String searchQuery;

Guardian gdn;
NYTimes nyt;
//http://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&sensor=false
/*
1. Hurricane Sandy
2. Kate Middleton pictures released
3. Olympics 2012
4. SOPA debate
5. Costa Concordia crash
6. Presidential Debate
7. Stratosphere jump
8. Penn State scandal
9. Trayvon Martin shooting
10. Pussy Riot

*/


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
  
  tweets = new TwitterSearch();
  
  gdn = new Guardian();
  nyt = new NYTimes();
  processing.data.JSONArray articles = nyt.getAllArticles("Snowden&from-date=2013-08-01&to-date=2013-11-03");
  
  for(int i = 0 ; i < articles.size(); i++) {
     println(articles.getJSONObject(i).getJSONObject("headline").getString("main")); 
  }
  
  tweets.getSearchTweets("Snowden",100);

}

void draw() {
  image(worldMapImage, 0, 0, width, height);

  noStroke();
  fill(255, 0, 0, 200);
  
  ellipse(berlin.x, berlin.y, 6, 6);
  ellipse(sydney.x, sydney.y, 6, 6);
  ellipse(sanFrancisco.x, sanFrancisco.y, 6, 6);
}


