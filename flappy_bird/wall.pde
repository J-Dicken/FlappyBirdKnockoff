class wall{
  int x, y, y2, w, h;
  int xSpeed;
  int gap = 200; 
  
  PImage wall;
  
  boolean pClaimed = false;
  
  public wall(int j){
    w = 100;
    h = 780;
    x = j;
    xSpeed = 4;
    y = int(random(-680, -280));
    y2 = (y + h + gap);
    wall = loadImage("wall.png");
  }
  
  void update(){
    x = x - xSpeed;
  }
  
  void display(){
    noFill();
    noStroke();
    rect(x, y, w, h);
    image(wall, x, y);
    rect(x, y2, w, h);
    image(wall, x, y2);
  }
  
  boolean offScreen(){
    if (x <= 0 - w){
      return true;
    } else{
      return false;
    }
  }
  
}
