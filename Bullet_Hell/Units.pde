public class Unit
{
  public int health;
  public int xcor;
  public int ycor;
  public int xmove;
  public int ymove;
  public int width;
  public int height;

  public Unit() {}
  public Unit(int Health, int Xcor, int Ycor, int Xmove, int Ymove, int w, int h)
  {
    health = Health;
    xcor = Xcor;
    ycor = Ycor;
    xmove = Xmove;
    ymove = Ymove;
    width = w;
    height = h;    
  }  
  
  public int getHealth() { 
    return health; 
  }
  public int getXCor() { 
    return xcor; 
  }
  public int getYCor() { 
    return ycor;
  }
  public int getXMove() { 
    return xmove; 
  }
  public int getYMove() { 
    return ymove; 
  }
  public int getWidth() {
    return width; 
  }
  public int getHeight() { 
    return height;
  }

  
  public void setHealth(int health) { 
    this.health = health; 
  }
  public void setXCor(int xcor) { 
    this.xcor = xcor; 
  }
  public void setYCor(int ycor) { 
    this.ycor = ycor;
  }
  public void setXMove(int xmove) {
    this.xmove = xmove; 
  }
  public void setYMove(int ymove) { 
   this.ymove = ymove; 
  }
  public void setWidth(int w) { 
   width = w;
  }
  public void setHeight(int h) { 
   height = h; 
  }

}

