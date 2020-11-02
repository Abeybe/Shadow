ArrayList<PImage> video;

SecoundApplet secoundApplet;

class SecoundApplet extends PApplet{
  PApplet main;
  
  float time=0;
  float time(){return time=millis()/1000-time;}
  
  SecoundApplet(PApplet p){
    main=p;
    video=new ArrayList<PImage>();
  }
  void settings(){
    this.size(640,480);
  }
  void setup(){
    this.frameRate(1);
    time();
  }
  void draw(){
    if(!mainStart)return;
    if(time()<10){//1分間録画
      video.add(saveScreen());
    }else{//1分経ったら1分間再生
    
      if(video.size()>0){
        image(video.get(0),0,0,this.width,this.height);
        video.remove(0);
      }else{
        time=millis()/1000;
        //video=new ArrayList<PImage>();
      }
      
    }
  }
  PImage saveScreen(){
    PImage ret=this.createImage(main.width,main.height,RGB);
    mainLoadPixels();
    for(int i=0;i<main.pixels.length;i++){
      ret.pixels[i]=main.pixels[i];
    }
    return ret;
  }
}

void mainLoadPixels(){
  try{
    loadPixels();
  }catch(Exception e){
    println("Error");
  }
}