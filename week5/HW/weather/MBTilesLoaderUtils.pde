
//Note - Code below adapted from tillnagel.com. Changed sqlite command and other code to suit this sketch.


/**
 * Loads map tile images from a MBTiles SQLite database.
 * 
 * You need to provide the jdbcConnectionString to connect to the database file. e.g.
 * "./data/my-map.mbtiles"
 * 
 * This class is part of the <a href="http://code.google.com/p/unfolding/">Unfolding</a> map
 * library. See <a href="http://tillnagel.com/2011/06/tilemill-for-processing/">TileMill for
 * Processing</a> for more information.
 */

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.imageio.ImageIO;

import processing.core.PConstants;
import processing.core.PImage;


public class MBTilesLoaderUtils {


  public static final String SQLITE_JDBC_DRIVER = "org.sqlite.JDBC";

  /**
   * Loads the tile for given parameters as image.
   * 
   * @param column
   *            The column of the tile.
   * @param row
   *            The row of the tile.
   * @param zoomLevel
   *            The zoom level of the tile.
   * @param jdbcConnectionString
   *            The path to the MBTiles database.
   * @return The tile as PImage, or null if not found.
   */
  public  PImage getMBTile(int column, int row, int zoomLevel, String jdbcConnectionString) {
    PImage img = null;

    try {
      byte[] tileData = getMBTileData(column, row, zoomLevel, jdbcConnectionString);
      if (tileData != null) {
        img = getAsImage(tileData);
      } 
      else {
        System.err.println("No tile found for " + column + "," + row + " " + zoomLevel);
      }
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
    return img;
  }

  /**
   * Loads the MBTile data from the database as blob, and returns it as byte array.
   * 
   * @param column
   *            The column of the tile.
   * @param row
   *            The row of the tile.
   * @param zoomLevel
   *            The zoom level of the tile.
   * @return The tile as byte array with image information, or an empty array if not found.
   */
  protected  byte[] getMBTileData(int column, int row, int zoomLevel, String jdbcConnectionString)
  throws Exception {
    Class.forName(SQLITE_JDBC_DRIVER);
    Connection conn = DriverManager.getConnection(jdbcConnectionString);
    Statement stat = conn.createStatement();
    

    String sqlStatement = "SELECT * FROM map JOIN images ON map.tile_id = images.tile_id WHERE tile_column ="+column+" AND tile_row = "+row+" AND zoom_level ="+zoomLevel;
    
    //PreparedStatement prep = conn.prepareStatement("SELECT * FROM map WHERE tile_column = ? AND tile_row = ? AND zoom_level = ?;");
    PreparedStatement prep = conn.prepareStatement(sqlStatement);
    
    
    //prep.setInt(1, column);
    //prep.setInt(2, row);
    //prep.setInt(3, zoomLevel);
    //System.out.println("here");
    ResultSet rs = prep.executeQuery();

    byte[] tileData = new byte[0];
    int t=1;

    while (rs.next ()) {
      
      tileData = rs.getBytes("tile_data");
    }

    /*
    //while (rs.next()) {
     System.out.println("here");
     tileData = rs.getBytes(1);
     tileData = rs.getBytes(2);
     tileData = rs.getBytes(3);
     //t=t+1;
     //}
     */
    rs.close();
    stat.close();
    conn.close();

    return tileData;
  }

  /**
   * Converts the byte array into a PImage. Expects the byte array to be in ARGB (RGB with alpha
   * channel).
   * 
   * Adapted from toxi
   * 
   * @param bytes
   *            The image information as byte array.
   * @return A PImage.
   */
  protected PImage getAsImage(byte[] bytes) {
    try {
      ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
      BufferedImage bimg = ImageIO.read(bis);
      PImage img = new PImage(bimg.getWidth(), bimg.getHeight(), PConstants.ARGB);
      bimg.getRGB(0, 0, img.width, img.height, img.pixels, 0, img.width);
      img.updatePixels();
      return img;
    } 
    catch (Exception e) {
      System.err.println("Can't create image from buffer");
      e.printStackTrace();
    }
    return null;
  }
}

