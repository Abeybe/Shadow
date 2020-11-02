/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/

 KinectPV2, Kinect for Windows v2 library for processing

 Skeleton color map example.
 Skeleton (x,y) positions are mapped to match the color Frame
 */

import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;

boolean foundUsers = false;

PImage k_Color,k_Color2,k_Mask,k_Mask2,k_Black;
float k_Ratio,k_newjointRatioX,k_newjointRatioY;
PVector k_newjoint ;

boolean mainStart=false;

void settings(){
  fullScreen(P3D,2);  
}

void setup() {
  //size(1980 , 1080, P3D);

  kinect = new KinectPV2(this);

  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);

  kinect.enableDepthImg(true);
  kinect.enableBodyTrackImg(true);
  k_newjoint = new PVector(0,0,0);

  kinect.init();
  
  k_Color2 = createImage(width, height, PImage.RGB);
  k_Mask2 = createImage(width, height, PImage.RGB);
  k_Black = createImage(width, height, PImage.RGB);
  
  //secoundApplet=new SecoundApplet(this);
  //PApplet.runSketch(new String[]{"Secound"},secoundApplet);
}

void draw() {
  if(!mainStart)mainStart=true;
  background(255);
  frameRate(30);
  //image(kinect.getColorImage(), 0, 0, width, height);
  //image(kinect.getBodyTrackImage(), 0, 0, width, height);
  k_Color = kinect.getColorImage();

  k_Mask = kinect.getBodyTrackImage();
  //k_Mask.filter(INVERT);
  //k_Color2 = get(0,0,1980, 1080);
  //image(k_Color,0,0,1980, 1080);
  k_Color2 = get(0,0,width,height);//get(0,0,1980, 1080);
  
  k_Ratio = height / k_Mask.width;
  //println(k_Ratio);
  
  filter(BLUR,2);
  
  pushMatrix();
    scale(-1,1);
    translate(-width,-300);
    image(k_Mask,-width,0,k_Mask.width*3.85, k_Mask.height*3.85);
    //image(k_Mask3,0,0);
  
    k_Mask2 = get(0,0,width,height);//get(0,0,1980, 1080);
  
    //translate(width/2,0);
    k_Color2.mask(k_Mask2);
    //image(k_Color2,0,0,width,height);
    //image(k_Mask2,0,0,width,height);
  popMatrix();
  
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked() && skeletonArray.size()==1) {
      KJoint[] joints = skeleton.getJoints();

      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
      drawBody(joints);

      //draw different color for each hand state
      //drawHandState(joints[KinectPV2.JointType_HandRight]);
      //drawHandState(joints[KinectPV2.JointType_HandLeft]);
    }
  }
  
}

//DRAW BODY
void drawBody(KJoint[] joints) {
/*
  drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_Neck);
  drawBone(joints, KinectPV2.JointType_Neck, KinectPV2.JointType_SpineShoulder);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineMid);
  drawBone(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_SpineBase);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderRight);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderLeft);
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipRight);
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipLeft);

  // Right Arm
  drawBone(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_ElbowRight);
  drawBone(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_WristRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_HandRight);
  drawBone(joints, KinectPV2.JointType_HandRight, KinectPV2.JointType_HandTipRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_ThumbRight);

  // Left Arm
  drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ElbowLeft);
  drawBone(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_WristLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_HandLeft);
  drawBone(joints, KinectPV2.JointType_HandLeft, KinectPV2.JointType_HandTipLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_ThumbLeft);

  // Right Leg
  drawBone(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight);
  drawBone(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_AnkleRight);
  drawBone(joints, KinectPV2.JointType_AnkleRight, KinectPV2.JointType_FootRight);

  // Left Leg
  drawBone(joints, KinectPV2.JointType_HipLeft, KinectPV2.JointType_KneeLeft);
  drawBone(joints, KinectPV2.JointType_KneeLeft, KinectPV2.JointType_AnkleLeft);
  drawBone(joints, KinectPV2.JointType_AnkleLeft, KinectPV2.JointType_FootLeft);
*/
  drawJoint(joints, KinectPV2.JointType_HandTipLeft);
  drawJoint(joints, KinectPV2.JointType_HandTipRight);
  drawJoint(joints, KinectPV2.JointType_FootLeft);
  drawJoint(joints, KinectPV2.JointType_FootRight);

  drawJoint(joints, KinectPV2.JointType_ThumbLeft);
  drawJoint(joints, KinectPV2.JointType_ThumbRight);

  drawJoint(joints, KinectPV2.JointType_Head);
}

//draw joint
void drawJoint(KJoint[] joints, int jointType) {
  
  k_newjointRatioX = joints[jointType].getX() - width/2;
  k_newjointRatioY = joints[jointType].getY() - height/2;
  
  //k_newjoint.x = joints[jointType].getX();
  k_newjoint.x = map(k_newjointRatioX,-width/2,width/2,-250,width+250);
  //k_newjoint.y = joints[jointType].getY();
  k_newjoint.y = map(k_newjointRatioY,-height/2,height/2,-150,height+100);

  k_newjoint.z = joints[jointType].getZ();
  
  pushMatrix();
  translate(k_newjoint.x, k_newjoint.y, k_newjoint.z);
  //translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
  ellipse(0, 0, 25, 25);
  popMatrix();
}

//draw bone
void drawBone(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
  ellipse(0, 0, 25, 25);
  popMatrix();
  line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
}

//draw hand state
void drawHandState(KJoint joint) {
  noStroke();
  handState(joint.getState());
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  ellipse(0, 0, 70, 70);
  popMatrix();
}

/*
Different hand state
 KinectPV2.HandState_Open
 KinectPV2.HandState_Closed
 KinectPV2.HandState_Lasso
 KinectPV2.HandState_NotTracked
 */
void handState(int handState) {
  switch(handState) {
  case KinectPV2.HandState_Open:
    fill(0, 255, 0);
    break;
  case KinectPV2.HandState_Closed:
    fill(255, 0, 0);
    break;
  case KinectPV2.HandState_Lasso:
    fill(0, 0, 255);
    break;
  case KinectPV2.HandState_NotTracked:
    fill(255, 255, 255);
    break;
  }
}