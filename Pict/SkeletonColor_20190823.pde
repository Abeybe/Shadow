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
PImage img;
int count = 4;
int str;
int r, g, b;
// ToiletChenger
int color_mode = 0;
// はーいチーズ用
int ms = 0;
int check = 0;


  
void settings(){
  fullScreen(P3D, 2);
  //size(1920, 1080, P3D);
}
void setup() {
 
  kinect = new KinectPV2(this);
  
  kinect.enableBodyTrackImg(true);
  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);

  kinect.init();
  img = loadImage("image01.png");
  // サブディスプレイのほうの画像
  img2 = loadImage("/data/pict1.png");
  img3 = loadImage("/data/pict2.png");
  img4 = loadImage("/data/pict3.png");
  img5 = loadImage("/data/pict4.png");
 
  
  String[] args = {"SecondApplet"};
  
  // サブウィンドウを開く
  SecondApplet sa = new SecondApplet();
  PApplet.runSketch(args, sa);  
  //frameRate(30);
  
}

void draw() {
  
  background(0);
  image(img, 0, 0, width, height);

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();  

  //individual JOINTS
  if(color_mode==3){
    for (int i = 0; i < skeletonArray.size(); i++) {
      KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
      if (skeleton.isTracked() && i<=4) {
        
        if (i%2 == 0){
          str = 255;
          r = 229;
          g = 1;
          b = 18;
          KJoint[] joints = skeleton.getJoints();
          drawBody(joints);
        }
        else{
          str = 255;
          r = 1;
          g = 117;
          b = 194;
          KJoint[] joints = skeleton.getJoints();
          drawBody(joints);
        }

        //color col  = skeleton.getIndexColor();  
        //draw different color for each hand state
        //drawHandState(joints[KinectPV2.JointType_HandRight]);
        //drawHandState(joints[KinectPV2.JointType_HandLeft]);
      }
    }
  }else {
    for (int i = 0; i < skeletonArray.size(); i++) {                                                          
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked() && i<=4) {
      KJoint[] joints = skeleton.getJoints();

      //color col  = skeleton.getIndexColor();
      drawBody(joints);
      //draw different color for each hand state
      //drawHandState(joints[KinectPV2.JointType_HandRight]);
      //drawHandState(joints[KinectPV2.JointType_HandLeft]);
    }
    }
  }

  //fill(255, 0, 0);
  //text(frameRate, 50, 50);
  //textSize(50);
  //text(kinect.getNumOfUsers(), 50, 50);
    //countDown();
    
  if(check == 1 && (ms + 1000) <= millis() && (ms + 2000) > millis()){
    fill(0);
    textSize(100);
    text("3", 120, 120);
  
  } else if(check == 1 && (ms + 2000) <= millis() && (ms + 3000) > millis()){
    fill(0);
    textSize(100);
    text("2", 120, 120);
  
  } else if(check == 1 && (ms + 3000) <= millis() && (ms + 4000) > millis()){
    fill(0);
    textSize(100);
    text("1", 120, 120);
  
  } else if(check == 1 && (ms + 4000) <= millis() && (ms + 5000) > millis()){
      saveFrame("/data/pict" + count + ".png");
      img2 = loadImage("/data/pict"+ count +".png");
      img3 = loadImage("/data/pict"+ (count - 1) +".png");
      img4 = loadImage("/data/pict"+ (count - 2) +".png");
      img5 = loadImage("/data/pict"+ (count - 3) +".png");
      count++;
      check = 0;
  }
    
}
/*
  void countDown(){
    int ms = millis()/1000;
    println(ms);
    fill(0);
    countDown = timeLimit - ms;
    if(countDown > 0){
      textSize(50);
      text("COUNT DOWN : "+countDown, 20, 40);
    } else {
      
    }
  }
*/
  void keyPressed(){
    if(key == 'p' || key == 'P'){
      ms = millis();
      check = 1;
      /*saveFrame("/data/pict" + count + ".png");
      img2 = loadImage("/data/pict"+ count +".png");
      img3 = loadImage("/data/pict"+ (count - 1) +".png");
      img4 = loadImage("/data/pict"+ (count - 2) +".png");
      img5 = loadImage("/data/pict"+ (count - 3) +".png");
      count++;*/
    }
    if(key == '1'){
     img = loadImage("image01.png");
     image(img, 0, 0, width, height);
     str = 255;
     r = 0;
     g = 173;
     b = 41;
     color_mode = 0;
    }
    if(key == '2'){
     img = loadImage("image02.png");
     image(img, 0, 0, width, height);
     str = 255;
     r = 0;
     g = 0;
     b = 0;
     color_mode = 0;
    }
    if(key == '3'){
     img = loadImage("image03.png");
     image(img, 0, 0, width, height);
     color_mode = 3;
    }
    if(key == '4'){
     img = loadImage("image04.png");
     image(img, 0, 0, width, height);
     str = 0;
     r = 255;
     g = 255;
     b = 255;
     color_mode = 0;
    }
    if(key == '5'){
     img = loadImage("image05.jpg");
     image(img, 0, 0, width, height);
     str = 255;
     r = 255;
     g = 255;
     b = 255;
     color_mode = 0;
    }    
    if(key == '6'){
     img = loadImage("image06.jpg");
     image(img, 0, 0, width, height);
     str = 0;
     r = 0;
     g = 0;
     b = 0;
     color_mode = 0;
    }    
    if(key == '7'){
     img = loadImage("image07.jpg");
     image(img, 0, 0, width, height);
     str = 255;
     r = 0;
     g = 0;
     b = 0;
     color_mode = 0;
    }    
    if(key == '8'){
     img = loadImage("image08.jpg");
     image(img, 0, 0, width, height);
     str = 255;
     r = 0;
     g = 0;
     b = 0;
     color_mode = 0;
    }    
    if(key == 'a'){
     img = loadImage("image09.jpg");
     image(img, 0, 0, width, height);
     str = 255;
     r = 0;
     g = 0;
     b = 0;
     color_mode = 0;
    }    
    if(key == 's'){
     img = loadImage("image10.jpg");
     image(img, 0, 0, width, height);
     str = 255;
     r = 0;
     g = 0;
     b = 0;
     color_mode = 0;
    }    
    if(key == 'd'){
     img = loadImage("image11.jpg");
     image(img, 0, 0, width, height);
     str = 255;
     r = 0;
     g = 0;
     b = 0;
     color_mode = 0;
    }    
    if(key == 'f'){
     img = loadImage("image12.jpg");
     image(img, 0, 0, width, height);
     str = 255;
     r = 0;
     g = 0;
     b = 0;
     color_mode = 0;
    }    
    if(key == 'g'){
     img = loadImage("image13.jpg");
     image(img, 0, 0, width, height);
     str = 255;
     r = 0;
     g = 0;
     b = 0;
     color_mode = 0;
    }    
    if(key == 'h'){
     img = loadImage("image14.jpg");
     image(img, 0, 0, width, height);
     str = 255;
     r = 0;
     g = 0;
     b = 0;
     color_mode = 0;
    }    
  }
  


//DRAW BODY
void drawBody(KJoint[] joints) {
  checkBodyScale(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineBase);  
  if(t > 0.4){
  //draw Frame
  
  //胴体
  drawBodyFrame(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineMid);
  drawBodyFrame(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_SpineBase);
  
  //胴体
  drawBodyStroke(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineMid);
  drawBodyStroke(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_SpineBase);
  //手
  drawLimbsFrame(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_ElbowRight);
  drawLimbsFrame(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_WristRight);
  drawHandFrame(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_HandRight);
  drawLimbsFrame(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ElbowLeft);
  drawLimbsFrame(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_WristLeft);
  drawHandFrame(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_HandLeft);
  
  
  //右手
  drawLimbsStroke(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_ElbowRight);
  drawLimbsStroke(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_WristRight);
  //左手
  drawLimbsStroke(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ElbowLeft);
  drawLimbsStroke(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_WristLeft);
  //足
  drawLimbsFrame(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight); 
  drawLimbsFrame(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_AnkleRight);
  drawFootFrame(joints, KinectPV2.JointType_AnkleRight, KinectPV2.JointType_FootRight);
  drawLimbsFrame(joints, KinectPV2.JointType_HipLeft, KinectPV2.JointType_KneeLeft);
  drawLimbsFrame(joints, KinectPV2.JointType_KneeLeft, KinectPV2.JointType_AnkleLeft);
  drawFootFrame(joints, KinectPV2.JointType_AnkleLeft, KinectPV2.JointType_FootLeft);
  //右足
  drawLimbsStroke(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight); 
  drawLimbsStroke(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_AnkleRight);
  //左足
  drawLimbsStroke(joints, KinectPV2.JointType_HipLeft, KinectPV2.JointType_KneeLeft);
  drawLimbsStroke(joints, KinectPV2.JointType_KneeLeft, KinectPV2.JointType_AnkleLeft);
  
  
  
  //draw Stroke
  
  
  
  drawJoint(joints, KinectPV2.JointType_Head);
  }
}

//draw joint
float s;
float t;
float u;
void checkBodyScale(KJoint[] joints, int jointType1, int jointType2){
  //println("Type1の値"+joints[jointType1].getY());
  //println("Type2の値"+joints[jointType2].getY());
  //println(joints[jointType2].getY()-joints[jointType1].getY());
  s = joints[jointType2].getX()-joints[jointType1].getX();
  u = joints[jointType2].getY()-joints[jointType1].getY();
  s = s*s;
  u = u*u;
  t = sqrt(s + u);
  t = t / 300; 
  println("tの値＝"+t);
};
//頭の描画
void drawJoint(KJoint[] joints, int jointType) {
  pushMatrix();
  stroke(str);
  strokeWeight(2);
  translate(joints[jointType].getX()*(float)width/1920, joints[jointType].getY()*(float)height/1080, joints[jointType].getZ());
  fill(r, g, b);
  ellipse(0, 0, 130*t, 130*t);
  popMatrix(); 
}
//胴体の描画(枠)
void drawBodyFrame(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  stroke(str);
  strokeWeight(2);
  translate(joints[jointType1].getX()*(float)width/1920, joints[jointType1].getY()*(float)height/1080, joints[jointType1].getZ());
  ellipse(0, 0, 120*t, 110*t);
  popMatrix();
  pushMatrix();
  stroke(str);
  strokeWeight(120*t);
  line(joints[jointType1].getX()*(float)width/1920, joints[jointType1].getY()*(float)height/1080, joints[jointType1].getZ(), joints[jointType2].getX()*(float)width/1920, joints[jointType2].getY()*(float)height/1080, joints[jointType2].getZ());
  popMatrix();
}
//draw bone
//手足の描画(枠)
void drawLimbsFrame(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  stroke(str);
  strokeWeight(2*t); 
  translate(joints[jointType1].getX()*(float)width/1920, joints[jointType1].getY()*(float)height/1080, joints[jointType1].getZ());
  ellipse(0, 0, 60*t, 60*t);
  popMatrix();
  pushMatrix();
  stroke(str);
  strokeWeight(60*t);
  line(joints[jointType1].getX()*(float)width/1920, joints[jointType1].getY()*(float)height/1080, joints[jointType1].getZ(), joints[jointType2].getX()*(float)width/1920, joints[jointType2].getY()*(float)height/1080, joints[jointType2].getZ());
  popMatrix();
}
//手先の描画
void drawHandFrame(KJoint[] joints, int jointType1, int jointType2){
  pushMatrix();
  stroke(str);
  strokeWeight(2*t); 
  translate(joints[jointType1].getX()*(float)width/1920, joints[jointType1].getY()*(float)height/1080, joints[jointType1].getZ());
  fill(r, g, b);
  ellipse(0, 0, 60*t, 60*t);
  popMatrix();
}
//足先の描画
void drawFootFrame(KJoint[] joints, int jointType1, int jointType2){
  pushMatrix();
  stroke(str);
  strokeWeight(2*t); 
  translate(joints[jointType1].getX()*(float)width/1920, joints[jointType1].getY()*(float)height/1080, joints[jointType1].getZ());
  fill(r, g, b);
  ellipse(0, 0, 60*t, 60*t);
  popMatrix();
}
//胴体の描画
void drawBodyStroke(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  strokeWeight(0*t);
  translate(joints[jointType1].getX()*(float)width/1920, joints[jointType1].getY()*(float)height/1080, joints[jointType1].getZ());
  fill(r, g, b);
  ellipse(0, 0, 120*t, 110*t);
  popMatrix();
  pushMatrix();
  stroke(r, g, b);
  strokeWeight(118*t);
  line(joints[jointType1].getX()*(float)width/1920, joints[jointType1].getY()*(float)height/1080, joints[jointType1].getZ(), joints[jointType2].getX()*(float)width/1920, joints[jointType2].getY()*(float)height/1080, joints[jointType2].getZ()); 
  popMatrix();
}
//draw bone
//手足の描画
void drawLimbsStroke(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  translate(joints[jointType1].getX()*(float)width/1920, joints[jointType1].getY()*(float)height/1080, joints[jointType1].getZ());
  strokeWeight(0*t);
  fill(r, g, b);
  ellipse(0, 0, 60*t, 60*t);
  popMatrix();
  pushMatrix();
  stroke(r, g, b);
  strokeWeight(58*t);
  line(joints[jointType1].getX()*(float)width/1920, joints[jointType1].getY()*(float)height/1080, joints[jointType1].getZ(), joints[jointType2].getX()*(float)width/1920, joints[jointType2].getY()*(float)height/1080, joints[jointType2].getZ());
  popMatrix();
  }

//draw hand state
void drawHandState(KJoint joint) {
  //handState(joint.getState());
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  noStroke();
  ellipse(0, 0, 60*t, 60*t);
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