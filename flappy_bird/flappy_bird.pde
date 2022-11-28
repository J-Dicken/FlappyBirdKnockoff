//TODO
//Limit wall random so no extremes near the edge -- Done
//Death animation
//Death screen displays high score -- Done
//Main menu -- Done
//Add sprites -- Done
//Add background -- Done
//Make it run smoother


void setup(){
  size(800, 800, P2D);
  m.init();
  frameRate(60);
}

int gameState = 0;
int wallGap = 400; //spacing for the walls

ArrayList<wall> w = new ArrayList<wall>();
flapBird b = new flapBird();
background bg = new background();
menu m = new menu();

void draw(){
  //Menu Logic
  //--------------------------------------------------------------------------------
  switch(gameState){
    case 0:
      m.menu();
      break;
    case 1:
      background(#1FF6FF);
      bg.display();
      //Wall logic
      //------------------------------------------------------------------------------
      //check for offscreen
      for(int i = 0; i < w.size(); i++){
        if(w.get(i).offScreen()){
          w.remove(i);
          w.add(new wall(w.get(w.size()-1).x + wallGap));
          break;
        }
      }//end of offscreen check
      
      //Update and display wall pieces
      for (wall e : w){
        e.update();
        e.display();
      }//End of update and display
      //------------------------------------------------------------------------------
      //End of wall logic
      
      //Bird logic
      //------------------------------------------------------------------------------
      b.update();
      b.display();
      //------------------------------------------------------------------------------
      //End of bird logic
      
      //Collision Logic
      //------------------------------------------------------------------------------
      //Check the birds collision accross the wall array
      for (int j = 0; j < w.size(); j++){
        //Collision check to award points
        if (b.x > w.get(j).x + w.get(j).w){
          if ((b.y > w.get(j).y + w.get(j).h) && (b.y < w.get(j).y2) && (!w.get(j).pClaimed)){
            b.points++;
            w.get(j).pClaimed = true;
          } else{
            w.get(j).pClaimed = true; //If not do this, points are given regardless
          }
        }//End of points collision check
        
        //Collision check for dead
        if ((b.x + b.s >= w.get(j).x) && (b.x <= w.get(j).x + w.get(j).w)){
          if ((b.y + b.s > w.get(j).y2) || (b.y < w.get(j).y + w.get(j).h)){
            b.dead = true;
            gameState = 2;
          }
        }//End of dead check
        
        //Off screen check - also equals dead
        if ((b.y > height) || (b.y < 0)){
          b.dead = true;
          gameState = 2;
        }
      }//End of bird on wall collision check
      //------------------------------------------------------------------------------
      //End of collision logic
      break;
    case 2:
      if (b.points > b.highscore){
        b.highscore = b.points;
      }
      m.gameOver(b.highscore, b.points);
      for (int e = 0; e < w.size(); e++){
        w.remove(e);
      }
      break;
  }//End of switch
}//End of draw

//Function to initialise the wall array, updated one at a time once this has ran
//---------------------------------------------------------------------------------
void populateWall(){
  if (w.size() < 4){
    for (int i = 1; i < 4; i++){
      int x = w.get(i-1).x;
      w.add(new wall(x + wallGap));
    }
  }
}//End of populate wall method 
//---------------------------------------------------------------------------------

//Key released function to handle game input
//---------------------------------------------------------------------------------
void keyReleased(){
  if (gameState == 0){
    w.add(new wall(820));
    populateWall();
    b.init();
    bg.init();
    m.init();
    gameState = 1;
   
  }
  if (gameState == 1){
    b.ySpeed = -5;
  }
  if (gameState == 2){
    gameState = 0;
  }
}//End of key released


//---------------------------------------------------------------------------------
