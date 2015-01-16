public class Player extends Unit{
 private int bombs;
 private int lives;
 private int damage;
 private boolean dead;
   
 public Player(){   
  super(100, mouseX, mouseY, 0 , 0, 30, 30);
  bombs = 3;
  lives = 3;
  damage = 10;
  dead = false;
    
   }
 public Player(int health, int xcor, int ycor, int xmove, int ymove, int w, int h,  int Bombs, int Lives, int Damage)
    {
      super(health, xcor, ycor, xmove, ymove, w, h);
      lives = Lives;
      bombs = Bombs;
      damage = Damage;
    }
    
 public int getBombs(){
  return bombs;  
 }   
 public void setBombs(int Bombs){
   bombs = Bombs;
 }
 public int getLives(){
   return lives; 
 }
 public void setLives(int Lives){
  lives =  Lives;
 }
 public int getDamage(){
   return damage;
 }
 public void setDamage(int Damage){
  damage =  Damage;
 }
 
 public void displayLives(){
   for (int i = 0;i<lives;i++){
    triangle(670+((i-1)*50)+15,430-15,730+((i-1)*50)-15,430-15,700+((i-1)*50),370+15);
  }
 }

 public void display() {
    fill(0);
    if (lives == 0){
    dead = true; 
    }
   
    if (mouseX<580 && mouseX>20 && mouseY<780){
      triangle(mouseX-(width/2),mouseY+(height/2),mouseX+(width/2),mouseY+(height/2),mouseX,mouseY-(height/2));
    }else if (mouseX>=580){
      if (mouseY<800-(height/2)){
        triangle(570,mouseY+(height/2),600,mouseY+(height/2),585,mouseY-(height/2));
      }else{
        triangle(570,800,600,800,585,770);
      }
    }else if (mouseX<=20){
      triangle(0,mouseY+(height/2),30,mouseY+(height/2),15,mouseY-(height/2));
    }else if (mouseY>=780){
      triangle(mouseX-(width/2),800,mouseX+(width/2),800,mouseX,770);
    }
    
  }
  
  }
