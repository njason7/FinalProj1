class P_Bullets{
  String type;
  int xstart, ystart, x, y;
  
  P_Bullets(int xstart, int ystart, String type){
    this.type = type;
    x = xstart;
    y = ystart;
  }
  
  void fire(){
    y--;
  }
  
  void draw(){
    fill(0);
    ellipse(x,y,3,3);
  }
}
