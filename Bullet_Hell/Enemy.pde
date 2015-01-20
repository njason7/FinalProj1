public class Enemy extends Unit{
  public Enemy(){
    super(10, (int) random(550), 0, (int) random(3)-1, 3, (int) random(10)+15, (int) random(10)+15);
  }
  
  public Enemy(int Health, int Xcor, int Ycor, int Xmove, int Ymove, int w, int h){
          super(Health, Xcor, Ycor, Xmove, Ymove, w, h);
  }
  
  public class runner extends Enemy{
     public runner(){
        super(20, (int) random(550), 0, 0, 5, 30, 30);
     } 
     public runner(int xCor, int yCor){
       super(20, xCor, yCor, 0,5,30,30);
     }
     public void shoot(){       
     }
  }
  
  public class shooter extends Enemy{
     public shooter(){
        super(10, (int) random(550), 0, 0, 3, 20, 20);
     } 
     public shooter(int xCor, int yCor){
       super(10, xCor, yCor, 0, 3,20,20);
     }
     public void shoot(){
        bullet_time = millis();
         if (bullet_time%500 < 35){
         enemyb.add( new E_Bullets(getXCor()+ ((int) random(getWidth()/2)), getYCor()+getHeight(), (int) random(5)-2, 5));
         }
     }
    public void display(){
     if (getHealth()>0){
       fill(0,0,255);
       move();
       shoot();
       rect(getXCor(),getYCor(),getWidth(),getHeight());
     }
    } 
     
  }
  
  public class shooter2 extends Enemy{
     public shooter2(){
        super(10, (int) random(550), 0, 0, 3, 20, 20);
     } 
     public shooter2(int xCor, int yCor){
       super(10, xCor, yCor, 0, 3,20,20);
     }
     public void shoot(){
        bullet_time = millis();
         if (bullet_time%500 < 35){
         enemyb.add( new E_Bullets(getXCor()+ ((int) random(getWidth()/2)), getYCor()+getHeight(), (int) random(5)-2, 5));
         enemyb.add( new E_Bullets(getXCor()+ ((int) random(getWidth()/2)), getYCor()+getHeight(), (int) random(5)-2, 5));
         enemyb.add( new E_Bullets(getXCor()+ ((int) random(getWidth()/2)), getYCor()+getHeight(),(int) random(5)-2, 5));
         }
     }    
     
    public void display(){
     if (getHealth()>0){
       fill(255,0,255);
       move();
       shoot();
       rect(getXCor(),getYCor(),getWidth(),getHeight());
     }
    }     
     
  }  
  
  public class shooter3 extends Enemy{
     public shooter3(){
        super(10, (int) random(550), 0, 0, 3, 20, 20);
     } 
     public shooter3(int xCor, int yCor){
       super(10, xCor, yCor, 0, 3,20,20);
     }
     public void shoot(){
        bullet_time = millis();
         if (bullet_time%500 < 35){
         enemyb.add( new E_Bullets(getXCor()+ ((int) random(getWidth()/2)), getYCor()+(getHeight()/2), 0, 5));
         enemyb.add( new E_Bullets(getXCor()+ ((int) random(getWidth()/2)), getYCor()+(getHeight()/2), 0, -5));
         enemyb.add( new E_Bullets(getXCor()+ ((int) random(getWidth()/2)), getYCor()+(getHeight()/2), 5, 0));
         enemyb.add( new E_Bullets(getXCor()+ ((int) random(getWidth()/2)), getYCor()+(getHeight()/2), -5, 0));
         }
     }
     public void display(){
     if (getHealth()>0){
       fill(255,255,0);
       move();
       shoot();
       rect(getXCor(),getYCor(),getWidth(),getHeight());
     }
    }    
  }
    
  
  
  public class tank extends Enemy{
     public tank(){
        super(60, (int) random(550), 0, 0 , 1, 60 , 60);
     } 
     public tank(int xCor, int yCor){
       super(60, xCor, yCor, 0, 1 ,60, 60);
     }
    
    public void display(){
     if (getHealth()>0){
       fill(255,100,100);
       move();
       shoot();
       rect(getXCor(),getYCor(),getWidth(),getHeight());
     }
    }    
  }
  
 public class Boss extends Enemy{
     public Boss(){
        super(50, 100, 0, 0 , 0 , 400 , 200);
     } 
     public Boss(int xCor, int yCor){
       super(50, xCor, yCor, 0, 1 ,60, 60);
     }    
    public void display(){     
      if (getHealth()>0){
       fill(255,100,100);
       move();
       shoot();
       rect(getXCor(),getYCor(),getWidth(),getHeight());
     }
    }
    
       public void shoot(){
        bullet_time = millis();
         if ((bullet_time%500 > 10) && (bullet_time%500 <15)){
         enemyb.add( new E_Bullets(getXCor()+ ((int) random(getWidth())), getYCor()+getHeight(), (int) random(5)-2, 5));
         } 
          if (bullet_time%500 < 5){
         enemyb.add( new E_Bullets(getXCor()+ ((int) random(getWidth())), getYCor()+getHeight(), (int) random(5)-2, 5));
         } 
          if ((bullet_time%500 > 25) && (bullet_time%500 <30)){
         enemyb.add( new E_Bullets(getXCor()+ ((int) random(getWidth())), getYCor()+getHeight(), (int) random(5)-2, 5));
         }        
     }
    
     
  }  
  
  
  
  void move(){
    setXCor(getXCor()+getXMove());
    setYCor(getYCor()+getYMove());
  }

  public void shoot(){
  }  
  
  public void display(){
     if (getHealth()>0){
       fill(255,0,0);
       move();
       shoot();
       rect(getXCor(),getYCor(),getWidth(),getHeight());
     }
  }
}
