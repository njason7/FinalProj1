class E_Bullets extends Unit{
  public E_Bullets(int XCor,int YCor, int XMove, int YMove){
      super(1, XCor, YCor, XMove, YMove, 8 , 8);

  }
  
  public E_Bullets(int Health, int Xcor, int Ycor, int Xmove, int Ymove, int w, int h){
          super(1, Xcor, Ycor, Xmove, Ymove, w, h);
  }
  

  public void display(){
    if (getHealth()>0){
     fill(255,0,0);
     ellipse(getXCor(),getYCor(),getWidth(),getHeight());
    }
  }
  
}
