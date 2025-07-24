class Bug3{
  float x1, y1, x2, y2, x3, y3, x4, y4, w1, h1, w2, h2, w3, h3, w4, h4;
  
  float r1, g1, b1, r2, g2, b2, r3, g3, b3;
  
  int counter=0;
  int count_wait=int(random(10,50));
  int diff=int(random(1,5));
  int second=count_wait+diff;
  int third=second+diff;
  int fourth=third+diff;
  int reset=fourth+int(random(10,50));
  
  int op1=0;
  int op2=0;
  int op3=0;
  int op4=0;
  
  boolean caught=false;
  boolean free=true;
  
  float catchX;
  float catchY;
  
  int tag;
  
  void add(){
    x1=random(-2000, width-1000);
    y1=random(height+1000);
    w1=random(50,100);
    h1=random(50,100);
    r1=random(200, 250);
    g1=random(200,250);
    b1=random(200,250);
    r2=random(150,200);
    g2=random(150,200);
    b2=random(150,200);
    r3=random(100,150);
    g3=random(100,150);
    b3=random(100,150);
    w2=random(50,100);
    h2=random(50,100);
    w3=random(50,100);
    h3=random(50,100);
    w4=random(50,100);
    h4=random(50,100);
    float chance = random(100);
    if(chance>50){
      x2 = x1;
      if(h1>h2){
        float chance2 = random(100);
        if(chance2>50){
          y2= y1 + h1;
        }else{
          y2 = y1 - h1;
        }
      }else{
        float chance2 = random(100);
        if(chance2>50){
          y2= y1 + h2;
        }else{
          y2 = y1 - h2;
        }
      }
    }else{
      y2=y1;
      if(w1>w2){
        float chance2 = random(100);
        if(chance2>50){
          x2=x1+w1;
        }else{
          x2=x1-w1;
        }
      }else{
        float chance2 = random(100);
        if(chance2>50){
          x2=x1+w2;
        }else{
          x2=x1-w2;
        }
      }
    }
    if(x2>x1 || x2<x1){
      if(x2>x1){
        float chance2 = random(100);
        if(chance2>50){
          x3=x2;
          if(h2>h3){
            float chance3 = random(100);
            if(chance3>50){
              y3= y2 + h2;
            }else{
              y3 = y2 - h2;
            }
          }else{
            float chance3 = random(100);
            if(chance3>50){
              y3= y2 + h3;
            }else{
              y3 = y2 - h3;
            }
          }
        }else{
          y3=y2;
          if(w2>w3){
            x3= x2 + w2;
          }else{
            x3=x2 + w3;
          }
        }
      }else{
        float chance2 = random(100);
        if(chance2>50){
          x3=x2;
          if(h2>h3){
            float chance3 = random(100);
            if(chance3>50){
              y3=y2 + h2;
            }else{
              y3= y2 -h2;
            }
          }else{
            float chance3 = random(100);
            if(chance3>50){
              y3=y2 + h3;
            }else{
              y3= y2 -h3;
            }
          }
        }else{
          y3=y2;
          if(w2>w3){
            x3=x2 - w2;
          }else{
            x3=x2 - w3;
          }
        }
      }
    }else{
      if(y2>y1){
        float chance2 = random(100);
        if(chance2>50){
          y3=y2;
          if(w2>w3){
            float chance3 = random(100);
            if(chance3>50){
              x3= x2 + w2;
            }else{
              x3 = x2 - w2;
            }
          }else{
            float chance3 = random(100);
            if(chance3>50){
              x3= x2 + w3;
            }else{
              x3 = x2 - w3;
            }
          }
        }else{
          x3 = x2;
          if(h2>h3){
            y3 = y2 + h2;
          }else{
            y3 = y2 + h3;
          }
        }
      }else{
        float chance2 = random(100);
        if(chance2>50){
          y3=y2;
          if(w2>w3){
            float chance3 = random(100);
            if(chance3>50){
              x3 = x2 + w2;
            }else{
              x3 = x2 - w2;
            }
          }else{
            float chance3 = random(100);
            if(chance3>50){
              x3 = x2 + w3;
            }else{
              x3 = x2 - w3;
            }
          }
        }else{
          x3 = x2;
          if(h2>h3){
            y3 = y2 - h2;
          }else{
            y3 = y2 - h3;
          }
        }
      }
    }
    if(x3>x2 || x3<x2){
      if(x3>x2){
        float chance2 = random(100);
        if(chance2>50){
          x4=x3;
          if(h3>h4){
            float chance3 = random(100);
            if(chance3>50){
              y4= y3 + h3;
            }else{
              y4 = y3 - h3;
            }
          }else{
            float chance3 = random(100);
            if(chance3>50){
              y4= y3 + h4;
            }else{
              y4 = y3 - h4;
            }
          }
        }else{
          y4=y3;
          if(w3>w4){
            x4= x3 + w3;
          }else{
            x4=x3 + w4;
          }
        }
      }else{
        float chance2 = random(100);
        if(chance2>50){
          x4=x3;
          if(h3>h4){
            float chance3 = random(100);
            if(chance3>50){
              y4=y3 + h3;
            }else{
              y4= y3 -h3;
            }
          }else{
            float chance3 = random(100);
            if(chance3>50){
              y4=y3 + h4;
            }else{
              y4= y3 -h4;
            }
          }
        }else{
          y4=y3;
          if(w3>w4){
            x4=x3 - w3;
          }else{
            x4=x3 - w4;
          }
        }
      }
    }else{
      if(y3>y2){
        float chance2 = random(100);
        if(chance2>50){
          y4=y3;
          if(w3>w4){
            float chance3 = random(100);
            if(chance3>50){
              x4= x3 + w3;
            }else{
              x4 = x3 - w3;
            }
          }else{
            float chance3 = random(100);
            if(chance3>50){
              x4= x3 + w4;
            }else{
              x4 = x3 - w4;
            }
          }
        }else{
          x4 = x3;
          if(h3>h4){
            y4 = y3 + h3;
          }else{
            y4 = y3 + h4;
          }
        }
      }else{
        float chance2 = random(100);
        if(chance2>50){
          y4=y3;
          if(w3>w4){
            float chance3 = random(100);
            if(chance3>50){
              x4 = x3 + w3;
            }else{
              x4 = x3 - w3;
            }
          }else{
            float chance3 = random(100);
            if(chance3>50){
              x4 = x3 + w4;
            }else{
              x4 = x3 - w4;
            }
          }
        }else{
          x4 = x3;
          if(h3>h4){
            y4 = y3 - h3;
          }else{
            y4 = y3 - h4;
          }
        }
      }
    }
  }
  
  void crawl(){
    rectMode(CENTER);
    ellipseMode(CENTER);
    noStroke();
    pushMatrix();
    translate(x1,y1);
    fill(r1, g1, b1, op1);
    rect(0,0, w1,h1);
    popMatrix();
    pushMatrix();
    translate(x2, y2);
    fill(r1, g1, b1, op2);
    rect(0, 0, w2, h2);
    popMatrix();
    pushMatrix();
    translate(x3, y3);
    fill(r1, g1, b1, op3);
    rect(0,0, w3, h3);
    popMatrix();
    pushMatrix();
    translate(x4, y4);
    fill(r1, g1, b1, op4);
    rect(0, 0, w4, h4);
    popMatrix();
    if(caught==false){
      counter+=1;
      if(counter>count_wait-1){
        if(counter==count_wait){
          x1=random(-2000, width-1000);
          y1=random(height+1000);
          op1=50;
          if(x1>0 && y1<height){
            rec(x1, x1, y1, tag);
          }
        }
        if(counter==second){
          float chance = random(100);
          if(chance>50){
            x2 = x1;
            if(h1>h2){
              float chance2 = random(100);
              if(chance2>50){
                y2= y1 + h1;
              }else{
                y2 = y1 - h1;
              }
            }else{
              float chance2 = random(100);
              if(chance2>50){
                y2= y1 + h2;
              }else{
                y2 = y1 - h2;
              }
            }
          }else{
            y2=y1;
            if(w1>w2){
              float chance2 = random(100);
              if(chance2>50){
                x2=x1+w1;
              }else{
                x2=x1-w1;
              }
            }else{
              float chance2 = random(100);
              if(chance2>50){
                x2=x1+w2;
              }else{
                x2=x1-w2;
              }
            }
          }
          op2=50;
          if(x2>0 && y2<height){
            rec(x1, x2, y2, tag);
          }
        }
        if(counter == third){
          if(x2>x1 || x2<x1){
            if(x2>x1){
              float chance2 = random(100);
              if(chance2>50){
                x3=x2;
                if(h2>h3){
                  float chance3 = random(100);
                  if(chance3>50){
                    y3= y2 + h2;
                  }else{
                    y3 = y2 - h2;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    y3= y2 + h3;
                  }else{
                    y3 = y2 - h3;
                  }
                }
              }else{
                y3=y2;
                if(w2>w3){
                  x3= x2 + w2;
                }else{
                  x3=x2 + w3;
                }
              }
            }else{
              float chance2 = random(100);
              if(chance2>50){
                x3=x2;
                if(h2>h3){
                  float chance3 = random(100);
                  if(chance3>50){
                    y3=y2 + h2;
                  }else{
                    y3= y2 -h2;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    y3=y2 + h3;
                  }else{
                    y3= y2 -h3;
                  }
                }
              }else{
                y3=y2;
                if(w2>w3){
                  x3=x2 - w2;
                }else{
                  x3=x2 - w3;
                }
              }
            }
          }else{
            if(y2>y1){
              float chance2 = random(100);
              if(chance2>50){
                y3=y2;
                if(w2>w3){
                  float chance3 = random(100);
                  if(chance3>50){
                    x3= x2 + w2;
                  }else{
                    x3 = x2 - w2;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    x3= x2 + w3;
                  }else{
                    x3 = x2 - w3;
                  }
                }
              }else{
                x3 = x2;
                if(h2>h3){
                  y3 = y2 + h2;
                }else{
                  y3 = y2 + h3;
                }
              }
            }else{
              float chance2 = random(100);
              if(chance2>50){
                y3=y2;
                if(w2>w3){
                  float chance3 = random(100);
                  if(chance3>50){
                    x3 = x2 + w2;
                  }else{
                    x3 = x2 - w2;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    x3 = x2 + w3;
                  }else{
                    x3 = x2 - w3;
                  }
                }
              }else{
                x3 = x2;
                if(h2>h3){
                  y3 = y2 - h2;
                }else{
                  y3 = y2 - h3;
                }
              }
            }
          }
          op3=50;
          if(x3>0 && y3<height){
            rec(x1, x3, y3, tag);
          }
        }
        if(counter == fourth){
          if(x3>x2 || x3<x2){
            if(x3>x2){
              float chance2 = random(100);
              if(chance2>50){
                x4=x3;
                if(h3>h4){
                  float chance3 = random(100);
                  if(chance3>50){
                    y4= y3 + h3;
                  }else{
                    y4 = y3 - h3;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    y4= y3 + h4;
                  }else{
                    y4 = y3 - h4;
                  }
                }
              }else{
                y4=y3;
                if(w3>w4){
                  x4= x3 + w3;
                }else{
                  x4=x3 + w4;
                }
              }
            }else{
              float chance2 = random(100);
              if(chance2>50){
                x4=x3;
                if(h3>h4){
                  float chance3 = random(100);
                  if(chance3>50){
                    y4=y3 + h3;
                  }else{
                    y4= y3 -h3;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    y4=y3 + h4;
                  }else{
                    y4= y3 -h4;
                  }
                }
              }else{
                y4=y3;
                if(w3>w4){
                  x4=x3 - w3;
                }else{
                  x4=x3 - w4;
                }
              }
            }
          }else{
            if(y3>y2){
              float chance2 = random(100);
              if(chance2>50){
                y4=y3;
                if(w3>w4){
                  float chance3 = random(100);
                  if(chance3>50){
                    x4= x3 + w3;
                  }else{
                    x4 = x3 - w3;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    x4= x3 + w4;
                  }else{
                    x4 = x3 - w4;
                  }
                }
              }else{
                x4 = x3;
                if(h3>h4){
                  y4 = y3 + h3;
                }else{
                  y4 = y3 + h4;
                }
              }
            }else{
              float chance2 = random(100);
              if(chance2>50){
                y4=y3;
                if(w3>w4){
                  float chance3 = random(100);
                  if(chance3>50){
                    x4 = x3 + w3;
                  }else{
                    x4 = x3 - w3;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    x4 = x3 + w4;
                  }else{
                    x4 = x3 - w4;
                  }
                }
              }else{
                x4 = x3;
                if(h3>h4){
                  y4 = y3 - h3;
                }else{
                  y4 = y3 - h4;
                }
              }
            }
          }
          op4=50;
          if(x4>0 && y4<height){
            rec(x1, x4, y4, tag);
          }
        }
        if(counter == reset){
          counter = 0;
          diff=int(random(1,5));
          count_wait=int(random(10,50));
          second=count_wait+diff;
          third=second+diff;
          fourth=third+diff;
          reset=fourth+int(random(10,50));
          op1=0;
          op2=0;
          op3=0;
          op4=0;
        }
      }
      for(Blob b : blobs){
        catchX=abs(b.sCX()-x1);
        catchY=abs(b.sCY()-y1);
        if(catchX<b.net && catchY<b.net){
          if(b.thisColor==trackGreen || b.thisColor==trackYellow){
            x1=b.sCX()+w1/2;
            x2=x1-h1;
            x3=x2;
            x4=x1;
            y1=b.sCY()+h1/2;
            y2=y1;
            y3=y1-h1;
            y4=y3;
            b.hasBug=true;
            caught=true;
            caught(y1);
            op1=50;
            op2=50;
            op3=50;
            op4=50;
          }else if(b.thisColor==trackBlue){
            bluee(y1);
            changed();
          }
        }
      }
    }else{
      for(Blob b : blobs){
        if(b.thisColor==trackGreen || b.thisColor==trackYellow){
          if(b.hasBug){
            x1=b.sCX()+w1/2;
            x2=x1-h1;
            x3=x2;
            x4=x1;
            y1=b.sCY()+h1/2;
            y2=y1;
            y3=y1-h1;
            y4=y3;
          }
        }
      }
    }
  }
  
  void release(){
    if(caught==true){
      if(x1<width-1000 || y1>1000){
        counter = 0;
        count_wait=int(random(10,50));
        diff=int(random(1,5));
        second=count_wait+diff;
        third=second+diff;
        fourth=third+diff;
        reset=fourth+int(random(10, 50));
        op1=0;
        op2=0;
        op3=0;
        op4=0;
        crawl();
        free=true;
      }else if(x1>width-1000){
        if(x1-y1>1000){
          counter = 0;
          count_wait=int(random(10,50));
          diff=int(random(1,5));
          second=count_wait+diff;
          third=second+diff;
          fourth=third+diff;
          reset=fourth+int(random(10, 50));
          free=false;
          squirm();
        }
      }
      caught=false;
    }
  }
  
  void squirm(){
    rectMode(CENTER);
    ellipseMode(CENTER);
    noStroke();
    pushMatrix();
    translate(x1,y1);
    fill(r1, g1, b1);
    rect(0,0, w1,h1);
    fill(r2, g2, b2);
    ellipse(0,0,w1*random(.5,.8), h1*random(.5,.8));
    fill(r3, g3, b3);
    ellipse(0,0, w1*random(.25, .4), h1*random(.25,.4));
    popMatrix();
    pushMatrix();
    translate(x2, y2);
    fill(r1, g1, b1);
    rect(0, 0, w2, h2);
    fill(r2, g2, b2);
    ellipse(0,0, w2*random(.5,.8), h2*random(.5,.8));
    popMatrix();
    pushMatrix();
    translate(x3, y3);
    fill(r1, g1, b1);
    rect(0,0, w3, h3);
    fill(r2, g2, b2);
    ellipse(0,0,w3*random(.5,.8), h3*random(.5,.8));
    popMatrix();
    pushMatrix();
    translate(x4, y4);
    fill(r1, g1, b1);
    rect(0, 0, w4, h4);
    fill(r2, g2, b2);
    ellipse(0, 0, w4*random(.5,.8), h4*random(.5,.8));
    popMatrix();
    if(caught==false){
      counter+=1;
      if(counter==count_wait){
        block(x1, x1, y1, tag);
      }
      if(counter>count_wait){
        if(counter<second){
        }
        if(counter==second){
          float chance = random(100);
          if(chance>50){
            x2 = x1;
            if(h1>h2){
              float chance2 = random(100);
              if(chance2>50){
                y2= y1 + h1;
              }else{
                y2 = y1 - h1;
              }
            }else{
              float chance2 = random(100);
              if(chance2>50){
                y2= y1 + h2;
              }else{
                y2 = y1 - h2;
              }
            }
          }else{
            y2=y1;
            if(w1>w2){
              float chance2 = random(100);
              if(chance2>50){
                x2=x1+w1;
              }else{
                x2=x1-w1;
              }
            }else{
              float chance2 = random(100);
              if(chance2>50){
                x2=x1+w2;
              }else{
                x2=x1-w2;
              }
            }
          }
          block(x1, x2, y2, tag);
        }
        if(counter == third){
          if(x2>x1 || x2<x1){
            if(x2>x1){
              float chance2 = random(100);
              if(chance2>50){
                x3=x2;
                if(h2>h3){
                  float chance3 = random(100);
                  if(chance3>50){
                    y3= y2 + h2;
                  }else{
                    y3 = y2 - h2;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    y3= y2 + h3;
                  }else{
                    y3 = y2 - h3;
                  }
                }
              }else{
                y3=y2;
                if(w2>w3){
                  x3= x2 + w2;
                }else{
                  x3=x2 + w3;
                }
              }
            }else{
              float chance2 = random(100);
              if(chance2>50){
                x3=x2;
                if(h2>h3){
                  float chance3 = random(100);
                  if(chance3>50){
                    y3=y2 + h2;
                  }else{
                    y3= y2 -h2;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    y3=y2 + h3;
                  }else{
                    y3= y2 -h3;
                  }
                }
              }else{
                y3=y2;
                if(w2>w3){
                  x3=x2 - w2;
                }else{
                  x3=x2 - w3;
                }
              }
            }
          }else{
            if(y2>y1){
              float chance2 = random(100);
              if(chance2>50){
                y3=y2;
                if(w2>w3){
                  float chance3 = random(100);
                  if(chance3>50){
                    x3= x2 + w2;
                  }else{
                    x3 = x2 - w2;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    x3= x2 + w3;
                  }else{
                    x3 = x2 - w3;
                  }
                }
              }else{
                x3 = x2;
                if(h2>h3){
                  y3 = y2 + h2;
                }else{
                  y3 = y2 + h3;
                }
              }
            }else{
              float chance2 = random(100);
              if(chance2>50){
                y3=y2;
                if(w2>w3){
                  float chance3 = random(100);
                  if(chance3>50){
                    x3 = x2 + w2;
                  }else{
                    x3 = x2 - w2;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    x3 = x2 + w3;
                  }else{
                    x3 = x2 - w3;
                  }
                }
              }else{
                x3 = x2;
                if(h2>h3){
                  y3 = y2 - h2;
                }else{
                  y3 = y2 - h3;
                }
              }
            }
          }
          block(x1, x3, y3, tag);
        }
        if(counter == fourth){
          if(x3>x2 || x3<x2){
            if(x3>x2){
              float chance2 = random(100);
              if(chance2>50){
                x4=x3;
                if(h3>h4){
                  float chance3 = random(100);
                  if(chance3>50){
                    y4= y3 + h3;
                  }else{
                    y4 = y3 - h3;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    y4= y3 + h4;
                  }else{
                    y4 = y3 - h4;
                  }
                }
              }else{
                y4=y3;
                if(w3>w4){
                  x4= x3 + w3;
                }else{
                  x4=x3 + w4;
                }
              }
            }else{
              float chance2 = random(100);
              if(chance2>50){
                x4=x3;
                if(h3>h4){
                  float chance3 = random(100);
                  if(chance3>50){
                    y4=y3 + h3;
                  }else{
                    y4= y3 -h3;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    y4=y3 + h4;
                  }else{
                    y4= y3 -h4;
                  }
                }
              }else{
                y4=y3;
                if(w3>w4){
                  x4=x3 - w3;
                }else{
                  x4=x3 - w4;
                }
              }
            }
          }else{
            if(y3>y2){
              float chance2 = random(100);
              if(chance2>50){
                y4=y3;
                if(w3>w4){
                  float chance3 = random(100);
                  if(chance3>50){
                    x4= x3 + w3;
                  }else{
                    x4 = x3 - w3;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    x4= x3 + w4;
                  }else{
                    x4 = x3 - w4;
                  }
                }
              }else{
                x4 = x3;
                if(h3>h4){
                  y4 = y3 + h3;
                }else{
                  y4 = y3 + h4;
                }
              }
            }else{
              float chance2 = random(100);
              if(chance2>50){
                y4=y3;
                if(w3>w4){
                  float chance3 = random(100);
                  if(chance3>50){
                    x4 = x3 + w3;
                  }else{
                    x4 = x3 - w3;
                  }
                }else{
                  float chance3 = random(100);
                  if(chance3>50){
                    x4 = x3 + w4;
                  }else{
                    x4 = x3 - w4;
                  }
                }
              }else{
                x4 = x3;
                if(h3>h4){
                  y4 = y3 - h3;
                }else{
                  y4 = y3 - h4;
                }
              }
            }
          }
          block(x1, x4, y4, tag);
        }
        if(counter == reset){
          counter = 0;
          count_wait=int(random(10,50));
          diff=int(random(1,3));
          second=count_wait+diff;
          third=second+diff;
          fourth=third+diff;
          reset=fourth+int(random(10, 50));
        }
      }
      for(Blob b : blobs){
        catchX=abs(b.sCX()-x1);
        catchY=abs(b.sCY()-y1);
        if(catchX<b.net && catchY<b.net){
          if(b.thisColor==trackGreen || b.thisColor==trackYellow){
            x1=b.sCX()+w1/2;
            x2=x1-h1;
            x3=x2;
            x4=x1;
            y1=b.sCY()+h1/2;
            y2=y1;
            y3=y1-h1;
            y4=y3;
            b.hasBug=true;
            caught=true;
            caught(y1);
            op1=50;
            op2=50;
            op3=50;
            op4=50;
          }else if(b.thisColor==trackBlue){
            bluee(y1);
            changed();
          }else if(b.thisColor==trackRed){
            redd();
          }
        }
      }
    }else{
      for(Blob b : blobs){
        if(b.thisColor==trackGreen || b.thisColor==trackYellow){
          if(b.hasBug){
            x1=b.sCX()+w1/2;
            x2=x1-h1;
            x3=x2;
            x4=x1;
            y1=b.sCY()+h1/2;
            y2=y1;
            y3=y1-h1;
            y4=y3;
          }
        }
      }
    }
  }
  
  void rec(float x1, float x, float y, int tag){
    int gate = 1;
    float del;
    float len;
    float pit;
    del=x1;
    len=x;
    pit=y;
    OscMessage b3 = new OscMessage("/b3");
    b3.add(gate);
    b3.add(tag);
    b3.add(del);
    b3.add(len);
    b3.add(pit);
    oscP5.send(b3, myRemoteLocation);
  }
  
  void block(float x1, float x, float y, int tag){
    int gate = 2;
    float del;
    float len;
    float pit;
    del=x1;
    len=x;
    pit=y;
    OscMessage b3 = new OscMessage("/b3");
    b3.add(gate);
    b3.add(tag);
    b3.add(del);
    b3.add(len);
    b3.add(pit);
    oscP5.send(b3, myRemoteLocation);
  }

  void changed(){
    w1=random(50,100);
    h1=random(50,100);
    r1=random(200, 250);
    g1=random(200,250);
    b1=random(200,250);
    r2=random(150,200);
    g2=random(150,200);
    b2=random(150,200);
    r3=random(100,150);
    g3=random(100,150);
    b3=random(100,150);
    w2=random(50,100);
    h2=random(50,100);
    w3=random(50,100);
    h3=random(50,100);
    w4=random(50,100);
    h4=random(50,100);
  }
  
  void redd(){
    caught=true;
    OscMessage red = new OscMessage("/red");
    red.add(y1);
    oscP5.send(red, myRemoteLocation);
    float chance=random(30);
    if(chance>20){
      for(int i=0; i<bug_count; i++){
        if(bug1[i].tag == tag){
          bug1[i].caught = true;
          bug1[i].b1x = x1;
          bug1[i].b1y = y1;
          bug1[i].release();
        }
      }
    }else if(chance>10){
      for(int i=0; i<bug_count; i++){
        if(bug2[i].tag == tag){
          bug2[i].caught = true;
          bug2[i].x = x1;
          bug2[i].y = y1;
          bug2[i].release();
        }
      }
    }else{
      for(int i=0; i<bug_count; i++){
        if(bug4[i].tag == tag){
          bug4[i].caught = true;
          bug4[i].x = x1;
          bug4[i].y = y1;
          bug4[i].release();
        }
      }
    }
    x1=random(-2000, width-1000);
    y1=random(height+1000);
    release();
  }
}
