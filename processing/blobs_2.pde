class Blob {
  float minx;
  float miny;
  float maxx;
  float maxy;
  
  color thisColor;
  float glow=90;
  float glow_rate;
  
  float screenCX;
  float screenCY;
  
  int id=0;
  
  int net=30;
  
  boolean taken = false;
  
  boolean hasBug = false;
  
  Blob(float x, float y, color trackColor, float thisGlowRate){
    minx=x;
    miny=y;
    maxx=x;
    maxy=y;
    thisColor=trackColor;
    glow_rate=thisGlowRate;
  }

  void show(){
    pushMatrix();
    scale(-1,1);
    translate(-width,0);
    float nminx=normalize(minx,0,video.width,0,width);
    float nminy=normalize(miny,0,video.height,0,height);
    float cx=screenX((width-nminx-50), nminy);
    float cy=screenY(nminx, nminy)+50;
    //float nmaxx=normalize(maxx,0,video.width,0,width);
    //float nmaxy=normalize(maxy,0,video.height,0,height);
    flashlight(cx, cy, thisColor);
    if(thisColor==trackLight){
      user();
    }
    popMatrix();
    screenCX=width-nminx-50;
    screenCY=screenY(nminx, nminy)+50;
  }
  
  PVector getCenter(){
    float cx=(maxx-minx)*.5 + minx;
    float cy=(maxy-miny)*.5 + miny;
    return new PVector(cx,cy);
  }
  
  void become(Blob other){
    minx = other.minx;
    maxx = other.maxx;
    miny = other.miny;
    maxy= other.maxy;
    thisColor=other.thisColor;
  }
  
  float sCX(){
    return screenCX;
  }
  
  float sCY(){
    return screenCY;
  }
  
  float size(){
    return (maxx-minx)*(maxy-miny);
  }
  
  void add(float x, float y, color trackColor){
    minx=min(minx,x);
    miny=min(miny,y);
    maxx=max(maxx,x);
    maxy=max(maxy,y);
    thisColor=trackColor;
  }
  
  boolean isNear(float x, float y){
    float cx= max(min(x,maxx),minx);
    float cy=max(min(y,maxy),miny);
    float d = distSq(cx,cy,x,y);
    
    if(d<distanceThreshold*distanceThreshold){
      return true;
    } else{
      return false;
    }
  }

  void flashlight(float cx, float cy, color thisColor){
    ellipseMode(RADIUS);
    float o=0;
    float red=red(thisColor);
    float green=green(thisColor);
    float blue=blue(thisColor);
    float r=(255-red(thisColor))/18;
    float g=(255-green(thisColor))/18;
    float b=(255-blue(thisColor))/18;
    println(glow);
    if(glow>0){
      for(float i=90;i>=glow;i--){
        if(i%5==0&&i!=0){
          o+=2;
          red+=r;
          green+=g;
          blue+=b;
        }
        noStroke();
        fill(red, green, blue, o);
        ellipse(cx,cy, i*(1-(glow/90)),i*(1-(glow/90)));
        }
      glow-=glow_rate;
    }else{
      for(int i=90;i>=0;i--){
        if(i%5==0&&i!=0){
          o+=2;
          red+=r;
          green+=g;
          blue+=b;
        }
      noStroke();
      fill(red, green, blue, o);
      ellipse(cx,cy, i,i);
      }
    }
  }
  
  void user(){
    OscMessage user = new OscMessage("/user");
    user.add(screenCY);
    user.add(screenCX);
    user.add(id);
    oscP5.send(user, myRemoteLocation);
  }
}
