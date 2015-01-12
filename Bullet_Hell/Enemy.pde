public class Enemy extends Unit{
  public Enemy(){
    super(1, (int) random(550), 0, 0, 0, 50, 50);
  }
  
  public Enemy(int Health, int Xcor, int Ycor, int Xmove, int Ymove, int w, int h){
          super(Health, Xcor, Ycor, Xmove, Ymove, w, h);
  }
  
  public void display(){
     fill(0);
     rect(getXCor(),getYCor(),getWidth(),getHeight());
  }
}
