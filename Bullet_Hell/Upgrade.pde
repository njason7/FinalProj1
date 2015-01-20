class Upgrade extends Unit{
  public Upgrade(int Health, int Xcor, int Ycor, int Xmove, int Ymove, int w, int h){
          super(Health, Xcor, Ycor, Xmove, Ymove, w, h);
  }
  
  void move(){
    setXCor(getXCor()+getXMove());
    setYCor(getYCor()+getYMove());
  }

  
  void display(){
    if (getHealth()>0){
     fill(0,255,0);
     move();
     ellipse(getXCor(),getYCor(),getWidth(),getHeight());
    }
  }
}

