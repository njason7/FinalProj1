public class Enemy extends Unit{
  public Enemy(){
    super(1, (int) random(550), 0, 0, 3, 20, 20);
  }
  
  public Enemy(int Health, int Xcor, int Ycor, int Xmove, int Ymove, int w, int h){
          super(Health, Xcor, Ycor, Xmove, Ymove, w, h);
  }
  
  void move(){
    setXCor(getXCor()+getXMove());
    setYCor(getYCor()+getYMove());
  }
  
  public void display(){
     if (getHealth()>0){
       fill(255,0,0);
       move();
       rect(getXCor(),getYCor(),getWidth(),getHeight());
     }
  }
}
