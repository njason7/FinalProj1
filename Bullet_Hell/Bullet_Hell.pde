void setup(){
  background(255);
  size(800,800);
  rect(600,0,1,800);
}

void draw(){
  background(255);
  rect(600,0,1,800);
  if (mouseX<580 && mouseX>20 && mouseY<780){
    triangle(mouseX-20,mouseY+20,mouseX+20,mouseY+20,mouseX,mouseY-20);
  }
  if (mouseX>=580){
    triangle(560,mouseY+20,600,mouseY+20,580,mouseY-20);
  }
  if (mouseX<=20){
    triangle(0,mouseY+20,40,mouseY+20,20,mouseY-20);
  }
  if (mouseY>=780){
    triangle(mouseX-20,800,mouseX+20,800,mouseX,760);
  }
}

