class Bug1{

  float c1H;
  float c1S;
  float c1B;
  float c2H;
  float c2S;
  float c2B;
  float c3H;
  float c3S;
  float c3B;
  float c4H;
  float c4S;
  float c4B;
  
  float op=0;
  
  float wURx;
  float wULx;
  float wLRx;
  float wLLx;
  
  float wUy;
  float wLy;
  
  float w_inc;
  
  float b1x;
  float b1dummyx;
  int b1x_target;
  int b1x_chunk;
  float b1y;
  float b1dummyy;
  int b1y_target;
  int b1y_chunk;
  float b1x_inc;
  float b1y_inc;
  
  boolean caught=false;
  boolean free=true;
  
  float catchX;
  float catchY;

  float hoverPoint=0;
  
  int tag;
  
  void add(){
    c1H=random(155,255);
    c1S=random(155,255);
    c1B=random(155,255);
    c2H=random(155,255);
    c2S=random(155,255);
    c2B=random(155,255);
    c3H=random(155,255);
    c3S=random(155,255);
    c3B=random(155,255);
    c4H=random(155,255);
    c4S=random(155,255);
    c4B=random(155,255);
    
    wURx=60;
    wULx=-60;
    wLRx=55;
    wLLx=-55;
    
    wUy=-40;
    wLy=40;
    
    w_inc=1;
    
    b1x=random(-2000, displayWidth-1000);
    b1dummyx=b1x;
    b1x_target=int(random(-2000, displayWidth-1000));
    b1x_chunk=abs(b1x_target/int(random(3,12)));
    b1y=random(1000, displayHeight+1000);
    b1dummyy=b1y;
    b1y_target=int(random(displayHeight+1000));
    b1y_chunk=abs(b1y_target/int(random(3,12)));
  }
    
 
  void flit(){
    ellipseMode(RADIUS);
    noStroke();
    pushMatrix();
    translate(b1x,b1y-60);
    fill(c2H, c2S, c2B, op);
    //head
    ellipse(0, 0, 20, 20);
    popMatrix();
    //body
    pushMatrix();
    translate(b1x,b1y);
    ellipse(0,0, 20, 50);
    popMatrix();
    pushMatrix();
    translate(b1x-24, b1y-80);
    rotate(-PI/8);
    fill(c1H, c1S, c1B, op);
    //eye_L
    ellipse(0, 0, 20, 15);
    popMatrix();
    pushMatrix();
    translate(b1x+24, b1y-80);
    rotate(PI/8);
    //eye_R
    ellipse(0, 0, 20, 15);
    popMatrix();
    pushMatrix();
    translate(b1x+wURx, b1y+wUy);
    rotate(PI/3);
    fill(c3H, c3S, c3B, op);
    //wing_UR
    ellipse(0, 0, 30, 60);
    popMatrix();
    pushMatrix();
    translate(b1x+wULx, b1y+wUy);
    rotate(-PI/3);
    //wing_UL
    ellipse(0, 0, 30, 60);
    popMatrix();
    pushMatrix();
    translate(b1x+wLRx, b1y+wLy);
    rotate(-PI/4);
    //wing_LR
    ellipse(0, 0, 30, 60);
    popMatrix();
    pushMatrix();
    translate(b1x+wLLx, b1y+wLy);
    rotate(PI/4);
    //wing_LL
    ellipse(0, 0, 30, 60);
    popMatrix();
    //tail
    bug1_tail();
    if(caught==false){
      if(b1x>b1x_target){
        b1x_inc=-(b1x-b1x_target)/60;   
        b1dummyx+=b1x_inc;
        if(b1dummyx<b1x_target){
          b1x=b1dummyx;
          b1y=b1dummyy;
          b1x_target=int(random(-2000,width));
          if(b1x>0 && b1x<width && b1y>0 && b1y<height){
            noise();
          }
        }
        if(b1dummyx<b1x-b1x_chunk){
          b1x=b1dummyx;
          b1y=b1dummyy;
          b1x_chunk=abs(b1x_target/int(random(3,12)));
           if(b1x>0 && b1x<width && b1y>0 && b1y<height){
            noise();
          }
        }
      }else{
        b1x_inc=(b1x_target-b1x)/60;
        b1dummyx += b1x_inc;
       if(b1dummyx>b1x_target){
          b1x=b1dummyx;
          b1y=b1dummyy;
          b1x_target=int(random(-2000, width));
          if(b1x>0 && b1x<width && b1y>0 && b1y<height){
            noise();
          }
        }
        if(b1dummyx>b1x+b1x_chunk){
          b1x=b1dummyx;
          b1y=b1dummyy;
          b1x_chunk=abs(b1x_target/int(random(3,12)));
          if(b1x>0 && b1x<width && b1y>0 && b1y<height){
            noise();
          }
        }
      }
      if(b1y>b1y_target){
        b1y_inc=-(b1y-b1y_target)/60;   
        b1dummyy+=b1y_inc;
        if(b1dummyy<b1y_target){
          b1x=b1dummyx;
          b1y=b1dummyy;
          b1y_target=int(random(height+2000));
          if(b1x>0 && b1x<width && b1y>0 && b1y<height){
            noise();
          }
        }
        if(b1dummyy<b1y-b1y_chunk){
          b1x=b1dummyx;
          b1y=b1dummyy;
          b1y_chunk=abs(b1y_target/int(random(3,12)));
        }
      }else{
        b1y_inc=(b1y_target-b1y)/60;
        b1dummyy += b1y_inc;
        if(b1dummyy>b1y_target){
          b1x=b1dummyx;
          b1y=b1dummyy;
          b1y_target=int(random(height+2000));
          if(b1x>0 && b1x<width && b1y>0 && b1y<height){
            noise();
          }
        }
        if(b1dummyy>b1y+b1y_chunk){
          b1x=b1dummyx;
          b1y=b1dummyy;
          b1y_chunk=abs(b1y_target/int(random(3,12)));
        }
      }
      wURx+=w_inc;
      wULx-=w_inc;
      wLRx+=w_inc;
      wLLx-=w_inc;
      wUy-=w_inc;
      wLy+=w_inc;
      if(b1x>width/2 && b1x-b1y>2000){
        b1x_inc=-b1x_inc;
      }
      if(b1x<-2000){
        b1x_inc=random(5,10);
      }
      if(b1y>height+1000){
        b1y_inc=-b1y_inc;
      }
      if(b1y<0){
        b1y_inc=random(5,10);
      }
      if(b1x+wURx>b1x+60){
        w_inc=-w_inc;
      }
      if(b1x+wURx<b1x+40){
        w_inc=random(.6,2.8);
      }
      for(Blob b : blobs){
        catchX=abs(b.sCX()-b1x);
        catchY=abs(b.sCY()-b1y);
        if(catchX<b.net && catchY<b.net){
          if(b.thisColor==trackGreen || b.thisColor==trackYellow){
            b1x=b.sCX();
            b1y=b.sCY();
            b1x_inc=0;
            b1y_inc=0;
            b.hasBug=true;
            caught=true;
            caught(b1y);
            op=20;
          }else if(b.thisColor==trackBlue){
            bluee(b1y);
            changed();
          }
        }
      }
    }else{
      for(Blob b : blobs){
        if(b.thisColor==trackGreen || b.thisColor==trackYellow){
          if(b.hasBug){
            b1x=b.sCX();
            b1y=b.sCY();
          }
        }
      }
    }
  }
  
  void release(){
    if(caught==true){
      if(b1x<width-1000 || b1y>1000){
        free=true;
        op=0;
        flit();
      }else if(b1x>width-1000){
        if(b1x-b1y>1000){
          hoverPoint=b1y+60;
          b1y_inc=random(1,5);
          free=false;
          hover();
        }
      }
      caught=false;
    }
  }
  
  void hover(){
    ellipseMode(RADIUS);
    noStroke();
    pushMatrix();
    translate(b1x,b1y-60);
    fill(c2H, c2S, c2B);
    //head
    ellipse(0, 0, 20, 20);
    popMatrix();
    //body
    pushMatrix();
    translate(b1x,b1y);
    ellipse(0,0, 20, 50);
    popMatrix();
    pushMatrix();
    translate(b1x-24, b1y-80);
    rotate(-PI/8);
    fill(c1H, c1S, c1B, 225);
    //eye_L
    ellipse(0, 0, 20, 15);
    popMatrix();
    pushMatrix();
    translate(b1x+24, b1y-80);
    rotate(PI/8);
    //eye_R
    ellipse(0, 0, 20, 15);
    popMatrix();
    pushMatrix();
    translate(b1x+wURx, b1y+wUy);
    rotate(PI/3);
    fill(c3H, c3S, c3B, 200);
    //wing_UR
    ellipse(0, 0, 30, 60);
    popMatrix();
    pushMatrix();
    translate(b1x+wULx, b1y+wUy);
    rotate(-PI/3);
    //wing_UL
    ellipse(0, 0, 30, 60);
    popMatrix();
    pushMatrix();
    translate(b1x+wLRx, b1y+wLy);
    rotate(-PI/4);
    //wing_LR
    ellipse(0, 0, 30, 60);
    popMatrix();
    pushMatrix();
    translate(b1x+wLLx, b1y+wLy);
    rotate(PI/4);
    //wing_LL
    ellipse(0, 0, 30, 60);
    popMatrix();
    //tail
    bug1_tail();
    wURx+=w_inc;
    wULx-=w_inc;
    wLRx+=w_inc;
    wLLx-=w_inc;
    wUy-=w_inc;
    wLy+=w_inc;
    if(b1x+wURx>b1x+60){
      w_inc=-w_inc;
    }
    if(b1x+wURx<b1x+40){
      w_inc=random(.6,2.8);
    }
    if(caught==false){
      b1y+=b1y_inc;
      if(b1y>hoverPoint){
        b1y_inc=random(-5, -1);
        int gate=2;
        float bri;
        float det;
        float amp;
        float tail;
        float rfr;
        float q;
        float chance = random(100);
        float chance2 = random(100);
        if(chance>75){
          bri = c1H;
          det = c1S;
          amp = c1B;
        }else if(chance>50){
          bri = c2H;
          det = c2S;
          amp = c2B;
        }else if(chance>25){
          bri = c3H;
          det = c3S;
          amp = c3B;
        }else{
          bri = c4H;
          det = c4S;
          amp = c4B;
        }
        if(chance2>75){
          tail = c1H;
          rfr = c1S;
          q = c1B;
        }else if(chance2>50){
          tail = c2H;
          rfr = c2S;
          q = c2B;
        }else if(chance2>25){
          tail = c3H;
          rfr = c3S;
          q = c3B;
        }else{
          tail = c4H;
          rfr = c4S;
          q = c4B;
        }
        OscMessage b1 = new OscMessage("/b1");
        b1.add(gate);
        b1.add(bri);
        b1.add(det);
        b1.add(amp);
        b1.add(tail);
        b1.add(rfr);
        b1.add(q);
        oscP5.send(b1, myRemoteLocation);
        OscMessage chime = new OscMessage("/b1_chime");
        chime.add(b1y);
        oscP5.send(chime, myRemoteLocation);
      }
      if(b1y<hoverPoint-120){
        b1y_inc=random(1,5);
        int gate=2;
        float bri;
        float det;
        float amp;
        float tail;
        float rfr;
        float q;
        float chance = random(100);
        float chance2 = random(100);
        if(chance>75){
          bri = c1H;
          det = c1S;
          amp = c1B;
        }else if(chance>50){
          bri = c2H;
          det = c2S;
          amp = c2B;
        }else if(chance>25){
          bri = c3H;
          det = c3S;
          amp = c3B;
        }else{
          bri = c4H;
          det = c4S;
          amp = c4B;
        }
        if(chance2>75){
          tail = c1H;
          rfr = c1S;
          q = c1B;
        }else if(chance2>50){
          tail = c2H;
          rfr = c2S;
          q = c2B;
        }else if(chance2>25){
          tail = c3H;
          rfr = c3S;
          q = c3B;
        }else{
          tail = c4H;
          rfr = c4S;
          q = c4B;
        }
        OscMessage b1 = new OscMessage("/b1");
        b1.add(gate);
        b1.add(bri);
        b1.add(det);
        b1.add(amp);
        b1.add(tail);
        b1.add(rfr);
        b1.add(q);
        b1.add(tag);
        oscP5.send(b1, myRemoteLocation);
        OscMessage chime = new OscMessage("/b1_chime");
        chime.add(b1y);
        oscP5.send(chime, myRemoteLocation);
      }
      for(Blob b : blobs){
        catchX=abs(b.sCX()-b1x);
        catchY=abs(b.sCY()-b1y);
        if(catchX<b.net && catchY<b.net){
          if(b.thisColor==trackGreen || b.thisColor==trackYellow){
            b1x=b.sCX();
            b1y=b.sCY();
            b1x_inc=0;
            b1y_inc=0;
            b.hasBug=true;
            caught=true;
            caught(b1y);
          }else if(b.thisColor==trackBlue){
            bluee(b1y);
            changed();
          }else if(b.thisColor == trackRed){
            redd();
          }
        }
      }
    }else{
      for(Blob b : blobs){
        if(b.thisColor==trackGreen || b.thisColor==trackYellow){
          if(b.hasBug){
            b1x=b.sCX();
            b1y=b.sCY();
          }
        }
      }
    }
  }

  int tail_count=0;
  int tail_count_inc=int(random(1,5));
  
  void noise(){
    int gate=1;
    float bri;
    float det;
    float amp;
    float tail;
    float rfr;
    float q;
    float chance = random(100);
    float chance2 = random(100);
    if(chance>75){
      bri = c1H;
      det = c1S;
      amp = c1B;
    }else if(chance>50){
      bri = c2H;
      det = c2S;
      amp = c2B;
    }else if(chance>25){
      bri = c3H;
      det = c3S;
      amp = c3B;
    }else{
      bri = c4H;
      det = c4S;
      amp = c4B;
    }
    if(chance2>75){
      tail = c1H;
      rfr = c1S;
      q = c1B;
    }else if(chance2>50){
      tail = c2H;
      rfr = c2S;
      q = c2B;
    }else if(chance2>25){
      tail = c3H;
      rfr = c3S;
      q = c3B;
    }else{
      tail = c4H;
      rfr = c4S;
      q = c4B;
    }
    OscMessage b1 = new OscMessage("/b1");
    b1.add(gate);
    b1.add(bri);
    b1.add(det);
    b1.add(amp);
    b1.add(tail);
    b1.add(rfr);
    b1.add(q);
    b1.add(tag);
    oscP5.send(b1, myRemoteLocation);
    OscMessage chime = new OscMessage("/b1_chime");
    chime.add(b1y);
    oscP5.send(chime, myRemoteLocation);
  }

  void bug1_tail(){
    pushMatrix();
    translate(b1x,b1y+70);
    for(float i=tail_count;i>=0;i--){
      float l=25*((tail_count-i)/tail_count);
      noStroke();
      fill(c4H, c4S, c4B, 255*(i*i)/14400);
      ellipse(0,0,l,l);
    }
    tail_count+=tail_count_inc;
    if(tail_count>60){
      tail_count_inc=-tail_count_inc;
    }
    if(tail_count<0){
      tail_count_inc=-tail_count_inc;
    }
    popMatrix();
  }
  
  void changed(){
    c1H=random(155,255);
    c1S=random(155,255);
    c1B=random(155,255);
    c2H=random(155,255);
    c2S=random(155,255);
    c2B=random(155,255);
    c3H=random(155,255);
    c3S=random(155,255);
    c3B=random(155,255);
    c4H=random(155,255);
    c4S=random(155,255);
    c4B=random(155,255);
  }
  
  void redd(){
    caught=true;
    OscMessage red = new OscMessage("/red");
    red.add(b1y);
    oscP5.send(red, myRemoteLocation);
    float chance=random(30);
    if(chance>20){
      for(int i=0; i<bug_count; i++){
        if(bug2[i].tag == tag){
          bug2[i].caught = true;
          bug2[i].x = b1x;
          bug2[i].y = b1y;
          bug2[i].release();
        }
      }
    }else if(chance>10){
      for(int i=0; i<bug_count; i++){
        if(bug3[i].tag == tag){
          bug3[i].caught = true;
          bug3[i].x1 = b1x;
          bug3[i].y1 = b1y;
          bug3[i].release();
        }
      }
    }else{
      for(int i=0; i<bug_count; i++){
        if(bug4[i].tag == tag){
          bug4[i].caught = true;
          bug4[i].x = b1x;
          bug4[i].y = b1y;
          bug4[i].release();
        }
      }
    }
    b1x=random(-2000, displayWidth-1000);
    b1dummyx=b1x;
    b1x_target=int(random(-2000, displayWidth-1000));
    b1x_chunk=abs(b1x_target/int(random(3,12)));
    b1y=random(displayHeight+1000);
    b1dummyy=b1y;
    b1y_target=int(random(displayHeight+1000));
    b1y_chunk=abs(b1y_target/int(random(3,12)));
    release();
  }
}
