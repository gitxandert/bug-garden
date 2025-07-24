class Bug2{  
  PShape spider, body, head, i1a, i1b, i2a, i2b, i3a, i3b, ll1a, ll1b, ll2a, ll2b, ll3a, ll3b, rl1a, rl1b, rl2a, rl2b, rl3a, rl3b;
  float bR=random(150, 200);
  float bG=random(150,200);
  float bB=random(150,200);
  float lR=random(100,150);
  float lG=random(100,150);
  float lB=random(100,150);
  float tR=random(200,250);
  float tG=random(200,250);
  float tB=random(200,250);
  float ibR=random(150,200);
  float ibG=random(150,200);
  float ibB=random(150,200);
  float iaR=random(100,150);
  float iaG=random(100,150);
  float iaB=random(100,150);
  
  float temper=random(.5, 1.3);
  float shrink=int(random(10, 50));
  float first_tri=shrink+15*temper;
  float sec_tri=first_tri+5*temper;
  float third_tri=sec_tri+5*temper;
  float grow=third_tri+int(random(20,60));
  float reset=grow+int(random(10, 50));
  
  float x=random(-1000, displayWidth-1000);
  float y=random(displayHeight+1000);
  
  boolean caught=false;
  boolean free=true;
  
  float catchX;
  float catchY;
  
  int tag;
  
  void add(){
    spider = createShape(GROUP);
    
    ll3a = createShape();
    ll3a.beginShape();
    ll3a.stroke(lR,lG,lB);
    ll3a.strokeWeight(10);
    ll3a.vertex(-35, -15);
    ll3a.vertex(-80, -15);
    ll3a.endShape();
    
    ll3b = createShape();
    ll3b.beginShape();
    ll3b.stroke(lR,lG,lB);
    ll3b.strokeWeight(10);
    ll3b.vertex(-80, -15);
    ll3b.vertex(-75, 25);
    ll3b.endShape();
    
    rl3a = createShape();
    rl3a.beginShape();
    rl3a.stroke(lR,lG,lB);
    rl3a.strokeWeight(10);
    rl3a.vertex(35, -15);
    rl3a.vertex(80, -15);
    rl3a.endShape();
    
    rl3b = createShape();
    rl3b.beginShape();
    rl3b.stroke(lR,lG,lB);
    rl3b.strokeWeight(10);
    rl3b.vertex(80, -15);
    rl3b.vertex(75, 25);
    rl3b.endShape();
    
    body = createShape(ELLIPSE, 0, 0, 100, 100);
    body.setFill(color(bR,bG,bB));
    body.setStroke(color(lR,lG,lB));
    
    
    head = createShape(ELLIPSE, 0, 70, 50, 50);
    head.setFill(color(bR,bG,bB));
    head.setStroke(color(lR,lG,lB));
    
    i1a = createShape(ELLIPSE,0,58, 15,15);
    i1a.setFill(color(iaR, iaG, iaB));
    i1a.setStrokeWeight(0);
    
    i1b = createShape(ELLIPSE, 0, 58, 8,8);
    i1b.setFill(color(ibR, ibG, ibB));
    i1b.setStrokeWeight(0);
    
    i2a = createShape(ELLIPSE, -12, 78, 15,15);
    i2a.setFill(color(iaR, iaG, iaB));
    i2a.setStrokeWeight(0);
    
    i2b = createShape(ELLIPSE, -12, 78, 8,8);
    i2b.setFill(color(ibR, ibG, ibB));
    i2b.setStrokeWeight(0);
    
    i3a = createShape(ELLIPSE, 12, 78, 15,15);
    i3a.setFill(color(iaR, iaG, iaB));
    i3a.setStrokeWeight(0);
    
    i3b = createShape(ELLIPSE, 12, 78, 8,8);
    i3b.setFill(color(ibR, ibG, ibB));
    i3b.setStrokeWeight(0);
    
    ll2a = createShape();
    ll2a.beginShape();
    ll2a.stroke(lR, lG, lB);
    ll2a.strokeWeight(10);
    ll2a.vertex(-50, 10);
    ll2a.vertex(-100, 20);
    ll3a.endShape();
    
    ll2b = createShape();
    ll2b.beginShape();
    ll2b.stroke(lR, lG, lB);
    ll2b.strokeWeight(10);
    ll2b.vertex(-100, 20);
    ll2b.vertex(-95, 70);
    ll2b.endShape();
    
    ll1a = createShape();
    ll1a.beginShape();
    ll1a.stroke(lR, lG, lB);
    ll1a.strokeWeight(10);
    ll1a.vertex(-30, 35);
    ll1a.vertex(-70, 55);
    ll1a.endShape();
    
    ll1b = createShape();
    ll1b.beginShape();
    ll1b.stroke(lR, lG, lB);
    ll1b.strokeWeight(10);
    ll1b.vertex(-70, 55);
    ll1b.vertex(-65, 95);
    ll1b.endShape();
    
    rl2a = createShape();
    rl2a.beginShape();
    rl2a.stroke(lR, lG, lB);
    rl2a.strokeWeight(10);
    rl2a.vertex(50, 10);
    rl2a.vertex(100, 20);
    rl2a.endShape();
    
    rl2b = createShape();
    rl2b.beginShape();
    rl2b.stroke(lR, lG, lB);
    rl2b.strokeWeight(10);
    rl2b.vertex(100, 20);
    rl2b.vertex(95, 70);
    rl2b.endShape();
    
    rl1a = createShape();
    rl1a.beginShape();
    rl1a.stroke(lR, lG, lB);
    rl1a.strokeWeight(10);
    rl1a.vertex(30, 35);
    rl1a.vertex(70, 55);
    rl1a.endShape();
    
    rl1b = createShape(); 
    rl1b.beginShape();
    rl1b.stroke(lR, lG, lB);
    rl1b.strokeWeight(10);
    rl1b.vertex(70, 55);
    rl1b.vertex(65, 95);
    rl1b.endShape();
    
    spider.addChild(ll3a);
    spider.addChild(ll3b);
    spider.addChild(rl3a);
    spider.addChild(rl3b);
    spider.addChild(body);
    spider.addChild(head);
    spider.addChild(i1a);
    spider.addChild(i1b);
    spider.addChild(i2a);
    spider.addChild(i2b);
    spider.addChild(i3a);
    spider.addChild(i3b);
    spider.addChild(ll2a);
    spider.addChild(ll2b);
    spider.addChild(ll1a);
    spider.addChild(ll1b);
    spider.addChild(rl2a);
    spider.addChild(rl2b);
    spider.addChild(rl1a);
    spider.addChild(rl1b);
  }
  
  float sc=1;
  
  float gh_sc_1=0;
  float gh_sc_2=0;
  float gh_sc_3=0;
  
  int counter=0;
  
  float lerp_rate=.2;
  
  void travel(){
    if(caught==false){
      pushMatrix();
      translate(x, y);
      counter+=1;
      if(counter>shrink){
        if(counter>grow){
          sc=lerp(sc, 1, lerp_rate);
          if(sc>.95){
            sc=1;
          }
        }else{
          sc=lerp(sc, .5, lerp_rate);
          if(sc<.505){
            sc=.5;
          }
        }
        scale(sc);
      }
      strokeWeight(1);
      stroke(lR,lG,lB,0);
      fill(tR,tG,tB,0);
      triangle(-30, -30, 0, 30, 30, -30);
      popMatrix();
      if(counter>first_tri){
        if(counter<first_tri+2){
          if(x>0 && y<height){
            flash();
          }
        }
        if(counter>grow){
          gh_sc_1=lerp(gh_sc_1, 0, lerp_rate);
          if(gh_sc_1<.05){
            gh_sc_1=0;
          }
        }else{
          gh_sc_1=lerp(gh_sc_1, 2, lerp_rate);
          if(gh_sc_1>1.95){
            gh_sc_1=2;
          }
        }
        pushMatrix();
        translate(x,y);
        scale(gh_sc_1);
        stroke(lR,lG,lB,100);
        fill(tR,tG,tB,100);
        triangle(-30, -30, 0, 30, 30, -30);
        popMatrix();
      }
      if(counter>sec_tri){
        if(counter>grow){
          gh_sc_2=lerp(gh_sc_2, 0, lerp_rate);
          if(gh_sc_2<.05){
            gh_sc_2=0;
          }
        }else{
          gh_sc_2=lerp(gh_sc_2, 3, lerp_rate);
          if(gh_sc_2>2.95){
            gh_sc_2=3;
          }
        }
        pushMatrix();
        translate(x,y);
        scale(gh_sc_2);
        stroke(lR,lG,lB,50);
        fill(tR,tG,tB,50);
        triangle(-30, -30, 0, 30, 30, -30);
        popMatrix();
      }
      if(counter>third_tri){
        if(counter>grow){
          gh_sc_3=lerp(gh_sc_3, 0, lerp_rate);
          if(gh_sc_3<.05){
            gh_sc_3=0;
          }
        }else{
          gh_sc_3=lerp(gh_sc_3, 5, lerp_rate);
          if(gh_sc_3>4.95){
            gh_sc_3=5;
          }
        }
        pushMatrix();
        translate(x,y);
        scale(gh_sc_3);
        stroke(lR,lG,lB,25);
        fill(tR,tG,tB,25);
        triangle(-30, -30, 0, 30, 30, -30);
        popMatrix();
      }
      if(counter>reset){
        counter = 0;
        shrink = int(random(10, 50));
        temper=random(.5,1.3);
        first_tri=shrink+15*temper;
        sec_tri=first_tri+5*temper;
        third_tri=sec_tri+5*temper;
        grow=third_tri+int(random(10, 50));
        reset=grow+int(random(10,50));
        x=random(-1000, displayWidth-1000);
        y=random(1000, displayHeight+1000);
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
            pushMatrix();
            translate(x,y);
            scale(2);
            stroke(lR,lG,lB,50);
            fill(tR,tG,tB,50);
            triangle(-30, -30, 0, 30, 30, -30);
            popMatrix();
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
            stroke(lR,lG,lB,50);
            fill(tR,tG,tB,50);
            triangle(x-120, y-120, x, y+120, x+120, y-120);
          }
        }
      }
    }
  }
  
  float new_sc;
  
  void release(){
    if(caught==true){
      if(x<width-1000 || y>1000){
        x=random(-1000, width);
        y=random(height+1000);
        travel();
        free=true;
        sc=1;
        counter=0;
        shrink = int(random(10, 50));
        temper=random(.5,1.3);
        first_tri=shrink+15*temper;
        sec_tri=first_tri+5*temper;
        third_tri=sec_tri+5*temper;
        grow=third_tri+int(random(10, 50));
        reset=grow+int(random(10,50));
      }else if(x>width-1000){
        if(x-y>1000){
          stay();
          free=false;
          sc=random(.5,1);
          new_sc=sc;
          counter=0;
          shrink = int(random(10, 50));
          temper=random(.5,1.3);
          first_tri=shrink+15*temper;
          sec_tri=first_tri+5*temper;
          third_tri=sec_tri+5*temper;
          grow=third_tri+int(random(10, 50));
          reset=grow+int(random(10,50));
        }
      }
      caught=false;
    }
  }
  
  void stay(){
    if(caught==false){
      pushMatrix();
      translate(x, y);
      counter+=1;
      if(counter<shrink){
        scale(sc);
      }else{
        if(counter>grow){
          sc=lerp(sc, new_sc, lerp_rate);
          if(sc>new_sc-.05){
            sc=new_sc;
          }
        }else{
          sc=lerp(sc, new_sc/2, lerp_rate);
          if(sc<new_sc/2+.05){
            sc=new_sc/2;
          }
        }
        scale(sc);
      }
      shape(spider);
      strokeWeight(1);
      stroke(lR,lG,lB);
      fill(tR,tG,tB);
      triangle(-30, -30, 0, 30, 30, -30);
      popMatrix();
      if(counter>first_tri){
        if(counter<first_tri+2){
          triangles();
        }
        if(counter>grow){
          gh_sc_1=lerp(gh_sc_1, 0, lerp_rate);
          if(gh_sc_1<.05){
            gh_sc_1=0;
          }
        }else{
          gh_sc_1=lerp(gh_sc_1, new_sc*2, lerp_rate);
          if(gh_sc_1>new_sc*2-.05){
            gh_sc_1=new_sc*2;
          }
        }
        pushMatrix();
        translate(x,y);
        scale(gh_sc_1);
        stroke(lR,lG,lB,100);
        fill(tR,tG,tB,100);
        triangle(-30, -30, 0, 30, 30, -30);
        popMatrix();
      }
      if(counter>sec_tri){
        if(counter>grow){
          gh_sc_2=lerp(gh_sc_2, 0, lerp_rate);
          if(gh_sc_2<.05){
            gh_sc_2=0;
          }
        }else{
          gh_sc_2=lerp(gh_sc_2, new_sc*3, lerp_rate);
          if(gh_sc_2>new_sc*3-.05){
            gh_sc_2=new_sc*3;
          }
        }
        pushMatrix();
        translate(x,y);
        scale(gh_sc_2);
        stroke(lR,lG,lB,50);
        fill(tR,tG,tB,50);
        triangle(-30, -30, 0, 30, 30, -30);
        popMatrix();
      }
      if(counter>third_tri){
        if(counter>grow){
          gh_sc_3=lerp(gh_sc_3, 0, lerp_rate);
          if(gh_sc_3<.05){
            gh_sc_3=0;
          }
        }else{
          gh_sc_3=lerp(gh_sc_3, new_sc*5, lerp_rate);
          if(gh_sc_3>new_sc*5-.05){
            gh_sc_3=new_sc*5;
          }
        }
        pushMatrix();
        translate(x,y);
        scale(gh_sc_3);
        stroke(lR,lG,lB,25);
        fill(tR,tG,tB,25);
        triangle(-30, -30, 0, 30, 30, -30);
        popMatrix();
      }
      if(counter>reset){
        counter = 0;
        shrink = int(random(10, 50));
        temper=random(.5,1.3);
        first_tri=shrink+15*temper;
        sec_tri=first_tri+5*temper;
        third_tri=sec_tri+5*temper;
        grow=third_tri+int(random(10, 50));
        reset=grow+int(random(10,50));
      }
      for(Blob b : blobs){
        catchX=abs(b.sCX()-x);
        catchY=abs(b.sCY()-y);
        if(catchX<b.net && catchY<b.net){
          if(b.thisColor==trackGreen || b.thisColor==trackYellow){
            x=b.sCX();
            y=b.sCY();
            pushMatrix();
            translate(x,y);
            scale(sc);
            shape(spider);
            popMatrix();
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
            pushMatrix();
            translate(x,y);
            scale(sc);
            shape(spider);
            popMatrix();
          }
        }
      }
    }
  }
  
  void flash(){
    int gate=1;
    OscMessage b2 = new OscMessage("/b2");
    b2.add(tag);
    b2.add(y);
    b2.add(bB);
    b2.add(new_sc);
    b2.add(temper);
    b2.add(gate);
    oscP5.send(b2, myRemoteLocation); 
  }
  
  void triangles(){
    int gate = 2;
    OscMessage b2 = new OscMessage("/b2");
    b2.add(tag);
    b2.add(y);
    b2.add(bB);
    b2.add(new_sc);
    b2.add(temper);
    b2.add(gate);
    oscP5.send(b2, myRemoteLocation);
  }
  
  void changed(){
    bR=random(150, 200);
    bG=random(150,200);
    bB=random(150,200);
    lR=random(100,150);
    lG=random(100,150);
    lB=random(100,150);
    tR=random(200,250);
    tG=random(200,250);
    tB=random(200,250);
    ibR=random(150,200);
    ibG=random(150,200);
    ibB=random(150,200);
    iaR=random(100,150);
    iaG=random(100,150);
    iaB=random(100,150);
    new_sc=random(.5,1.);
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
        if(bug3[i].tag == tag){
          bug3[i].caught = true;
          bug3[i].x1 = x;
          bug3[i].y1 = y;
          bug3[i].release();
        }
      }
    }else{
      for(int i=0; i<bug_count; i++){
        if(bug4[i].tag == tag){
          bug4[i].caught = true;
          bug4[i].x = x;
          bug4[i].y = y;
          bug4[i].release();
        }
      }
    }
    counter = 0;
    shrink = int(random(10, 50));
    temper=random(.5,1.3);
    first_tri=shrink+15*temper;
    sec_tri=first_tri+5*temper;
    third_tri=sec_tri+5*temper;
    grow=third_tri+int(random(10, 50));
    reset=grow+int(random(10,50));
    x=random(-1000, displayWidth-1000);
    y=random(1000, displayHeight+1000);
    release();
  }
}
