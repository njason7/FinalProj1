class P_Bullets{
  String type;
  float x, y;
  int type2;
  
  
  P_Bullets(int xstart, int ystart, String type, int type2){
    this.type = type;
    x = float(xstart);
    y = float(ystart);
    this.type2 = type2;
  }
  
  void fire(){
    if (type.equals("Spread")){
      if (type2 == 0){
        x = x - cos(5*PI/12)*float(10);
        y = y - sin(5*PI/12)*float(10);
      }else if (type2 == 2){
        x = x + cos(5*PI/12)*float(10);
        y = y - sin(5*PI/12)*float(10);
      }else if (type2 == 1){
        y = y - 10;
      }else if (type2 == 3){
        x = x - cos(PI/3)*float(10);
        y = y - sin(PI/3)*float(10);
      }else if (type2 == 4){
        x = x + cos(PI/3)*10;
        y = y - sin(PI/3)*10;
      }else if (type2 == 5){
        x = x - cos(PI/4)*float(10);
        y = y - sin(PI/4)*float(10);
      }else if (type2 == 6){
        x = x + cos(PI/4)*float(10);
        y = y - sin(PI/4)*float(10);
      }
    }else{
    y = y - 10;
    }
  }
  
  float gety(){
    return y;
  }
  
  float getx(){
    return x;
  }
  
  void draw(){
    fill(0);
    ellipse(x,y,5,5);
    if (y>0){
    fire();
    }
  }
}
