
class PlayApplet extends PApplet{
  PApplet main;
  float time=0;
  float time(){return time=millis()/1000-time;}
  
  PlayApplet(PApplet p){
    main=p;
    video=new ArrayList<PImage>();
  }
  void settings(){
    this.size(640,480);
    this.frameRate(8);
  }
  void setup(){
    time();
  }
  void draw(){
    if(time()<60){//1分間録画
      video.add(saveScreen());
    }else{//1分経ったら1分間再生
      
    }
  }
  PImage saveScreen(){
    PImage ret=createImage(main.width,main.height,RGB);
    main.loadPixels();
    for(int i=0;i<main.pixels.length;i++){
      ret.pixels[i]=main.pixels[i];
    }
    return ret;
  }
}