import javax.swing.JOptionPane;

int currentPlayer = 1;
int playerOneWins = 0;
int playerTwoWins = 0;
char[][] board = new char[3][3];

boolean winnerAnnounced = false;
boolean winningMove = false;
boolean tieAnnounced = false;
boolean gameEnded = false;
boolean drawingFinished = false;

void setup(){
  size(900, 900);
  background(250,239,211);
 
  strokeWeight(5);
  stroke(75,57,19);
 
  line(100, 350, 800, 350);
  line(100, 600, 800, 600);
      
  line(325, 170, 325, 800);
  line(575, 170, 575, 800);
    
  resetGame();  
  playerText();
  mousePressed();
}

void draw (){
    playerText();
    playerWins();
    
    if(gameEnded){
      delay(500);
      fill(29, 53, 84);
      rect(300, 390, 300, 100);
      fill(240, 233, 226);
      text("Play again..", 350, 450);
  }
}


void mousePressed(){
  textSize(200);
   
   int rowX = 0;
   int rowY = 0;
  
  if(gameEnded){
        if(gameEnded && mouseX > 300 && mouseX < 490 && mouseY > 390 && mouseY < 490){
    resetGame();
  }
    return;
  }
     
     
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
  
  if (rowY != 0 && rowX != 0 && board[rowY - 1][rowX - 1] == '\0') {

    float x = -65 + rowX * (110 + 120); 
    float y = 140 + rowY * (100 + 100); 

    if (currentPlayer == 1) {
      fill(145, 35, 35);
      text("X", x, y);
      board[rowY - 1][rowX - 1] = 'X';
      currentPlayer = 2;
    } else {
      fill(35, 76, 145);
      text("O", x, y);
        board[rowY - 1][rowX - 1] = 'O';
      currentPlayer = 1;
        }
     checkWinner();
  }
}

void checkWinner() {
  char winner = '\0';

  if ((board[0][0] == board[0][1] && board[0][1] == board[0][2] && board[0][0] != '\0') ||
      (board[1][0] == board[1][1] && board[1][1] == board[1][2] && board[1][0] != '\0') ||
      (board[2][0] == board[2][1] && board[2][1] == board[2][2] && board[2][0] != '\0') ||
      (board[0][0] == board[1][0] && board[1][0] == board[2][0] && board[0][0] != '\0') ||
      (board[0][1] == board[1][1] && board[1][1] == board[2][1] && board[0][1] != '\0') ||
      (board[0][2] == board[1][2] && board[1][2] == board[2][2] && board[0][2] != '\0') ||
      (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != '\0') ||
      (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != '\0')) {
    
        if(currentPlayer == 1){
          winner = 'X';
          playerTwoWins++;
        }else{
          winner = 'O';
          playerOneWins++;
        }
  }

  boolean isTie = true;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == '\0') {
        isTie = false;
        break;
      }
    }
    if (!isTie) {
      break;
    }
  }

  if (winner != '\0') {
    announceWinner(winner);
    winnerAnnounced = true;
  } else if (isTie) {
    announceTie();
    tieAnnounced = true;
  }
}

void announceWinner(char winner){
    if (winner == 'O') {
        JOptionPane.showMessageDialog(null, "Player 1 wins!");
    } else {
        JOptionPane.showMessageDialog(null, "Player 2 wins!");
    }
    gameEnded = true;
  }
void announceTie(){
    JOptionPane.showMessageDialog(null, "It's a tie!");
    gameEnded = true;
}

void resetGame() {
  if(gameEnded){
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        board[i][j] = '\0';
      }
    }

    winnerAnnounced = false;
    winningMove = false;
    tieAnnounced = false;
    gameEnded = false;
    drawingFinished = false;
    currentPlayer = 1;
    
  fill(250,239,211);
  rect(0,200,900,600);
 
  strokeWeight(5);
  stroke(75,57,19);
 
  line(100, 350, 800, 350);
  line(100, 600, 800, 600);
      
  line(325, 170, 325, 800);
  line(575, 170, 575, 800);
  }
}

void playerWins(){
  fill(250,239,211);
  rect(0, 50, 300, 50);
  
  fill(250,239,211);
  rect(600, 50, 600, 50);
  
  fill(75,57,19);
  textSize(30);
  text("Player 1 wins: " + playerOneWins, 50, 70);
  text("Player 2 wins: " + playerTwoWins, 660, 70);
}

void playerText(){
  noStroke(); 
  fill(250,239,211);
  rect(210, 20, 500, 100);
  fill(75,57,19);
  textSize(40);
  
  if(currentPlayer == 1) {
     text("Player 1's turn!", 330, 75);
     }else{
       text("Player 2's turn!", 330, 75);
  }
}
