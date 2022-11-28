class background{
  
  PImage clouds1, mtn1, hills1;
  float cx, mx, hx = 0;

  void init(){
      clouds1 = loadImage("clouds-transparent.png");
      mtn1 = loadImage("mountains.png");
      hills1 = loadImage("hills.png");
  }
  
  void display(){
    image(clouds1, cx, 0);
    image(clouds1, cx + 800, 0);
    cx -= 0.5;
    if (cx <= -800){
      cx = 0;
    }
  
    image(mtn1, mx, 400);
    image(mtn1, mx + 800, 400);
    mx -= 1;
    if (mx <= -800){
      mx = 0;
    }
  
    image(hills1, hx, 600);
    image(hills1, hx + 800, 600);
    hx -= 2;
    if (hx <= -800){
      hx = 0;
    }
  }
}
