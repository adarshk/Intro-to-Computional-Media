//Note - This program is not completed yet as I ran out of time 
//however I am continuing to work on it.
// The program runs as is if you want to take a look.

  /*
  What the program does -
  1. Allows the user to select a file (commented out while in development)
  2. Retrieves map tiles and real time yahoo weather
  
  I have to work on the doing the animation for each city depending on the temperature in the city

  */
import com.onformative.yahooweather.*;

import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

import controlP5.*;

import org.dishevelled.processing.executor.*;
import java.util.concurrent.TimeUnit;

MBTilesLoaderUtils mbs;
MercatorMap mercatorMap;
ControlP5 cp5;
YahooWeather weather,weather2;
Executor executor;
ArrayList <YahooWeather> cities;
int updateIntervallMillis = 30000; 

PVector[] windParticles = new PVector[1000];

PImage img1, retrievedImg1;
PImage img2, retrievedImg2;
PImage img3, retrievedImg3;
import java.io.*;
ArrayList <PImage> imgs1,imgs2,imgs3,imgs4;
int count=0;
int zoomLevel =2;
String filePath;

Knob knobA;

SQLite db;

PVector SanFrancisco, NewYork, London, Paris,Berlin, Dubai, NewDelhi, HongKong, Beijing, Tokyo, Sydney;


void setup()
{
  size( 1024, 900 );
  imgs1 = new ArrayList<PImage>();
  imgs2 = new ArrayList<PImage>();
  mbs = new MBTilesLoaderUtils();
  
  filePath = sketchPath("")+ "/control-room.mbtiles";
  
  println(filePath);
  
  //Call the statements below if you want the user to select the file
  
  /*
  selectInput("Select a file to process:", "fileSelected");
  
  noLoop();
  
  interrupt();
  
  println(filePath);


  */

  
  
  img1 = mbs.getMBTile(1,1, 1, "jdbc:sqlite:"+filePath);


  //For zoom level 1
  for (int col1=0;col1<=1;col1++) {
    for (int row1=0;row1<=1;row1++) {
      retrievedImg1 = mbs.getMBTile(col1, row1, 1, "jdbc:sqlite:"+filePath);
      imgs1.add(retrievedImg1);
    }}

   
   for (int col2=0;col2<=3;col2++) {
    for (int row2=0;row2<=3;row2++) {
      //retrievedImg2 = mbs.getMBTile(col2, row2, 2, "jdbc:sqlite:/Users/test/Dropbox/ITP/ITP2013-14/ICM/week5/HW/SQLite_example1/control-room.mbtiles");
      retrievedImg2 = mbs.getMBTile(col2, row2, 2, "jdbc:sqlite:"+filePath);
      imgs2.add(retrievedImg2);
    }}

   //Use the statements below to allow the user to control zoom with the knob
   
  /*
  cp5 = new ControlP5(this);

  knobA = cp5.addKnob("knob")
    .setRange(0, 100)
      .setValue(50)
        .setRadius(50)
          .setPosition(750, 200)
            .snapToTickMarks(true)
              .setDragDirection(Knob.HORIZONTAL);

  */
  
    weather = new YahooWeather(this, 638242, "c", updateIntervallMillis);
    weather2 = new YahooWeather(this, 2459115, "c", updateIntervallMillis);
    cities = new ArrayList<YahooWeather>();
    cities.add(weather);
    cities.add(weather2);

  for (int i=0; i<windParticles.length; i++) {
    windParticles[i] = new PVector(random(width), random(height));
  }

}


void draw() {

  for (int c=cities.size()-1;c>=0;c--) {
    YahooWeather wet = cities.get(c);
    wet.update();
   
    
    
  
  //weather.update();
  
  
  background(205);
  
  if(zoomLevel==1){
  
  //image(img,0,0);
  
  
  int m=0, n=0;count=0;
  pushMatrix();
  translate((width/2)-256, (height/2)-256);
  //scale(1.3);
  for (int i=0;i<=imgs1.size()-1;i+=2) {
    PImage disp = imgs1.get(i);
    //println("Width-"+disp.width +" Height-"+disp.height);

  n=disp.height;
  m=(i/2)*disp.width;

  //if(i==0){m=0;n=disp.height;}
  //if(i==1){m=0;n=0;}
  //if(i==2){m=disp.width;n=disp.height;}
  //if(i==3){m=disp.width;n=0;}
  
    //count++;
    image(disp, m, n);
  }

  for (int j=1;j<=imgs1.size()-1;j+=2) {
    PImage disp = imgs1.get(j);
    //println("Width-"+disp.width +" Height-"+disp.height);

  n=0;
  m=int((j/2))*disp.width;

    //count++;
    image(disp, m, n);
  }



  mercatorMap = new MercatorMap(512, 512, 85, -85, -180, 180);
  fill(255);
  text("City -" + wet.getCityName() + "  Lat - "+wet.getLatitude() +"  Long - "+ wet.getLongitude()+"C",20,40);
  
  //SanFrancisco = mercatorMap.getScreenLocation(new PVector(37.8, -122.4));
 if(c==0)
 Berlin = mercatorMap.getScreenLocation(new PVector(wet.getLatitude(),wet.getLongitude()));
 if(c==1)
 NewYork = mercatorMap.getScreenLocation(new PVector(wet.getLatitude(),wet.getLongitude()));
  //NewYork = mercatorMap.getScreenLocation(new PVector(40.6, -73.9));
  
  noStroke();
  fill(255, 0, 0, 200);

  if(c==0)
  ellipse(Berlin.x, Berlin.y, 6, 6);
  
  //ellipse(sydney.x, sydney.y, 6, 6);
  //ellipse(SanFrancisco.x, SanFrancisco.y, 6, 6);
  if(c==1)
  ellipse(NewYork.x, NewYork.y, 6, 6);

  //println(count);
  popMatrix();
  

  
  }
  
  
  
  
 if(zoomLevel==2){
 
  int m=0, n=0;count=0;
  pushMatrix();
  //translate((width/2)-256, (height/2)-256);
  //scale(1.3);
  for (int i=0;i<=imgs2.size()-1;i+=4) {
    PImage disp = imgs2.get(i);
    //println("Width-"+disp.width +" Height-"+disp.height);

  n=3*disp.height;
  m=(i/4)*disp.width;

  
    image(disp, m, n);
  }

  for (int j=1;j<=imgs2.size()-1;j+=4) {
    PImage disp = imgs2.get(j);

  n=2*disp.height;
  m=int((j/4))*disp.width;

    image(disp, m, n);
  }

  for (int k=2;k<=imgs2.size()-1;k+=4) {
    PImage disp = imgs2.get(k);

  n=disp.height;
  m=int((k/4))*disp.width;

    image(disp, m, n);
  }
  
  for (int l=3;l<=imgs2.size()-1;l+=4) {
    PImage disp = imgs2.get(l);

  n=0;
  m=int((l/4))*disp.width;

    image(disp, m, n);
  }
  
  mercatorMap = new MercatorMap(1024, 1024, 85, -85, -180, 180);
  fill(255);
  text("City -" + wet.getCityName() + "  Lat - "+wet.getLatitude() +"  Long - "+ wet.getLongitude() + "  Temp - " + wet.getTemperature() +"C",20,40);
  
  //SanFrancisco = mercatorMap.getScreenLocation(new PVector(37.8, -122.4));
     //if(c==0)
     Berlin = mercatorMap.getScreenLocation(new PVector(wet.getLatitude(),wet.getLongitude()));
     
     //if(c==1)
     NewYork = mercatorMap.getScreenLocation(new PVector(wet.getLatitude(),wet.getLongitude()));
     //NewYork = mercatorMap.getScreenLocation(new PVector(40.6, -73.9));
  
  noStroke();
  fill(255, 0, 0, 200);

  //if(c==0)
  ellipse(Berlin.x, Berlin.y, 6, 6);
  //ellipse(sydney.x, sydney.y, 6, 6);
  //ellipse(SanFrancisco.x, SanFrancisco.y, 6, 6);
  //if(c==1)
  ellipse(NewYork.x, NewYork.y, 6, 6);
  popMatrix();
   
 }
  
  
  if(wet.getTemperature() <20){
  fill(255, 30);
  drawWind();
  }
 }
 
 
   
 
 }

void interrupt(){
    
  while(filePath==null){
  
     delay(200);
  }
  
  loop();

}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    filePath = selection.getAbsolutePath();
    
  }
}

void mousePressed(){

    if(zoomLevel==1)zoomLevel=2;
    else if(zoomLevel==2)zoomLevel=1;

}


void drawWind() {
  int size = 4;

  for (int i=0; i<windParticles.length; i++) {
    windParticles[i].add(getNormalizedPVector(weather.getWindDirection()));

    if (windParticles[i].x<0)windParticles[i].x=width;
    if (windParticles[i].x>width)windParticles[i].x=0;
    if (windParticles[i].y<0)windParticles[i].y=height;
    if (windParticles[i].y>height)windParticles[i].y=0;
    fill(255, 30);
    ellipse(windParticles[i].x, windParticles[i].y, size, size);
  }
}

/**
 * transforming the wind direction of yahoo into a normalizes vector 
*/
PVector getNormalizedPVector(int direction) {
  int numPoints = 360;
  float angle = TWO_PI/(float)numPoints;
  direction = 360-direction;
  direction += 180;
  return new PVector(sin(angle*direction), cos(angle*direction));
}


