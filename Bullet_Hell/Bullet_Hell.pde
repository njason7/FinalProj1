import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

AudioPlayer bgm;
Minim minim;

int score,bullet_level,lives,bullet_time;
int max;
ArrayList<Enemy> enemy;
ArrayList<P_Bullets> playerb;
ArrayList<E_Bullets> enemyb;
ArrayList<Upgrade> upgrade;
Player player;
boolean level1, level2, level3, level4, BossLevel;
int startTime, ticks;
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
  upgrade = new ArrayList<Upgrade>();
  bullet_level = 1;
  max = 1;
  startTime = millis()/1000;
  ticks = startTime;
  level1 = true;
  level2 = false;
  level3 = false;
  level4 = false;
  BossLevel = false;
  minim = new Minim(this);
  bgm = minim.loadFile("Guiles_theme.mp3");
  bgm.play();
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
  text("Bombs",700,500);
  player.displayBombs();
  fill(100); 
  bullet_time = millis();
  if (bullet_level >= 50){
    max = 7;
  }else if (bullet_level >= 25){
    max = 5;
  }else if (bullet_level >= 10){
    max = 3;
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
  
// display enemy bullets and enemies and upgrades
   for(E_Bullets eb: enemyb){
      eb.display(); 
   }   
   for(Enemy e: enemy){
      e.display(); 
   }
   for(Upgrade up: upgrade){
     up.display();
   }
   
// move enemy bullets  
  for(E_Bullets eb: enemyb){
     eb.setXCor(eb.getXCor()+(eb.getXMove()));
     eb.setYCor(eb.getYCor()+(eb.getYMove())); 
   }
   
// removes dead enemies and possibly drop upgrades
    ArrayList<Enemy> removeEnemies = new ArrayList<Enemy>();
    for (Enemy e : enemy){
      if (e.getHealth()<=0){
        removeEnemies.add(e);
        setScore(getScore()+100);
      }
            if (e.getHealth()<=0){
        removeEnemies.add(e);
        setScore(getScore()+100);
      }
    }
    for (Enemy e : removeEnemies){
      if (random(10) < 1){
        upgrade.add(new Upgrade(1,e.getXCor(),e.getYCor(),0,3,7,5));
      }
    enemy.removeAll(removeEnemies);
    }

// removes enemies out of bounds
    ArrayList<Enemy> removeEnemies1 = new ArrayList<Enemy>();
    for (Enemy e : enemy){
      if ( ( (e.getXCor() > (600-e.getWidth())) || (e.getXCor() < 0) ) ||
        ( (e.getYCor() > height) || (e.getYCor() < 0) )){
        removeEnemies.add(e);
        }
    }
    enemy.removeAll(removeEnemies);

// removes player bullets out of bounds
    ArrayList<P_Bullets> removePlayerBullets = new ArrayList<P_Bullets>();
    for (P_Bullets pb: playerb){
      if ( ( (pb.getx() > 600) || (pb.getx() < 0) ) ||
        ( (pb.gety() > height) || (pb.gety() < 0) )) {
          
        removePlayerBullets.add(pb);
        }
    }
    playerb.removeAll(removePlayerBullets);

// removes enemy bullets out of bounds
    ArrayList<E_Bullets> removeEnemyBullets = new ArrayList<E_Bullets>();
    for (E_Bullets eb: enemyb){
      if ( ( (eb.getXCor() > 600) || (eb.getXCor() < 0) ) ||
        ( (eb.getYCor() > height) || (eb.getYCor() < 0) )) {
          
        removeEnemyBullets.add(eb);
        }
    }
    enemyb.removeAll(removeEnemyBullets);

// remove enemy bullets that hit
ArrayList<E_Bullets> removeEnemyBullets2 = new ArrayList<E_Bullets>();
    for (E_Bullets eb : enemyb){
      if (eb.getHealth()<=0){
        removeEnemyBullets2.add(eb);
      }
    }
    enemyb.removeAll(removeEnemyBullets2);
  
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
   
 /// player is hit by enemy bullets
  for (E_Bullets eb: enemyb){
      int enemyBulletCenterX = eb.getXCor() + ( eb.getWidth() / 2 );
      int enemyBulletCenterY = eb.getYCor() + ( eb.getWidth() / 2 );

      if ( ( ( enemyBulletCenterX >= mouseX-15 ) && ( enemyBulletCenterX <= ( mouseX+15 ) ) ) &&
        ( ( enemyBulletCenterY >= mouseY-15 ) && ( enemyBulletCenterY <= ( mouseY +15 ) ) ) ){
          
          player.setLives(player.getLives()-1);
          eb.setHealth(0);
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

// When player gets upgrade
  for (Upgrade up : upgrade){
      int upCenterX = up.getXCor() + ( up.getWidth() / 2 );
      int upCenterY = up.getYCor() + ( up.getWidth() / 2 );

      if ( ( ( upCenterX >= mouseX-15 ) && ( upCenterX <= ( mouseX+15 ) ) ) &&
        ( ( upCenterY >= mouseY-15 ) && ( upCenterY <= ( mouseY +15 ) ) ) ){
          
          up.setHealth(0);
        }
  }
//Remove upgrades when taken or out of bounds        
ArrayList<Upgrade> removeUpgrade = new ArrayList<Upgrade>();
    for (Upgrade up: upgrade){
      if ( ( (up.getXCor() > 600) || (up.getXCor() < 0) ) ||
        ( (up.getYCor() > height) || (up.getYCor() < 0) )) {   
        removeUpgrade.add(up);
        }
      if (up.getHealth() == 0){
        removeUpgrade.add(up);
        bullet_level++;
    }
    }
    upgrade.removeAll(removeUpgrade);
  
  }else if (player.getLives()<=0){
    end();
  }
  
  level1 = true;
  level2 = false;
  level3 = false;
  level4 = false;
  BossLevel = false;
  

  if (level1){
     level1(); 
  }
  if (level2){
     level2(); 
  }
  if (level3){
     level3(); 
  }
  if (level4){
     level4(); 
  }
  if (BossLevel){
    BossLevel(); 
  }


}

void timeIncrease(){
   ticks = (millis()/1000) - startTime; 
}
  
// 30 seconds of duds, very little chance of shooters or tanks
void level1(){
    Enemy e = new Enemy();
    timeIncrease();
    if (ticks < 3){
       fill(0,0,255);
       text("LEVEL 1", width/2-100, height/2); 
    }   
    if (ticks<30){
      if (millis() % 500 < 100){
         enemy.add(e); 
      }    
      if (millis() % 500 < 15){
         enemy.add(e.new shooter()); 
      }  
      if ((millis() % 500 >15) && (millis()%500 <17)){
         enemy.add(e.new tank()); 
      }
      if ((millis() % 500 >17) && (millis()%500 <19)){
         enemy.add(e.new shooter2()); 
      } 
             
    } else {
     level1 = false;
     level2 = true;
   } 
}


void level2(){
    Enemy e = new Enemy();
    timeIncrease();
    if (ticks>0 && ticks<35){
       fill(0,0,255);
       text("LEVEL 2", width/2-100, height/2);      
    }
    if (ticks>35 && ticks<90){
      if (millis() % 500 < 120){
         enemy.add(e); 
      }    
      if (millis() % 500 < 20){
         enemy.add(e.new shooter()); 
      }  
      if ((millis() % 500 >20) && (millis()%500 <22)){
         enemy.add(e.new tank()); 
      }
      if ((millis() % 500 >22) && (millis()%500 <24)){
         enemy.add(e.new shooter2()); 
      } 
      if ((millis() % 500 >24) && (millis()%500 <26)){
         enemy.add(e.new shooter3()); 
      }       
    } else {
     level2 = false;
     level3 = true;
   }    
}

void level3(){
    Enemy e = new Enemy();
    timeIncrease();
    if (ticks>90 && ticks<94){
       fill(0,0,255);
       text("LEVEL 3", width/2-100, height/2);      
    }    
    if (ticks>94 && ticks < 155){
      if (millis() % 500 < 150){
         enemy.add(e); 
      }    
      if (millis() % 500 < 25){
         enemy.add(e.new shooter()); 
      }  
      if ((millis() % 500 >25) && (millis()%500 <28)){
         enemy.add(e.new tank()); 
      }
      if ((millis() % 500 >28) && (millis()%500 <31)){
         enemy.add(e.new shooter2()); 
      } 
      if ((millis() % 500 >31) && (millis()%500 <34)){
         enemy.add(e.new shooter3()); 
      }        
    } else {
     level3 = false;
     level4 = true;
   }   
}

void level4(){
    Enemy e = new Enemy();
    timeIncrease();
    if (ticks>155 && ticks<159){
       fill(0,0,255);
       text("LEVEL 4", width/2-100, height/2);      
    }
    if (ticks>159 && ticks<210 ){
      if (millis() % 500 < 170){
         enemy.add(e); 
      }    
      if (millis() % 500 < 30){
         enemy.add(e.new shooter()); 
      }  
      if ((millis() % 500 >30) && (millis()%500 <34)){
         enemy.add(e.new tank()); 
      }
      if ((millis() % 500 >34) && (millis()%500 <38)){
         enemy.add(e.new shooter2()); 
      } 
      if ((millis() % 500 >38) && (millis()%500 <44)){
         enemy.add(e.new shooter3()); 
      } 
      
    } else {
     level4 = false;
     BossLevel = true;
   }    
}

void BossLevel(){
    Enemy e = new Enemy();
    timeIncrease();
    if (ticks>210 && ticks<214){
       fill(0,0,255);
       text("FINAL LEVEL", width/2-100, height/2);      
    }
    if (ticks == 275){
       enemy.add(e.new Boss()); 
    }
    if (ticks>214 && ticks<270){
      if (millis() % 500 < 200){
         enemy.add(e); 
      }    
      if (millis() % 500 < 35){
         enemy.add(e.new shooter()); 
      }  
      if ((millis() % 500 >35) && (millis()%500 <40)){
         enemy.add(e.new tank()); 
      }
      if ((millis() % 500 >40) && (millis()%500 <45)){
         enemy.add(e.new shooter2()); 
      } 
      if ((millis() % 500 >45) && (millis()%500 <50)){
         enemy.add(e.new shooter3()); 
      } 
    } else {
     BossLevel = false;
   }   
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
    minim.stop();
    background(255);
    textAlign(CENTER);
    fill(0,255,0);
    textSize(100);
    text("SCORE:" + getScore(),width/2,height/2-150);
    fill(255,0,0);
    textSize(100);
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
        e.setHealth(e.getHealth()-player.getDamage());
      } 
      for (E_Bullets eb: enemyb){
        eb.setHealth(0); 
      }
   } 
}
