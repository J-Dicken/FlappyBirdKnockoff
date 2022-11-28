class menu{
  PImage menu, gameOver;
  
  int r = 255;
  int g = 255;
  int b = 255;
  
  boolean fade = true;
  
  void init(){
    menu = loadImage("menu.png");
    gameOver = loadImage("gameOver.png");
  }
  
  void menu(){
    textSize(24);
    if (fade){
      if (r > 0){
        r--;
        if (g > 162){
          g--;
          if (b > 232){
            b--;
          }
        }
      } else { fade = false;}
    }
    if(!fade){
      if (r < 255){
        r++;
        if (g < 255){
          g++;
          if (b < 255){
            b++;
          }
        }
      } else{ fade = true;}
    }
    
    
    fill(r, g, b);
    image(menu, 0, 0); 
    textAlign(CENTER);
    text("Press any key to continue",400,710);
  }
  
  void gameOver(int x, int y){
    image(gameOver, 0, 0);
    fill(255, 242, 0);
    textSize(26);
    text(x, 545, 440);
    text(y, 545, 485);
    text("Press any key to return to menu",360,710);
  }
}
