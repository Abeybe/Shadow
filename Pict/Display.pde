//サブディスプレイのほうの設定


PImage img2;
PImage img3;
PImage img4;
PImage img5;

public class SecondApplet extends PApplet{
  
  void settings(){
  fullScreen(1);
  }
  
  void setup(){
  }
  
  void draw(){
  image(img2, 0, 0, width/2, height/2);
  image(img3, width/2, 0, width/2, height/2);
  image(img4, 0, height/2, width/2, height/2);
  image(img5, width/2, height/2, width/2, height/2);
  }
  
}