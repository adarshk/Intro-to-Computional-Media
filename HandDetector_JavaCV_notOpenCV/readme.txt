
NUI Chapter 5.5. Hand and Finger Detection

From the website:

  Killer Game Programming in Java
  http://fivedots.coe.psu.ac.th/~ad/jg

  Dr. Andrew Davison
  Dept. of Computer Engineering
  Prince of Songkla University
  Hat yai, Songkhla 90112, Thailand
  E-mail: ad@fivedots.coe.psu.ac.th


If you use this code, please mention my name, and include a link
to the website.

Thanks,
  Andrew

============================

This directory contains 4 Java files:
  * Handy.java, HandPanel.java,
    HandDetector.java FingerName.java

One HSV configuration file:
  * gloveHSV.txt


Two batch files:
  * compile.bat
  * run.bat
     - make sure they refer to the correct locations for your
       downloads of JavaCV and OpenCV


----------------------------
Before Compilation/Execution:

You need to have a webcam connected to your PC.

You need to download and install:

  * OpenCV:  I downloaded v2.4.5 for Windows with pre-compiled binaries:
             from http://opencv.org/downloads.html
             and installed it in C:\opencv

  * JavaCV:  http://code.google.com/p/javacv/
             I downloaded javacv-0.5-bin.zip
             and installed it in d:\javacv-bin

----------------------------
Physical Materials:

You need a colored glove for your left hand, whose HSV values match those in 
gloveHSV.txt. The contents of this configuration file
can be created with the help of the HSVSelector application, which is described
in NUI chapter 5 (http://fivedots.coe.psu.ac.th/~ad/jg/nui05/).

----------------------------
Compilation:

> compile *.java
    // you must have JavaCV and OpenCV installed

----------------------------
Execution:

> run Handy
    // you must have JavaCV and OpenCV installed

----------------------------
Last updated: 7th July 2013
