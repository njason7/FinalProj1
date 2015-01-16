int score,bullet_level,lives,bullet_time;
int max;
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
  bullet_time = second();
  playerb = new ArrayList<P_Bullets>();
  player = new Player();
  enemy = new ArrayList<Enemy>();
  enemyb = new ArrayList<E_Bullets>();
  bullet_level = 1;
  max = 1;
}

void draw(){
  fill(0);
  background(255);
  if (player.getLives() > 0){
  player.display();
  rect(600,0,1,800);
  text("Score:"+score,700,100);
  text("Lives",700,350);
  player.displayLives();
  fill(100); 
  bullet_time = millis();
  if (score >= 30000){
    bullet_level = 7;
  }else if (score >= 15000){
    bullet_level = 5;
  }else if (score >= 5000){
    bullet_level = 3;
  }else{
    bullet_level = 1;
  }
  if (bullet_level == 3 || bullet_level == 5 || bullet_level == 7){
    max = bullet_level;
  }
  if (bullet_time%500 < 35){
    if(mouseX<600){
      for (int i = 0;i<max;i++){
      playerb.add(new P_Bullets(mouseX,mouseY-15,"Spread",i));
      }
    }else{
      for (int i = 0;i<max;i++){
      playerb.add(new P_Bullets(585,mouseY-15,"Spread",i));
    }
    }
  }
  for (int i = 0;i<playerb.size();i++){
    playerb.get(i).draw();
    if (playerb.get(i).gety() <= 0 || playerb.get(i).getx() >= 600){
      playerb.remove(i);
    }
  }
   for(E_Bullets eb: enemyb){
      eb.display(); 
   }
   
   for(Enemy e: enemy){
      e.display(); 
   }
  
// removes dead enemies
    ArrayList<Enemy> removeEnemies = new ArrayList<Enemy>();
    for (Enemy e : enemy)
    {
      if (e.getHealth()<=0){
        removeEnemies.add(e);
        setScore(getScore()+100);
      }
    }
    enemy.removeAll(removeEnemies);

// removes enemies out of bounds
    ArrayList<Enemy> removeEnemies1 = new ArrayList<Enemy>();
    for (Enemy e : enemy)
    {
      if ( ( (e.getXCor() > 600) || (e.getXCor() < 0) ) ||
        ( (e.getYCor() > height) || (e.getYCor() < 0) )){
        removeEnemies.add(e);
        }
    }
    enemy.removeAll(removeEnemies);

// removes player bullets out of bounds
    ArrayList<P_Bullets> removePlayerBullets = new ArrayList<P_Bullets>();
    for (P_Bullets pb: playerb)
    {
      if ( ( (pb.getx() > 600) || (pb.getx() < 0) ) ||
        ( (pb.gety() > height) || (pb.gety() < 0) )) {
          
        removePlayerBullets.add(pb);
        }
    }
    playerb.removeAll(removePlayerBullets);

// removes enemy bullets out of bounds
    ArrayList<E_Bullets> removeEnemyBullets = new ArrayList<E_Bullets>();
    for (E_Bullets eb: enemyb)
    {
      if ( ( (eb.getXCor() > 600) || (eb.getXCor() < 0) ) ||
        ( (eb.getYCor() > height) || (eb.getYCor() < 0) )) {
          
        removeEnemyBullets.add(eb);
        }
    }
    enemyb.removeAll(removeEnemyBullets);

   for(E_Bullets eb: enemyb){
     eb.setXCor(eb.getXCor()+eb.getXMove());
     eb.setYCor(eb.getYCor()+eb.getYMove()); 
   }
  
  // Enemy gets hit by player bullets
  ArrayList<P_Bullets> removePlayerBullets2 = new ArrayList<P_Bullets>();
   for (Enemy e: enemy){
     for (P_Bullets pb : playerb){
        float playerBulletCenterX = pb.getx() + ( 5 / 2 );
        float playerBulletCenterY = pb.gety() + ( 5 / 2 );
       if ( ( ( playerBulletCenterX >= e.getXCor() ) && ( playerBulletCenterX <= ( e.getXCor() + e.getWidth() ) ) ) &&
          ( ( playerBulletCenterY >= e.getYCor() ) && ( playerBulletCenterY <= ( e.getYCor() + e.getHeight() ) ) )) {
            
            e.setHealth(e.getHealth()-player.getDamage());   
            removePlayerBullets2.add(pb);
          }
    }
    playerb.removeAll(removePlayerBullets2);
   }
  }else if (player.getLives()<=0){
    end();
  }  

       
 /// When player is hit by enemy bullets
 
 for (E_Bullets eb : enemyb){
    int enemyBulletCenterX = eb.getXCor() + (eb.getWidth()/2);
    int enemyBulletCenterY = eb.getYCor() + (eb.getHeight()/2);
   
     if ( ( ( enemyBulletCenterX >= player.getXCor() ) && ( enemyBulletCenterX <= ( player.getXCor() + player.getWidth() ) ) ) &&
        ( ( enemyBulletCenterY >= player.getYCor() ) && ( enemyBulletCenterY <= ( player.getYCor() + player.getHeight() ) ) ) ){
           player.setLives(player.getLives()-1);
        } 
 }
 
// When player is hit by enemies
  for (Enemy e : enemy){
    int enemyCenterX = e.getXCor() + (e.getWidth()/2);
    int enemyCenterY = e.getYCor() + (e.getHeight()/2);
   
     if ( ( ( enemyCenterX >= mouseX-15 ) && ( enemyCenterX <= ( mouseX + 15 ) ) ) &&
        ( ( enemyCenterY >= mouseY-15 ) && ( enemyCenterY <= ( mouseY + 15 ) ) ) ){
          e.setHealth(0);
          player.setLives(player.getLives()-1);
        } 
 }


  enemy.add(new Enemy());
}

int getScore(){
   return score; 
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

void mousePressed(){
  useBomb();
}

void useBomb(){
  if (player.getBombs()>0){
      player.setBombs(player.getBombs()-1);
      for (Enemy e : enemy){
        e.setHealth(0);
      } 
   } 
}
