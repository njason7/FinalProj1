class E_Bullets extends Unit{
  public E_Bullets(){
  }
  
  public E_Bullets(int Health, int Xcor, int Ycor, int Xmove, int Ymove, int w, int h){
          super(0, Xcor, Ycor, Xmove, Ymove, w, h);
  }
  
  
  public void display(){
     fill(255,0,0);
     
     ellipse(getXCor(),getYCor(),getWidth(),getHeight());
  }
  
}
