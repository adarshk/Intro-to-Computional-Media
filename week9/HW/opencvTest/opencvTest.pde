import org.opencv.video.*;
import org.opencv.core.*;
import org.opencv.calib3d.*;
import org.opencv.contrib.*;
import org.opencv.objdetect.*;
import org.opencv.imgproc.*;
import org.opencv.utils.*;
import org.opencv.features2d.*;
import org.opencv.highgui.*;
import org.opencv.ml.*;
import org.opencv.photo.*;
import gab.opencv.*;
import java.awt.*;
import java.io.File;
import javax.imageio.ImageIO;
import java.io.*;
import java.awt.image.BufferedImage;

Objdetect obj;
FeatureDetector fd;
//OpenCV opencv;
PImage img1,img2;
PImage gray;
Mat img_1,img_2;
OpenCV opencv;

public static final int FAST = 1;

void setup(){
  size(400,400); 
  
  BufferedImage img = null;
  try {
    img = ImageIO.read(new File("strawberry.jpg"));
} catch (IOException e) {
}

   img1 = loadImage("before.jpg");
   img2 = loadImage("after.jpg");
   gray = createImage(img1.width,img1.height,GRAY); 
  //fd.create(1);
  //Mat mf = new Mat();
  //Mat m = Highgui.imread("before.jpg");
  simg_1 = new Mat(img1.width,img1.height,CvType.CV_8UC1);
  // img_1.put(0,0,m);
  //,img_2;
  
  int minHessian = 400;
  
 // Imgproc.cvtColor(img1,gray,CV_RGB2GRAY);
  //fd.create();
}


void draw(){
  
  
}

