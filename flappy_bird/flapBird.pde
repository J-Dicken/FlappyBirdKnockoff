class flapBird{
  
  float ySpeed, rot;  
  float grav = 0.2;
  
  int x, y, s;
  int points;
  int highscore = 0;
  
  PShape bird;
  PImage brd; 
  
  boolean dead;
  
  void init(){
    dead = false;
    points = 0;
    x = 200;
    y = height/2;
    s = 30;
    ySpeed = 1;
    rot = 0;
    brd = loadImage("bird.png");
  }
  
  void display(){
    pushMatrix();
    noStroke();
    noFill();
    int x1 = x - x - s/2;
    int y1 = y - y - s/2;
    translate(x + s/2, y + s/2);
    rotate(radians(rot));  
    bird = createShape(RECT, x1, y1, s, s);
    image(brd, x1, y1);
    textAlign(CENTER);
    textSize(14);
    fill(#000000);
    text(points, x1 + s/2, y1 + s + 15);
    popMatrix();
  }
  
  void update(){
    if (!dead){
      ySpeed = ySpeed + grav;
      y += ySpeed;
      rot = ySpeed * 5;
    }
  }
}
