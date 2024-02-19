int currentPlayer = 1;


void setup(){
  size(900, 900);
  background(250,239,211);
 
 strokeWeight(5);
 stroke(75,57,19);
 
  line(100, 350, 800, 350);
  line(100, 600, 800, 600);
      
  line(325, 170, 325, 800);
  line(575, 170, 575, 800);
    

  playerText();

}

void draw (){

 }



void playerText(){
  noStroke(); 
  fill(250,239,211);
   rect(210, 20, 500, 100);
    fill(75,57,19);
     textSize(40);
    if(currentPlayer == 1) {
        text("Player 1's turn!", 330, 75);
        
     }
     else{
       text("Player 2's turn!", 330, 75);
      
     }
}
  
void mousePressed(){
   textSize(200);
   
   int rowX = 0;
   int rowY = 0;
   
  if(mouseX > 100 && mouseX < 325){ 
    rowX = 1;
  }else if
  (mouseX > 300 && mouseX < 550){
    rowX = 2;
  }else if
  (mouseX > 575 && mouseX < 750){
    rowX = 3;
  }
  
  if(mouseY > 170 && mouseY < 300){
    rowY = 1;
  }else if
  (mouseY > 400 && mouseY < 510){
    rowY = 2;
  }else if
  (mouseY > 600 && mouseY < 740){
    rowY = 3;
  }
  
  if (rowY != 0 && rowX != 0) {

    float x = -65 + rowX * (110 + 120); 
    float y = 140 + rowY * (100 + 100); 


    if (currentPlayer == 1) {
      fill(145, 35, 35);
      text("X", x, y);
      currentPlayer = 2;
    } else {
      fill(35, 76, 145);
      text("O", x, y);
      currentPlayer = 1;
    }
    playerText();
  }
}
