import processing.video.*;

import netP5.*;
import oscP5.*;

Capture video;

OscP5 oscP5;
NetAddress myRemoteLocation;
OscMessage oscMessage;

ArrayList<Blob> blobs = new ArrayList<Blob>();

PGraphics lamp;

Bug1[] bug1;

Bug2[] bug2;

Bug3[] bug3;

Bug4[] bug4;

int bug_count = 6;

int blobCounter=1;

color trackLight=color(255);
color trackYellow=color(200,175,0);
color trackRed=color(240,0,0);
color trackGreen=color(0,255,120);
color trackBlue=color(0,0,255);

float colorThreshold=100;
float distanceThreshold=20;

void settings(){
  fullScreen();
}

void setup(){
  frameRate(60);
  oscP5 = new OscP5(this, 11667);
  myRemoteLocation = new NetAddress("10.21.245.199", 8667);
  String[] cameras = Capture.list();
  lamp=createGraphics(displayWidth, displayHeight);
  lamp();
  bug1 = new Bug1[bug_count];
  bug2 = new Bug2[bug_count];
  bug3 = new Bug3[bug_count];
  bug4 = new Bug4[bug_count];
  for(int i=0; i<bug_count;i++){
    bug1[i]= new Bug1();
    bug1[i].add();
    bug1[i].tag = i;
    bug2[i]=new Bug2();
    bug2[i].add();
    bug2[i].tag = i;
    bug3[i]= new Bug3();
    bug3[i].add();
    bug3[i].tag = i;
    bug4[i]= new Bug4();
    bug4[i].tag = i;
  }
  printArray(cameras);
  video = new Capture(this,640,480, "pipeline:autovideosrc");
  video.start();
  ellipseMode(RADIUS);
  rectMode(CENTER);
}

//void captureEvent(Capture video){
//  video.read();
//}

void draw() {
  rectMode(CORNER);
  if(video.available()){
    video.read();
    colorTracking();
  }
  for(int i=0; i<bug_count; i++){
    if(bug1[i].free){
      bug1[i].flit();
    }else{
      bug1[i].hover();
    }
    if(bug2[i].free){
      bug2[i].travel();
    }else{
      bug2[i].stay();
    }
    if(bug3[i].free){
      bug3[i].crawl();
    }else{
      bug3[i].squirm();
    }
    if(bug4[i].free){
      bug4[i].slide();
    }else{
      bug4[i].idle();
    }
  }
}

void colorTracking(){
  video.loadPixels();
  pushMatrix();
  scale(-1,1);
  image(video,-width,0, width,height);
  noStroke();
  fill(0);
  rect(-width,0,width,height);
  popMatrix();
  image(lamp,0,0);
  
  ArrayList<Blob> currentBlobs = new ArrayList<Blob>();
  
  for(int bx=0; bx<video.width; bx++){
    for(int by=0; by<video.height; by++){
      int loc = bx+by*video.width;
      
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      
      float r2 = red(trackLight);
      float g2= green(trackLight);
      float b2 = blue(trackLight);
      
      float rY = red(trackYellow);
      float gY = green(trackYellow);
      float bY = blue(trackYellow);      
      
      float rR = red(trackRed);
      float gR = green(trackRed);
      float bR = blue(trackRed);
      
      float rG = red(trackGreen);
      float gG = green(trackGreen);
      float bG = blue(trackGreen);
      
      float rB = red(trackBlue);
      float gB = green(trackBlue);
      float bB = blue(trackBlue);      
      
      float dL = distSq(r1,g1,b1,r2,g2,b2);
      
      float dY = distSq(r1,g1,b1,rY,gY,bY);
      
      float dR = distSq(r1,g1,b1,rR,gR,bR);
      
      float dG = distSq(r1,g1,b1,rG,gG,bG);
      
      float dB = distSq(r1,g1,b1,rB,gB,bB);
      
      if(dY < colorThreshold*colorThreshold){  
        boolean found=false;
        for(Blob b : currentBlobs){
          if(b.isNear(bx,by)){
            b.add(bx,by,trackYellow);
            found=true;
            break;
          }
        }
        if(!found){
          Blob b = new Blob(bx,by,trackYellow,15);
          currentBlobs.add(b);
        }
      }else if(dR < colorThreshold*colorThreshold){  
        boolean found=false;
        for(Blob b : currentBlobs){
          if(b.isNear(bx,by)){
            b.add(bx,by,trackRed);
            found=true;
            break;
          }
        }
        if(!found){
          Blob b = new Blob(bx,by,trackRed,15);
          currentBlobs.add(b);
        }
      }else if(dG < colorThreshold*colorThreshold){  
        boolean found=false;
        for(Blob b : currentBlobs){
          if(b.isNear(bx,by)){
            b.add(bx,by,trackGreen);
            found=true;
            break;
          }
        }
        if(!found){
          Blob b = new Blob(bx,by,trackGreen,15);
          currentBlobs.add(b);
        }
      }else if(dB < colorThreshold*colorThreshold){  
        boolean found=false;
        for(Blob b : currentBlobs){
          if(b.isNear(bx,by)){
            b.add(bx,by,trackBlue);
            found=true;
            break;
          }
        }
        if(!found){
          Blob b = new Blob(bx,by,trackBlue,15);
          currentBlobs.add(b);
        }
      }else if(dL < colorThreshold*colorThreshold){  
        boolean found=false;
        for(Blob b : currentBlobs){
          if(b.isNear(bx,by)){
            b.add(bx,by,trackLight);
            found=true;
            break;
          }
        }
        if(!found){
          Blob b = new Blob(bx,by,trackLight,15);
          currentBlobs.add(b);
        }
      }
    }
  }

  for(int i = currentBlobs.size()-1; i>=0; i--){
    if(currentBlobs.get(i).size()<500){
      currentBlobs.remove(i);
    }
  }
  
  if(blobs.isEmpty() && currentBlobs.size() > 0){
    for(Blob b : currentBlobs){
      b.id=blobCounter;
      blobs.add(b);
      blobCounter++;
      if(blobCounter>15){
        blobCounter=1;
      }
    }
  }else if(blobs.size() <= currentBlobs.size()){
    for(Blob b: blobs){
      float recordD=1000;
      Blob matched=null;
      for(Blob cb: currentBlobs){
        PVector centerB=b.getCenter();
        PVector centerCB=cb.getCenter();
        
        float d=PVector.dist(centerB,centerCB);
        
        if(d<recordD && !cb.taken){
          recordD=d;
          matched=cb;
        }
      }
      matched.taken=true;
      b.become(matched);
    }
    
    for(Blob cb: currentBlobs){
      if(!cb.taken){
        cb.id=blobCounter;
        blobs.add(cb);
        blobCounter++;
        if(blobCounter>15){
          blobCounter=1;
        }
      }
    }
  }else if(blobs.size()>currentBlobs.size()){
    for(Blob b: blobs){
      b.taken=false;
    }
    
    for(Blob cb: currentBlobs){
      float recordD=1000;
      Blob matched=null;
      for(Blob b: blobs){
        PVector centerB=b.getCenter();
        PVector centerCB=cb.getCenter();
        
        float d=PVector.dist(centerB,centerCB);
        
        if(d<recordD && !b.taken){
          recordD=d;
          matched=b;
        }
      }
      if(matched != null){
        matched.taken=true;
        matched.become(cb);
      }
    }
    for(int i = blobs.size()-1; i>=0; i--){
      Blob b = blobs.get(i);
      if(!b.taken){
        if(b.hasBug){
          for(int j = 0; j<bug_count; j++){
            bug1[j].release();
            bug2[j].release();
            bug3[j].release();
            bug4[j].release();
          }
        }
        blobs.remove(i);
      }
    }
  }
  
  for(Blob b: blobs){
    b.show();
  }
}

float distSq(float x1, float y1,float x2, float y2){
  float d=(x2-x1)*(x2-x1) + (y2-y1)*(y2-y1);
  return d;
}

float distSq(float x1, float y1, float z1, float x2, float y2, float z2){
  float d=(x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) + (z2-z1)*(z2-z1);
  return d;
}

float normalize(float val, float valLo, float valHi, float outLo, float outHi){
   if (val < valLo){
      val = valLo;
   } else if (val > valHi){
      val = valHi;
   }
   float valDiff = valHi - valLo;
   float outDiff = outHi - outLo;
   float percent = (val - valLo) / valDiff;
   return outLo + (percent * outDiff);
}

void lamp(){
  lamp.beginDraw();
  float o=0;
  float o_inc=.004;
  for(float i=2000; i>=1;i--){
    lamp.noStroke();
    lamp.fill(255,255*(1-(o_inc*22)),255*(1-(o_inc*60)),o);
    lamp.ellipse(width,0,i,i);
    o+=o_inc;
  }
  lamp.endDraw();
}

void caught(float y){
  OscMessage caught = new OscMessage("/caught");
  caught.add(y);
  oscP5.send(caught, myRemoteLocation);
}

void bluee(float y){
  OscMessage blue = new OscMessage("/changed");
  blue.add(y);
  oscP5.send(blue, myRemoteLocation);
}
