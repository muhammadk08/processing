// Rock, Paper, Scissors 
PImage rock, paper, scissor; // Variables for rock, paper, scissor
int win = 0, loss = 0, ties = 0; // Variables to keep track of wins, losses, and ties
int IMGselect, IMGselect2; // Variables to store user and computer selections
String round; // Variable to store the result of each round


void setup() {
  size(1000, 1000);
  rock=loadImage("r.png");//loading rock image
  paper=loadImage("p.png");//loading paper image
  scissor=loadImage("s.png");//loading scissor image
}
void draw() {
  background(127);
  fill(#360AFF);
  textSize(60);
  text("Rock paper scissors game", 180, 50);
  textSize(35);
  fill(#05FFCF);
  textSize(40);
  text("win :" + win, 100, 150); // Display win count
  text("loss :" + loss, 350, 150); // Display loss count
  text("ties :" + ties, 600, 150); // Display tie count
  text("You", 240, 730);
  text("Computer", 500, 730);
  image(paper, 100, 200, 200, 200);//paper image
  image(rock, 350, 200, 200, 200);//rock image
  image(scissor, 600, 200, 200, 200);//scissor image
    if (win>0 || loss>0 || ties>0){
        fill(#FFF80A);
  text("you " + round + " the round",300,800); // Display the result of the round
  }

  // Display user and computer Image selections
  if (IMGselect2==0){
    image(paper, 200, 550, 150, 150);
  }
  else if (IMGselect2==1){
    image(rock, 200, 550, 150, 150);
  }
    else if (IMGselect2==2){
    image(scissor, 200, 550, 150, 150);
  }
    if (IMGselect==0) {
      image(paper, 500, 550, 150, 150);
    } else if (IMGselect==1) {
      image(rock, 500, 550, 150, 150);
    } else if (IMGselect==2) {
      image(scissor, 500, 550, 150, 150);
    }  

  // stop game if the win or loss condition is met
  if (win==3){
            fill(#15FF0A);
    textSize(70);
     text("You WIN!!",330,900);
    noLoop();
  }
  if (loss==3){
            fill(#FF0516);
        textSize(70);
     text("You LOSE!!",330,900);
    noLoop();
  }
}
void mousePressed() {
// Check if user clicks on the paper image
  if (mouseX > 100 && mouseX < 300 && mouseY > 200 && mouseY < 400) {
    IMGselect2 = 0; // Set user selection to paper
    image(paper, 200, 550, 150, 150);
    IMGselect=int(random(0, 3));
    if (IMGselect==0) {
      ties++;
             round = "tied";
    } else if (IMGselect==1) {
      win++;
              round = "win";
    } else {
      loss++;
             round = "lost";
    }
  }
 // Check if user clicks on the rock image
  if (mouseX > 350 && mouseX < 550 && mouseY > 200 && mouseY < 400) {
    IMGselect2 = 1; // Set user selection to rock
    image(rock, 200, 550, 150, 150);
    IMGselect=int(random(0, 3));
        if (IMGselect==0) {
      loss++;
             round = "lost";
    } else if (IMGselect==1) {
      ties++;
             round = "tied";
    } else {
      win++;
              round = "win";
    }
  }
// Check if user clicks on the scissor image
  if (mouseX > 600 && mouseX < 800 && mouseY > 200 && mouseY < 400) {
    IMGselect2 = 2; // Set user selection to scissor
    image(scissor, 200, 550, 150, 150);
    IMGselect=int(random(0, 3));
            if (IMGselect==0) {
      win++;
              round = "win";
    } else if (IMGselect==1) {
      loss++;
             round = "lost";
    } else {
      ties++;
             round = "tied";
    }
  }
}
