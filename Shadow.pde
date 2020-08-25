/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/

 KinectPV2, Kinect for Windows v2 library for processing

 Body Test with the number of users
 */

import KinectPV2.*;

KinectPV2 kinect;

boolean foundUsers = false;

void setup() {
  //size(640,480);
  fullScreen(2);

  kinect = new KinectPV2(this);

  kinect.enableBodyTrackImg(true);
  kinect.enableDepthMaskImg(true);

  kinect.init();
}

void draw() {
  background(255);
  

  //image(kinect.getBodyTrackImage(), 0, 0, 320, 240);

  ////get the body track combined with the depth information
  //image(kinect.getDepthMaskImage(), 0, 240, 320, 240);

  //obtain an ArrayList of the users currently being tracked
  ArrayList<PImage> bodyTrackList = kinect.getBodyTrackUser();

  //iterate through all the users
  for (int i = 0; i < bodyTrackList.size(); i++) {
    PImage bodyTrackImg = (PImage)bodyTrackList.get(i);
    if (i <= 2)
      image(bodyTrackImg,0, 0, width,height);
    else
      image(bodyTrackImg, 0,0, width,height );
  }
  
  
  filter(BLUR,0.5);

  //fill(0);
  //textSize(16);
  //text(kinect.getNumOfUsers(), 50, 50);
  //text(bodyTrackList.size(), 50, 70);
}

void mousePressed() {
  println(frameRate);
}