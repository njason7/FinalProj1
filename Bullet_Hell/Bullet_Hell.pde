int score,bullet_level,lives;
int bullety;
P_Bullets[] playerb;
E_Bullets[] enemyb;

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
  bullety= 0;
  playerb = new P_Bullets[30];
}

void draw(){
  fill(0);
  background(255);
  rect(600,0,1,800);
  if (mouseX<580 && mouseX>20 && mouseY<780){
    triangle(mouseX-20,mouseY+20,mouseX+20,mouseY+20,mouseX,mouseY-20);
  }else if (mouseX>=580){
    if (mouseY<780){
      triangle(560,mouseY+20,600,mouseY+20,580,mouseY-20);
    }else{
      triangle(560,800,600,800,580,760);
    }
  }else if (mouseX<=20){
    triangle(0,mouseY+20,40,mouseY+20,20,mouseY-20);
  }else if (mouseY>=780){
    triangle(mouseX-20,800,mouseX+20,800,mouseX,760);
  }
  text("Score:"+score,700,100);
  score += 1000;
  text("Lives",700,350);
  if (lives == 3){
    triangle(620+15,430-15,680-15,430-15,650,370+15);
    triangle(670+15,430-15,730-15,430-15,700,370+15);
    triangle(720+15,430-15,780-15,430-15,750,370+15);    
  }
  fill(100);
  rect(300,bullety,5,10);  
  bullet_move();
  for (int i = 0;i<playerb.length;i++){
    playerb[i] = new P_Bullets(mouseX-50+i*5,mouseY-50-i*2,"FILL");
  }
  for (int i = 0;i<playerb.length;i++){
    playerb[i].draw();
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


