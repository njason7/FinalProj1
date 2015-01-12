int score,bullet_level,lives,bullet_spawn;
int bullety;
ArrayList<Enemy> enemy;
ArrayList<P_Bullets> playerb;
ArrayList<E_Bullets> enemyb;
Player player;

void setup(){
  background(255);
  size(800,800);
  rect(600,0,1,800);
  frameRate(30);
  score = 0;
  textAlign(CENTER);
  fill(0);
  textSize(24);
  lives = 3;
  frameRate(30);
  bullety= 0;
  playerb = new ArrayList<P_Bullets>();
  bullet_spawn = millis();
  player = new Player();
  enemy = new ArrayList<Enemy>();
}

void draw(){
  fill(0);
  background(255);
  player.display();
  rect(600,0,1,800);
  text("Score:"+score,700,100);
  score += 1000;
  text("Lives",700,350);
  if (player.getLives()== 3){
    triangle(620+15,430-15,680-15,430-15,650,370+15);
    triangle(670+15,430-15,730-15,430-15,700,370+15);
    triangle(720+15,430-15,780-15,430-15,750,370+15);    
  }
  fill(100);
  rect(300,bullety,5,10);  
  bullet_move();
  if (millis() - bullet_spawn == 500){
    bullet_spawn = millis();
  playerb.add(new P_Bullets(mouseX,mouseY-15,"FILL"));
  }
  for (int i = 0;i<playerb.size();i++){
    playerb.get(i).draw();
    if (playerb.get(i).gety() <= 0){
      playerb.remove(i);
    }
  }
  
  if (player.getLives()==0){
    end();
  }
  
  for (Enemy e: enemy){
     e.display();
   }
    
}

void bullet_move(){
   bullety+=10;
   if (bullety>790){
     bullety = 0;
      rect(300,bullety,5,10);
   }
 }

void setScore(int Score){
  score = Score;
}

void setBullet_level(int Bullet_level){
  bullet_level = Bullet_level;
}

void end(){
  {
    background(255);
    textAlign(CENTER);
    fill(255,0,0);
    textSize(50);
    text("GAME OVER", width/2, height/2);
    fill(0);
    textSize(20);
    text("PLAY AGAIN",width/2, height/2+100);
    noFill();
    rect(width/2-80,height/2+50, 160, 80); 
    if (overRect(width/2-80,height/2+50, 160, 80) && mousePressed){
       setup(); 
    }
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void useBomb(){
  if (overRect(0,0,600,800) && mousePressed){
   if (player.getBombs()>0){
      player.setBombs(player.getBombs()-1);
      
   } 
  }
}
