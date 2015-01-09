class P_Bullets{
  String type;
  int xstart, ystart, x, y;
  
  
  P_Bullets(int xstart, int ystart, String type){
    this.type = type;
    x = xstart;
    y = ystart;
  }
  
  void fire(){
    y = y - 10;
  }
  
  int gety(){
    return y;
  }
  
  void draw(){
    fill(0);
    ellipse(x,y,5,5);
    if (y>0){
    fire();
    }
  }
}
