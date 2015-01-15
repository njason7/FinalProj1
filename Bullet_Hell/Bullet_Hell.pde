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
  for (int i = 0;i<1;i++){
    enemy.add(new Enemy(1,300,50,0,2,10,10));
  }
}

void draw(){
  fill(0);
  background(255);
  player.display();
  rect(600,0,1,800);
  score = score + 100;
  text("Score:"+score,700,100);
  text("Lives",700,350);
  if (player.getLives()== 3){
    triangle(620+15,430-15,680-15,430-15,650,370+15);
    triangle(670+15,430-15,730-15,430-15,700,370+15);
    triangle(720+15,430-15,780-15,430-15,750,370+15);    
  }
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
  if (player.getLives()==0){
    end();
  } 
   for(E_Bullets eb: enemyb){
      eb.display(); 
   }
   
   for(E_Bullets eb: enemyb){
     eb.setXCor(eb.getXCor()+eb.getXMove());
     eb.setYCor(eb.getYCor()+eb.getYMove()); 
   }
  
   for (Enemy e: enemy){
     e.display();
     for (P_Bullets pb : playerb){
     
        float playerBulletCenterX = pb.getx() + ( 5 / 2 );
        float playerBulletCenterY = pb.gety() + ( 5 / 2 );
       if ( ( ( playerBulletCenterX >= e.getXCor() ) && ( playerBulletCenterX <= ( e.getXCor() + e.getWidth() ) ) ) &&
          ( ( playerBulletCenterY >= e.getYCor() ) && ( playerBulletCenterY <= ( e.getYCor() + e.getHeight() ) ) )) {
            
            e.setHealth(e.getHealth()-player.getDamage());                    
          }
    }
    /*if (e.getHealth()<=0){
       setScore(getScore()+1000);
       enemy.remove(e);
    }
     ArrayList<Enemy> removedEnemies = new ArrayList<Enemy>();
 for (Enemy e: enemy){
    if (e.getHealth()<=0){
       setScore(getScore()+1000);
       removedEnemies.add(e);
    } 
    enemy.removeAll(removedEnemies);
 }
    */
 }
  
  
 
 // When player is hit by enemy bullets
 
 for (E_Bullets eb : enemyb){
    int enemyBulletCenterX = eb.getXCor() + (eb.getWidth()/2);
    int enemyBulletCenterY = eb.getYCor() + (eb.getHeight()/2);
   
     if ( ( ( enemyBulletCenterX >= player.getXCor() ) && ( enemyBulletCenterX <= ( player.getXCor() + player.getWidth() ) ) ) &&
        ( ( enemyBulletCenterY >= player.getYCor() ) && ( enemyBulletCenterY <= ( player.getYCor() + player.getHeight() ) ) ) ){
           player.setLives(player.getLives()-1);
        } 
 }
 
// When player is hit by enemies
/*for (Enemy e : enemy){
    int enemyBulletCenterX = e.getXCor() + (e.getWidth()/2);
    int enemyBulletCenterY = e.getYCor() + (e.getHeight()/2);
   
     if ( ( ( enemyBulletCenterX >= player.getXCor() ) && ( enemyBulletCenterX <= ( player.getXCor() + player.getWidth() ) ) ) &&
        ( ( enemyBulletCenterY >= player.getYCor() ) && ( enemyBulletCenterY <= ( player.getYCor() + player.getHeight() ) ) ) ){
           player.setLives(player.getLives()-1);           
        } 
 }
  */
  
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

void useBomb(){
  if (overRect(0,0,600,800) && mousePressed){
   if (player.getBombs()>0){
      player.setBombs(player.getBombs()-1);
      enemy.clear();
      playerb.clear();     
   } 
  }
}
