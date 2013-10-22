import de.bezier.data.sql.*;
import controlP5.*;

// fjenett 20081129



MBTilesLoaderUtils mbs;
MercatorMap mercatorMap;
ControlP5 cp5;

PImage img,retrievedImg;
import java.io.*;
ArrayList <PImage> imgs;
int count=0;

Knob knobA;

SQLite db;

PVector SanFrancisco,NewYork,London,Paris,Dubai,NewDelhi,HongKong,Beijing,Tokyo,Sydney;


void setup()
{
    size( 900, 700 );
    imgs = new ArrayList<PImage>();
   mbs = new MBTilesLoaderUtils();
  img = mbs.getMBTile(1,1,1,"jdbc:sqlite:/Users/test/Dropbox/ITP/ITP2013-14/ICM/week5/HW/SQLite_example1/control-room.mbtiles");
  
  for(int col=0;col<=1;col++){
    for(int row=0;row<=1;row++){
      retrievedImg = mbs.getMBTile(col,row,1,"jdbc:sqlite:/Users/test/Dropbox/ITP/ITP2013-14/ICM/week5/HW/SQLite_example1/control-room.mbtiles");
        imgs.add(retrievedImg);  
} }


  mercatorMap = new MercatorMap(512,512,85,-85,-180,180);
  SanFrancisco = mercatorMap.getScreenLocation(new PVector(37.8, -122.4));
  NewYork = mercatorMap.getScreenLocation(new PVector(40.6, -73.9));

  cp5 = new ControlP5(this);
  
  knobA = cp5.addKnob("knob")
             .setRange(0,100)
             .setValue(50)
             .setRadius(50)
             .setPosition(750,200)
             .snapToTickMarks(true)
             .setDragDirection(Knob.HORIZONTAL);
  
  //String path=this.getClass().getResource("Earthquake_data.mbtiles").getPath();
 //System.out.println(); 
  //img = mbs.getMBTile(0,0,0,"jdbc:sqlite:/Users/test/Dropbox/ITP/ITP2013-14/ICM/week5/HW/SQLite_example1/data/Earthquake_data.mbtiles");
  
  /*
    db = new SQLite( this, "test.db" );  // open database file

    if ( db.connect() )
    {
        // list table names
        db.query( "SELECT name as \"Name\" FROM SQLITE_MASTER where type=\"table\"" );
        
        while (db.next())
        {
            println( db.getString("Name") );
        }
        
        // read all in table "table_one"
        db.query( "SELECT * FROM table_one" );
        
        while (db.next())
        {
            println( db.getString("field_one") );
            println( db.getInt("field_two") );
        }
    }
    */
    
}


void draw(){

  //image(img,0,0);
  int m=0,n=0;
  pushMatrix();
  translate(width/2-256,height/2-256);
  //scale(1.3);
  for(int i=imgs.size()-1;i>=0;i--){
    PImage disp = imgs.get(i);
    //println("Width-"+disp.width +" Height-"+disp.height);
     
    if(count>=2){
     m=0;
     n=(count-2)*(disp.height);
     }
     
     else{
     m=disp.width;
     n=count*disp.height;
     }
    
    count++;
    image(disp,m,n);
    
    
  }
  
  
  
  
  noStroke();
  fill(255, 0, 0, 200);
  
  //ellipse(berlin.x, berlin.y, 6, 6);
  //ellipse(sydney.x, sydney.y, 6, 6);
  ellipse(SanFrancisco.x, SanFrancisco.y, 6, 6);
  ellipse(NewYork.x, NewYork.y, 6, 6);
  
  println(count);
  count=0;
  m=0;n=0;
  popMatrix();
}

