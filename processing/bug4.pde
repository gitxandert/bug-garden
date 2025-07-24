class Bug4{  
  
  float len=50;
  
  int counter=0;
  int count_lim=int(random(30,60));
  float sk1, sk2, sk3, sk4, sk5, sk6, sk7, sk8, sk9, sk10, sk11, sk12;
  
  float r;
  float g;
  float b;
  float c1=random(100,250);
  float c2=random(100, 250);
  float c3=random(100, 250);
  
  float x=random(-1000, displayWidth);
  float y=random(displayHeight+1000);
  
  float antenna=-100;
  float bounce=-49;
  
  float sr=random(100,200);
  float sg=random(100,200);
  float sb=random(100,200);
  
  float op=0;
  
  boolean caught=false;
  boolean free=true;
  
  float catchX;
  float catchY;
  
  int tag;
  
  void slide(){
    noFill();
    pushMatrix();
    translate(x, y);
    op=0;
    for(float i =0; i<len; i++){
      float t=i/len;
      float x1=bezierPoint(0, -150, 0, -150, t);
      float y1=bezierPoint(-125, -150, 50, 0, t);
      float x2=bezierPoint(0, 150, 0, 150, t);
      float y2=bezierPoint(-125, -150, 50, 0, t);
      float x3=curvePoint(0, -150, 150,0, t);
      float y3=curvePoint(-200, 0,0, -200, t);
      strokeWeight(2);
      if(counter<15){
        sk1=random(.9,1.1);
        sk2=random(.9,1.1);
        sk3=random(.9,1.1);
        sk4=random(.9,1.1);
        sk5=random(.9,1.1);
        sk6=random(.9,1.1);
        sk7=random(.9,1.1);
        sk8=random(.9,1.1);
        sk9=random(.9,1.1);
        sk10=random(.9,1.1);
        sk11=random(.9,1.1);
        sk12=random(.9,1.1);
        float chance=random(60);
        if(chance>50){
          r=c1;
          g=c2;
          b=c3;
        }else if(chance>40){
          r=c1;
          g=c3;
          b=c2;
        }else if(chance>30){
          r=c2;
          g=c3;
          b=c1;
        }else if(chance>20){
          r=c2;
          g=c1;
          b=c3;
        }else if(chance>10){
          r=c3;
          g=c1;
          b=c2;
        }else{
          r=c3;
          g=c2;
          b=c1;
        }
        float chance2=random(60);
        if(chance2>50){
          ir=c1;
          ig=c2;
          ib=c3;
        }else if(chance2>40){
          ir=c1;
          ig=c3;
          ib=c2;
        }else if(chance2>30){
          ir=c2;
          ig=c3;
          ib=c1;
        }else if(chance2>20){
          ir=c2;
          ig=c1;
          ib=c3;
        }else if(chance2>10){
          ir=c3;
          ig=c1;
          ib=c2;
        }else{
          ir=c3;
          ig=c2;
          ib=c1;
        }
        op=150;
        if(x>0 && y<height){
          scratch();
        }
      }
      stroke(r,g,b, 0);
      line(x1*sk1,y1*sk2, x1*sk3,y1*sk4);
      line(x2*sk5,y2*sk6, x2*sk7,y2*sk8);
      line(x3*sk9,y3*sk10, x3*sk11,y3*sk12);
    }
    stroke(sr, sg, sb, 0);
    curve(-130, 300, -130, 0, -180, antenna, -180, 300);
    curve(-130, 300, -130, 0, -80, antenna-20, -80, 300);
    popMatrix();
    eye1();
    eye2();
    antenna=lerp(antenna, bounce, .15);
    if(antenna>-50){
      bounce=-101;
    }
    if(antenna<-100){
      bounce=-49;
    }
    if(caught==false){
      counter+=1;
      if(counter>count_lim){
        counter=0;
        count_lim=int(random(30,60));
        float chance=random(100);
        if(chance>50){
          float chance2=random(100);
          if(chance2>50){
            x+=random(100,500);
            if(x>width){
              x=x/2;
            }
          }else{
            x-=random(50,100);
            if(x<-1000){
              x+=random(100,500);
            }
          }
        }else{
          float chance2=random(100);
          if(chance2>50){
            y+=random(100,500);
            if(y>height+1000){
              y=y/2;
            }
          }else{
            y-=random(50,100);
            if(y<0){
              y+=random(500, 1000);
            }
          }
        }
      }
      for(Blob b : blobs){
        catchX=abs(b.sCX()-x);
        catchY=abs(b.sCY()-y);
        if(catchX<b.net && catchY<b.net){
          if(b.thisColor==trackGreen || b.thisColor==trackYellow){
            x=b.sCX();
            y=b.sCY();
            b.hasBug=true;
            caught=true;
            caught(y);
            op=150;
          }else if(b.thisColor==trackBlue){
            bluee(y);
            changed();
          }
        }
      }
    }else{
      for(Blob b : blobs){
        if(b.thisColor==trackGreen || b.thisColor==trackYellow){
          if(b.hasBug){
            x=b.sCX();
            y=b.sCY();
            op=150;
          }
        }
      }
    }
  }
  
  void release(){
    if(caught==true){
      if(x<width-1000 || y>1000){
        slide();
        free=true;
        op=0;
      }else if(x>width-1000){
        if(x-y>1000){
          free=false;
          idle();
          i_len=20;
        }
      }
      caught=false;
    }
  }
  
  void idle(){
    op=255;
    noFill();
    pushMatrix();
    translate(x, y);
    for(float i =0; i<len; i++){
      float t=i/len;
      float x1=bezierPoint(0, -150, 0, -150, t);
      float y1=bezierPoint(-125, -150, 50, 0, t);
      float x2=bezierPoint(0, 150, 0, 150, t);
      float y2=bezierPoint(-125, -150, 50, 0, t);
      float x3=curvePoint(0, -150, 150,0, t);
      float y3=curvePoint(-200, 0,0, -200, t);
      strokeWeight(2);
      if(counter<10){
        sk1=random(.9,1.1);
        sk2=random(.9,1.1);
        sk3=random(.9,1.1);
        sk4=random(.9,1.1);
        sk5=random(.9,1.1);
        sk6=random(.9,1.1);
        sk7=random(.9,1.1);
        sk8=random(.9,1.1);
        sk9=random(.9,1.1);
        sk10=random(.9,1.1);
        sk11=random(.9,1.1);
        sk12=random(.9,1.1);
        float chance=random(60);
        if(chance>50){
          r=c1;
          g=c2;
          b=c3;
        }else if(chance>40){
          r=c1;
          g=c3;
          b=c2;
        }else if(chance>30){
          r=c2;
          g=c3;
          b=c1;
        }else if(chance>20){
          r=c2;
          g=c1;
          b=c3;
        }else if(chance>10){
          r=c3;
          g=c1;
          b=c2;
        }else{
          r=c3;
          g=c2;
          b=c1;
        }
        float chance2=random(60);
        if(chance2>50){
          ir=c1;
          ig=c2;
          ib=c3;
        }else if(chance2>40){
          ir=c1;
          ig=c3;
          ib=c2;
        }else if(chance2>30){
          ir=c2;
          ig=c3;
          ib=c1;
        }else if(chance2>20){
          ir=c2;
          ig=c1;
          ib=c3;
        }else if(chance2>10){
          ir=c3;
          ig=c1;
          ib=c2;
        }else{
          ir=c3;
          ig=c2;
          ib=c1;
        }
        wiggle();
      }
      stroke(r,g,b);
      line(x1*sk1,y1*sk2, x1*sk3,y1*sk4);
      line(x2*sk5,y2*sk6, x2*sk7,y2*sk8);
      line(x3*sk9,y3*sk10, x3*sk11,y3*sk12);
    }
    stroke(sr, sg, sb);
    curve(-130, 300, -130, 0, -180, antenna, -180, 300);
    curve(-130, 300, -130, 0, -80, antenna-20, -80, 300);
    popMatrix();
    eye1();
    eye2();
    antenna=lerp(antenna, bounce, .15);
    if(antenna>-50){
      bounce=-101;
    }
    if(antenna<-100){
      bounce=-49;
    }
    if(caught==false){
      counter+=1;
      if(counter>count_lim){
        counter=0;
        count_lim=int(random(30,60));
      }
      for(Blob b : blobs){
        catchX=abs(b.sCX()-x);
        catchY=abs(b.sCY()-y);
        if(catchX<b.net && catchY<b.net){
          if(b.thisColor==trackGreen || b.thisColor==trackYellow){
            x=b.sCX();
            y=b.sCY();
            b.hasBug=true;
            caught=true;
            caught(y);
          }else if(b.thisColor==trackBlue){
            bluee(y);
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
            x=b.sCX();
            y=b.sCY();
          }
        }
      }
    }
  }
  
  float i1_x1;
  float i1_y1;
  float i1_x2;
  float i1_y2;
  
  float i2_x1;
  float i2_y1;
  float i2_x2;
  float i2_y2;
  
  float ir;
  float ig;
  float ib;
  
  float i_len;
  
  void eye1(){
    float lim;
    if(free){
      lim = 15;
    }else{
      lim = 10;
    }
    for(float i=0;i<5;i++){
      pushMatrix();
      translate(x-25, y-50);
      rotate(TWO_PI*i/5);
      if(counter<lim){
        if(free){
          i_len=60;
        }else{
          i_len=20;
        }
        i1_x1=random(-i_len,i_len);
        i1_x2=random(-i_len,i_len);
        i1_y1=random(-i_len,i_len);
        i1_y2=random(-i_len,i_len);
      }
      stroke(ir, ig, ib, op);
      line(i1_x1, i1_y1, i1_x2, i1_y2);
      popMatrix();
    }
  }
  
  void eye2(){
    float lim;
    if(free){
      lim = 15;
    }else{
      lim = 10;
    }
    for(float i=0;i<5;i++){
      pushMatrix();
      translate(x+25, y-50);
      rotate(TWO_PI*i/5);
      if(counter<lim){
        if(free){
          i_len=60;
        }else{
          i_len=20;
        }
        i2_x1=random(-i_len,i_len);
        i2_x2=random(-i_len,i_len);
        i2_y1=random(-i_len,i_len);
        i2_y2=random(-i_len,i_len);
      }
      stroke(ir, ig, ib, op);
      line(i2_x1, i2_y1, i2_x2, i2_y2);
      popMatrix();
    }
  }
  
  void scratch(){
    float speed;
    float pitch;
    int gate = 1;
    speed=x;
    pitch=y;
    OscMessage b4 = new OscMessage("/b4");
    b4.add(tag);
    b4.add(speed);
    b4.add(pitch);
    b4.add(gate);
    oscP5.send(b4, myRemoteLocation);
  }
  
  void wiggle(){
    float speed;
    float pitch;
    int gate = 2;
    speed=x;
    pitch=y;
    OscMessage b4 = new OscMessage("/b4");
    b4.add(tag);
    b4.add(speed);
    b4.add(pitch);
    b4.add(gate);
    oscP5.send(b4, myRemoteLocation);
  }
  
  void changed(){
    c1=random(150,200);
    c2=random(150,200);
    c3=random(150,200);
  }
  
  void redd(){
    caught=true;
    OscMessage red = new OscMessage("/red");
    red.add(y);
    oscP5.send(red, myRemoteLocation);
    float chance=random(30);
    if(chance>20){
      for(int i=0; i<bug_count; i++){
        if(bug1[i].tag == tag){
          bug1[i].caught = true;
          bug1[i].b1x = x;
          bug1[i].b1y = y;
          bug1[i].release();
        }
      }
    }else if(chance>10){
      for(int i=0; i<bug_count; i++){
        if(bug2[i].tag == tag){
          bug2[i].caught = true;
          bug2[i].x = x;
          bug2[i].y = y;
          bug2[i].release();
        }
      }
    }else{
      for(int i=0; i<bug_count; i++){
        if(bug3[i].tag == tag){
          bug3[i].caught = true;
          bug3[i].x1 = x;
          bug3[i].y1 = y;
          bug3[i].release();
        }
      }
    }
    x=random(-2000, width-1000);
    y=random(height+1000);
    release();
  }
}
