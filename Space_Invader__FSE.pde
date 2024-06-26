// Declaration of variables
int gameMode, theme;
PImage classic, Snow, sunny, logo, ship1, ship2, ship3, bullet1, bullet2, bullet3, Enemy1a, Enemy1b, heart, gameover, youwin, BossShip, bossbullet, heart2;
IntList enemyAlive = new IntList();
PImage[] enemyImages1 = new PImage[2];
PImage[] enemyImages2 = new PImage[2];
PImage[] enemyImages3 = new PImage[2];
IntList enemyType = new IntList();
IntList ebx = new IntList();
IntList eby = new IntList();
int bSpeed, EbSpeed;
IntList bx = new IntList();
IntList by = new IntList();
IntList ex=new IntList();
IntList ey=new IntList();
int rapid=15; // Controls the rate of player's bullet firing
int px, py; // Player position variables
boolean moveLeft, moveRight; // variable to track player movement
boolean EmovingRight = true; // variable for enemy movement direction
float enemyShootingProbability=1; // Probability of enemy shooting
float BossShootingProbability=1; // Probability of boss shooting
float frame=0; // Frame for animation
PImage[] barrier = new PImage[2]; // Images for barriers
int[][] barriers = { // Positions of barriers
  {50, 500, 0},
  {250, 500, 0},
  {450, 500, 0},
  {650, 500, 0},
  {850, 500, 0},
  {1050, 500, 0}};
int playerLives = 3; // Number of player lives
int defeatedEnemiesCount = 0; // Count of defeated enemies
int[] bossX = new int[3]; // X positions of bosses
int[] bossY = new int[3]; // Y positions of bosses
boolean bossesMovingRight = true; // variable for boss movement direction
int bossSpeed = 5; // Speed of boss movement
IntList bossBulletX = new IntList(); // X positions of boss bullets
IntList bossBulletY = new IntList(); // Y positions of boss bullets
int bossBulletSpeed = 10; // Speed of boss bullets
int bosshealth=1200; // Health of the boss
void setup() {
  size(1200, 700); // Set the size of the window
  gameMode=0; // Set the initial game mode to main menu
  theme=0; // Set the initial theme to classic
  bSpeed = -50; // Set bullet speed
  EbSpeed = 20; // Set enemy bullet speed
  // Load images for different game elements
  classic = loadImage("Classic.png");
  Snow = loadImage("Snow.png");
  sunny = loadImage("sunny.png");
  logo = loadImage("Space_invader_logo.png");
  ship1 = loadImage("Ship1.png");
  ship2 = loadImage("Ship3.png");
  ship3 = loadImage("Ship2.png");
  bullet1 = loadImage("bullet1.png");
  bullet2 = loadImage("bullet2.png");
  bullet3 = loadImage("bullet3.png");
  enemyImages1[0] = loadImage("Enemy1a.png");
  enemyImages1[1] = loadImage("Enemy1b.png");
  enemyImages2[0] = loadImage("Enemy2a.png");
  enemyImages2[1] = loadImage("Enemy2b.png");
  enemyImages3[0] = loadImage("Enemy3a.png");
  enemyImages3[1] = loadImage("Enemy3b.png");
  barrier[0] = loadImage("barrier.png");
  barrier[1] = loadImage("barrier2.png");
  heart = loadImage("lives.png");
  gameover= loadImage("gameover.png");
  youwin= loadImage("youwin.png");
  BossShip= loadImage("BossShip.png");
  bossbullet= loadImage("bossbullet.png");
  heart2=loadImage("health.png");
  moveLeft = false;
  moveRight = false;
  px = width / 2;
  py = 620;
  // Initialize enemy positions and types and check if alive
  for (int i = 2; i < 11; i++) {
    for (int j = 0; j < 6; j++) {
      ex.append(i * 100);
      ey.append(70 * j);
      enemyAlive.append(1);
      if (j < 2) {
        enemyType.append(0);
      } else if (j < 4) {
        enemyType.append(1);
      } else {
        enemyType.append(2);
      }
    }
  }
  // Initialize boss positions
  for (int i = 0; i < 3; i++) {
    bossX[i] = 100 + i * 300;
    bossY[i] = 100;
  }
}
void draw() {
  // Render the game based on the current theme
  if (theme==0) {
    image(classic, 0, 0, width, height);
  } else if (theme==1) {
    image(Snow, 0, 0, width, height);
  } else if (theme==2) {
    image(sunny, 0, 0, width, height);
  }
  // Determine the game mode and call the appropriate function
  if (gameMode==0) {
    mainMenu();
  } else if (gameMode==1) {
    playGame();
  } else if (gameMode==2) {
    showInstructions();
  } else if (gameMode==3) {
    themes();
  } else if (gameMode==4) {
    gameOver();
  } else if (gameMode==5) {
    round1win();
  } else if (gameMode==6) {
    Finalround();
  } else if (gameMode==7) {
    Finalroundwin();
  }
  println(enemyShootingProbability);
}
// Main menu screen
void mainMenu() {
  int x, y;
  x=450;
  y=420;
  // Draw logo and menu options
  image(logo, 335, height/8, 500, 300);
  fill(255, 255, 255);
  textSize(30);
  fill(0);
  rect(x, y, 250, 60, 28);
  rect(x, y+100, 250, 60, 28);
  rect(x, y+200, 250, 60, 28);
  fill(19, 157, 8);
  text("Play", x+100, y+40);
  text("Instructions", x+55, y+135);
  text("Themes", x+75, y+240);
  // Check for mouse interactions with menu options
  if (mouseIn(x, y, 250, 60)) {
    strokeWeight(10);
    fill(19, 157, 8);
    rect(x, y, 250, 60, 28);
    fill(0);
    text("Play", x+100, y+40);
    if (mousePressed) {
      gameMode=1;
    }
  }
  if (mouseIn(x, y+100, 250, 60)) {
    fill(19, 157, 8);
    rect(x, y+100, 250, 60, 28);
    fill(0);
    text("Instructions", x+55, y+135);
    if (mousePressed) {
      gameMode=2;
    }
  }
  if (mouseIn(x, y+200, 250, 60)) {
    fill(19, 157, 8);
    rect(x, y+200, 250, 60, 28);
    fill(0);
    text("Themes", x+75, y+240);
    if (mousePressed) {
      gameMode=3;
    }
  }
}
// Function to draw player lives
void drawHearts() {
  for (int i = 0; i < playerLives; i++) {
    image(heart, 50 + i * 50, height - 50, 40, 40);
  }
}
// Function to play the game
void playGame() {
  movePlayer();
  moveBullets();
  drawBullets();
  drawPlayer();
  drawEnemies();
  checkCollisions();
  moveEnemies();
  enemyShoot();
  moveEnemyBullets();
  drawEnemyBullets();
  checkPlayerHit();
  drawBarriers();
  checkBarrierCollisions();
  drawHearts();
  if (enemyShootingProbability < 100) {
    enemyShootingProbability+=0.02;
  }
}
// Function to check if player is hit by enemy bullets
void checkPlayerHit() {
  int[] player = { px - 45, py - 30, 100, 100 };
  for (int i = 0; i < ebx.size(); i++) {
    int[] bullet = { ebx.get(i), eby.get(i), 8, 8 };
    if (hitBox(player, bullet)) {
      ebx.remove(i);
      eby.remove(i);
      playerLives--;
      if (playerLives <= 0) {
        gameMode=4; // Game over
      }
      break;
    }
  }
}
// Function for winning the first round
void round1win() {
  resetGame();
  resetBarriers();
  // Initialize variables for button positions
  int x, y;
  x = 450;
  y = 320;
  // Display 'You Win' image
  image(youwin, 335, height / 8 - 100, 500, 300);
  // Setup button styles
  fill(255, 255, 255);
  textSize(30);
  // Draw buttons and their labels
  fill(0);
  rect(x, y, 250, 60, 28); // Final Round button
  rect(x, y + 100, 250, 60, 28); // MainMenu button
  rect(x, y + 200, 250, 60, 28); // Quit button
  fill(19, 157, 8); // Button text color
  // Button labels
  text("Final Round", x + 55, y + 40);
  text("MainMenu", x + 60, y + 135);
  text("Quit", x + 100, y + 240);
  // Check if mouse is over Final Round button
  if (mouseIn(x, y, 250, 60)) {
    strokeWeight(10); // Highlight button border
    fill(19, 157, 8); // Change button color
    rect(x, y, 250, 60, 28); // Redraw button with highlight
    fill(0); // Change text color
    text("Final Round", x + 55, y + 40); // Redraw text
    if (mousePressed) {
      gameMode = 6; // Set game mode to Final Round
    }
  }
  // Check if mouse is over MainMenu button
  if (mouseIn(x, y + 100, 250, 60)) {
    fill(19, 157, 8); // Change button color
    rect(x, y + 100, 250, 60, 28); // Redraw button
    fill(0); // Change text color
    text("MainMenu", x + 60, y + 135); // Redraw text
    if (mousePressed) {
      gameMode = 0; // Set game mode to Main Menu
    }
  }
  // Check if mouse is over Quit button
  if (mouseIn(x, y + 200, 250, 60)) {
    fill(19, 157, 8); // Change button color
    rect(x, y + 200, 250, 60, 28); // Redraw button
    fill(0); // Change text color
    text("Quit", x + 100, y + 240); // Redraw text
    if (mousePressed) {
      exit(); // Exit game
    }
  }
}
void gameOver() {
  resetGame(); // Reset game state
  // Initialize variables for button positions
  int x, y;
  x = 450;
  y = 320;
  // Display 'Game Over' image
  image(gameover, 335, height / 8 - 100, 500, 300);
  // Setup button styles
  fill(255, 255, 255);
  textSize(30);
  // Draw buttons and their labels
  fill(0);
  rect(x, y, 250, 60, 28); // Restart button
  rect(x, y + 100, 250, 60, 28); // MainMenu button
  rect(x, y + 200, 250, 60, 28); // Quit button
  fill(19, 157, 8); // Button text color
  // Button labels
  text("Restart", x + 75, y + 40);
  text("MainMenu", x + 60, y + 135);
  text("Quit", x + 100, y + 240);
  // Check if mouse is over Restart button
  if (mouseIn(x, y, 250, 60)) {
    strokeWeight(10); // Highlight button border
    fill(19, 157, 8); // Change button color
    rect(x, y, 250, 60, 28); // Redraw button with highlight
    fill(0); // Change text color
    text("Restart", x + 75, y + 40); // Redraw text
    if (mousePressed) {
      gameMode = 1; // Set game mode to Restart
    }
  }
  // Check if mouse is over MainMenu button
  if (mouseIn(x, y + 100, 250, 60)) {
    fill(19, 157, 8); // Change button color
    rect(x, y + 100, 250, 60, 28); // Redraw button
    fill(0); // Change text color
    text("MainMenu", x + 60, y + 135); // Redraw text
    if (mousePressed) {
      gameMode = 0; // Set game mode to Main Menu
    }
  }  // Check if mouse is over Quit button
  if (mouseIn(x, y + 200, 250, 60)) {
    fill(19, 157, 8); // Change button color
    rect(x, y + 200, 250, 60, 28); // Redraw button
    fill(0); // Change text color
    text("Quit", x + 100, y + 240); // Redraw text
    if (mousePressed) {
      exit(); // Exit game
    }
  }
}
void Finalround() {
  bosshealth(); // Draw boss health bar
  checkBossCollision(); // Check collision between player bullets and boss
  movePlayer(); // Move player
  moveBullets(); // Move player bullets
  drawBullets(); // Draw player bullets
  drawPlayer(); // Draw player
  drawBarriers(); // Draw barriers
  checkBarrierCollisions(); // Check collision between player bullets and barriers
  drawHearts(); // Draw player lives
  drawBosses(); // Draw bosses
  moveBosses(); // Move bosses
  bossShoot(); // Boss shoots bullets
  moveBossBullets(); // Move boss bullets
  drawBossBullets(); // Draw boss bullets
  checkBossBulletCollision(); // Check collision between boss bullets and player
  // Increase boss shooting probability over time
  if (BossShootingProbability < 10) {
    BossShootingProbability += 0.01;
  }
}
void resetBarriers() {
  // Reset barriers to their initial states
  for (int i = 0; i < barriers.length; i++) {
    barriers[i][2] = 0; // Reset barrier damage state
  }
}
void checkBossBulletCollision() {
  int[] playerBox = { px - 45, py - 30, 100, 100 }; // Player hitbox
  // Check collision between player and boss bullets
  for (int i = bossBulletX.size() - 1; i >= 0; i--) {
    int[] bullet = { bossBulletX.get(i), bossBulletY.get(i), 100, 100 }; // Boss bullet hitbox
    if (hitBox(playerBox, bullet)) {
      bossBulletX.remove(i); // Remove bullet from list
      bossBulletY.remove(i); // Remove bullet from list
      playerLives--; // Decrease player lives
      if (playerLives <= 0) {
        gameMode = 4; // Game Over mode
      }
    }
  }
}
void checkBossCollision() {
  // Check collision between player bullets and boss
  for (int i = bx.size() - 1; i >= 0; i--) {
    int[] bullet = { bx.get(i), by.get(i), 8, 8 }; // Player bullet hitbox
    for (int j = 0; j < 1; j++) { 
      int[] boss = { bossX[j], bossY[j], 200, 100 }; // Boss hitbox
      if (hitBox(boss, bullet)) {
        bx.remove(i); // Remove bullet from list
        by.remove(i); // Remove bullet from list
        println("hit");
        bosshealth -= 50; // Decrease boss health
        if (bosshealth == 0) {
          gameMode = 7; // Win mode
        }
        break;
      }
    }
  }
}
void Finalroundwin() {
  resetGame(); // Reset the game state
  resetBoss();
  // Position variables for buttons
  int x, y;
  x = 450;
  y = 320;
  // Display "You Win" image
  image(youwin, 335, height/8 - 100, 500, 300);
  // Set text properties for buttons
  fill(255, 255, 255);
  textSize(30);
  fill(0);
  // Draw Restart button
  rect(x, y, 250, 60, 28);
  rect(x, y + 200, 250, 60, 28);
  rect(x, y + 100, 250, 60, 28);
  fill(19, 157, 8);
  text("Restart", x + 75, y + 40);
  // Draw MainMenu button
  text("MainMenu", x + 60, y + 135);
  // Draw Quit button
  text("Quit", x + 100, y + 240);
  // Check if mouse is over Restart button
  if (mouseIn(x, y, 250, 60)) {
    strokeWeight(10);
    rect(x, y, 250, 60, 28);
    fill(0);
    text("Restart", x + 75, y + 40);
    // Check if mouse is pressed over Restart button
    if (mousePressed) {
      gameMode = 1; // Set game mode to 1 
      resetGame(); // Reset the game
    }
  }
  // Check if mouse is over MainMenu button
  if (mouseIn(x, y + 100, 250, 60)) {
    fill(19, 157, 8);
    rect(x, y + 100, 250, 60, 28);
    fill(0);
    text("MainMenu", x + 60, y + 135);
    // Check if mouse is pressed over MainMenu button
    if (mousePressed) {
      gameMode = 0; // Set game mode to 0 
      resetGame(); // Reset the game
    }
  }
  // Check if mouse is over Quit button
  if (mouseIn(x, y + 200, 250, 60)) {
    fill(19, 157, 8);
    rect(x, y + 200, 250, 60, 28);
    fill(0);
    text("Quit", x + 100, y + 240);
    // Check if mouse is pressed over Quit button
    if (mousePressed) {
      exit(); // Exit the program
    }
  }
}
void bosshealth() {
  // Draw boss health bar
  rect(0, 10, 1200, 20, 28); // Background bar
  fill(#10E873); // Health bar color
  rect(0, 10, bosshealth, 20, 28); // Current health bar
  // Draw divisions in the health bar
  for (int i = 0; i <= 1200; i += 50) {
    noFill();
    stroke(0);
    strokeWeight(2);
    rect(0, 10, i, 20, 28);
  }
  // Display heart image to indicate boss health
  image(heart2, -20, -20, 100, 100);
}
void bossShoot() {
  // Boss shoots bullets randomly
  if (random(100) < BossShootingProbability) {
    bossBulletX.append(bossX[0] + 90); // Center of the boss ship
    bossBulletY.append(bossY[0] + 100); // Bottom of the boss ship
  }
}
void moveBossBullets() {
  // Move boss bullets
  for (int i = bossBulletY.size() - 1; i >= 0; i--) {
    bossBulletY.set(i, bossBulletY.get(i) + bossBulletSpeed); // Move vertically
    if (bossBulletY.get(i) > height) {
      bossBulletX.remove(i); // Remove bullets that are off-screen
      bossBulletY.remove(i);
    }
  }
}
void drawBossBullets() {
  // Draw boss bullets
  fill(255, 0, 0); // Red bullets
  for (int i = 0; i < bossBulletX.size(); i++) {
    image(bossbullet, bossBulletX.get(i), bossBulletY.get(i), 100, 100); // Draw bullet image
  }
}
void drawBosses() {
  for (int i = 0; i < 1; i++) {
    // Draw three boss ships horizontally aligned
    image(BossShip, bossX[i], bossY[i], 200, 100);
    image(BossShip, bossX[i] - 250, bossY[i], 200, 100);
    image(BossShip, bossX[i] + 250, bossY[i], 200, 100);
  }
}
void moveBosses() {
  // Move bosses horizontally
  for (int i = 0; i < 3; i++) {
    if (bossesMovingRight) {
      bossX[i] += bossSpeed; // Move right
    } else {
      bossX[i] -= bossSpeed; // Move left
    }
  }
  // Wrap bosses around the screen
  for (int i = 0; i < 3; i++) {
    if (bossX[i] >= 1200) {
      bossX[i] -= 2000; // Move to the left side of the screen
    }
  }
}
void drawBarriers() {
  // Draw barriers
  for (int i = 0; i < barriers.length; i++) {
    if (barriers[i][2] < 2) {
      // Draw barrier based on its type
      image(barrier[barriers[i][2]], barriers[i][0], barriers[i][1], 100, 50);
    }
  }
}
void checkBarrierCollisions() {
  // Check for collisions between player bullets and barriers
  for (int i = 0; i < bx.size(); i++) {
    int[] bullet = { bx.get(i), by.get(i), 10, 30 };
    for (int j = 0; j < barriers.length; j++) {
      if (barriers[j][2] < 2) {
        int[] barrierBox = { barriers[j][0], barriers[j][1], 100, 50 };
        if (hitBox(bullet, barrierBox)) {
          barriers[j][2]++; // Increase barrier type
          bx.remove(i); // Remove bullet
          by.remove(i);
          break;
        }
      }
    }
  }
  // Check for collisions between enemy bullets and barriers
  for (int i = 0; i < eby.size(); i++) {
    int[] bullet = { ebx.get(i), eby.get(i), 8, 8 };
    for (int j = 0; j < barriers.length; j++) {
      if (barriers[j][2] < 2) {
        int[] barrierBox = { barriers[j][0], barriers[j][1], 100, 50 };
        if (hitBox(bullet, barrierBox)) {
          barriers[j][2]++; // Increase barrier type
          ebx.remove(i); // Remove bullet
          eby.remove(i);
          break;
        }
      }
    }
  }
  // Check for collisions between boss bullets and barriers
  for (int i = 0; i < bossBulletX.size(); i++) {
    int[] bullet = { bossBulletX.get(i), bossBulletY.get(i), 100, 100 };
    for (int j = 0; j < barriers.length; j++) {
      if (barriers[j][2] < 2) {
        int[] barrierBox = { barriers[j][0], barriers[j][1], 100, 50 };
        if (hitBox(bullet, barrierBox)) {
          barriers[j][2]++; // Increase barrier type
          bossBulletX.remove(i); // Remove bullet
          bossBulletY.remove(i);
          break;
        }
      }
    }
  }
}
void enemyShoot() {
  // Enemy shoots bullets randomly
  if (random(100) < enemyShootingProbability) {
    int randomEnemyIndex = int(random(ex.size()));
    if (enemyAlive.get(randomEnemyIndex) == 1) {
      int exPos = ex.get(randomEnemyIndex);
      int eyPos = ey.get(randomEnemyIndex);
      addEnemyBullet(exPos + 20, eyPos + 40); // Add enemy bullet
    }
  }
}
void addEnemyBullet(int xb, int yb) {
  ebx.append(xb); // Add enemy bullet x position
  eby.append(yb); // Add enemy bullet y position
}
void moveEnemyBullets() {
  // Move enemy bullets
  for (int i = 0; i < eby.size(); i++) {
    eby.set(i, eby.get(i) + EbSpeed); // Move vertically
    if (eby.get(i) > height) {
      ebx.remove(i); // Remove bullet if off-screen
      eby.remove(i);
    }
  }
}
void drawEnemyBullets() {
  // Draw enemy bullets
  for (int i = 0; i < ebx.size(); i++) {
    fill(255, 0, 0);
    rect(ebx.get(i), eby.get(i), 8, 8); // Draw bullet
  }
}
void showInstructions() {
  noStroke();
  fill(0);
  rect(250, 150, 700, 250); // Background for instructions
  fill(#6EFF08); // Text color
  textSize(30); // Text size
  // Instructions text
  String s = " 1. Use the left and right arrow keys to move your ship.\n 2. Press the space bar to shoot bullets.\n 3. Destroy all enemies to advance to the next round.\n 4. Avoid enemy bullets to stay alive.\n 5. Protect your barriers, they can block enemy bullets\n 6. You have 3 lives. Lose all lives and it's game over\n 7. Good luck, and have fun!";
  text(s, 250, 180); // Text position
  textSize(50); // Larger text size for title
  text("Space Invaders Instructions", 300, 100); // Title position
  backB(); // Call to a different function
}
void themes() {
  textSize(50); // Text size
  fill(#00FF28); // Green color
  text("Themes", 500, 48); // Title text
  int x = 190; // X coordinate for first button
  int y = 200; // Y coordinate for first button
  int s = 200; // Button size
  strokeWeight(20); // Thick border
  fill(0); // Black fill for background
  // Draw theme buttons
  rect(x, y, s, s, 28); // Classic theme button
  rect(x + 300, y, s, s, 28); // Snowny theme button
  rect(x + 600, y, s, s, 28); // Sunny theme button
  fill(#00FF28); // Green color for text
  textSize(50); // Text size
  text("Classic", 215, 320); // Classic text
  text("Snowny", 508, 320); // Snowny text
  text("Sunny", 825, 320); // Sunny text
  // Check for mouse over Classic theme button
  if (mouseIn(x, y, s, s)) {
    fill(#00FF28); // Green fill
    rect(x, y, s, s, 28); // Highlight button
    fill(0); // Black fill for text
    text("Classic", 215, 320); // Classic text
    if (mousePressed) {
      theme = 0; // Set theme to Classic
    }
  }
  // Check for mouse over Snowny theme button
  if (mouseIn(x + 300, y, s, s)) {
    fill(#00FF28); // Green fill
    rect(x + 300, y, s, s, 28); // Highlight button
    fill(0); // Black fill for text
    text("Snowny", 508, 320); // Snowny text
    if (mousePressed) {
      theme = 1; // Set theme to Snowny
    }
  }
  // Check for mouse over Sunny theme button
  if (mouseIn(x + 600, y, s, s)) {
    fill(#00FF28); // Green fill
    rect(x + 600, y, s, s, 28); // Highlight button
    fill(0); // Black fill for text
    text("Sunny", 825, 320); // Sunny text
    if (mousePressed) {
      theme = 2; // Set theme to Sunny
    }
  }
  backB(); // Draw back button
}
void backB() {
  textSize(25); // Text size
  strokeWeight(10); // Thick border
  fill(0); // Black fill
  rect(20, 20, 100, 60, 28); // Back button background
  fill(19, 157, 8); // Green color
  text("Back", 45, 58); // Back button text
  // Check for mouse over Back button
  if (mouseIn(20, 20, 100, 60)) {
    fill(19, 157, 8); // Green fill
    rect(20, 20, 100, 60, 28); // Highlight button
    fill(0); // Black fill for text
    text("Back", 45, 58); // Back button text
    if (mousePressed) {
      gameMode = 0; // Set game mode to Main Menu
    }
  }
}
void drawBullets() {
  for (int i = 0; i < bx.size(); i++) {
    if (theme == 0) {
      fill(0); // Black fill for bullet
      image(bullet1, bx.get(i), by.get(i), 8, 8); // Draw Classic bullet
    } else if (theme == 1) {
      image(bullet2, bx.get(i), by.get(i), 8, 8); // Draw Snowny bullet
    } else if (theme == 2) {
      image(bullet3, bx.get(i), by.get(i), 8, 8); // Draw Sunny bullet
    }
  }
}
void drawPlayer() {
  // Draw player ship based on theme
  if (theme == 0) {
    image(ship1, px - 45, py - 30, 100, 100); // Classic ship
  } else if (theme == 1) {
    image(ship2, px - 45, py - 30, 100, 100); // Snowny ship
  } else if (theme == 2) {
    image(ship3, px - 45, py - 30, 100, 100); // Sunny ship
  }
}
void movePlayer() {
  if (rapid < 15) {
    rapid++;
  }
  if (moveLeft == true && px > 45) {
    px -= 15; // Move left
  }
  if (moveRight == true && px < width - 45) {
    px += 15; // Move right
  }
}
void moveBullets() {
  // Move player bullets
  for (int i = 0; i < by.size(); i++) {
    by.set(i, by.get(i) + bSpeed); // Move vertically
    if (by.get(i) < 0) {
      bx.remove(i); // Remove bullet if off-screen
      by.remove(i);
    }
  }
}
void addBullet(int xb, int yb) {
  bx.append(xb); // Add bullet x position
  by.append(yb); // Add bullet y position
}
void keyPressed() {
  if (key == CODED && keyCode == LEFT) {
    moveLeft = true; // Set moveLeft to true
  }
  if (key == CODED && keyCode == RIGHT) {
    moveRight = true; // Set moveRight to true
  }
}
void keyReleased() {
  if (key == CODED && keyCode == LEFT) {
    moveLeft = false; // Set moveLeft to false
  }
  if (key == CODED && keyCode == RIGHT) {
    moveRight = false; // Set moveRight to false
  }
  if (key == ' ' && rapid == 15) {
    addBullet(px, py - 20); // Add bullet
    rapid = 0; // Reset rapid fire counter
  }
}
void drawEnemies() {
  noStroke(); // Disable stroke for the shapes
  for (int i = 0; i < ex.size(); i++) { // Iterate through all enemies
    if (enemyAlive.get(i) == 1) { // Check if the enemy is alive
      int type = enemyType.get(i); // Get the type of the enemy
      if (type == 0) {
        // Draw type 0 enemy
        image(enemyImages1[int(frame)], ex.get(i), ey.get(i), 80, 50);
      } else if (type == 1) {
        // Draw type 1 enemy
        image(enemyImages2[int(frame)], ex.get(i), ey.get(i), 80, 50);
      } else if (type == 2) {
        // Draw type 2 enemy
        image(enemyImages3[int(frame)], ex.get(i), ey.get(i), 80, 50);
      }
    }
  }
  frame += 0.2; // Increment frame for animation
  if (frame > 2) { // Reset frame if it exceeds 2 (assuming there are 3 frames)
    frame = 0;
  }
}
void resetGame() {
  // Reset player position and state
  px = width / 2;
  py = 620;
  playerLives = 3;
  // Clear bullets
  bx.clear();
  by.clear();
  ebx.clear();
  eby.clear();
  // Reset enemy shooting probability
  enemyShootingProbability = 1;
  // Reset barriers
  for (int i = 0; i < barriers.length; i++) {
    barriers[i][2] = 0;
  }
  // Reset enemies
  ex.clear();
  ey.clear();
  enemyAlive.clear();
  enemyType.clear();
  for (int i = 2; i < 11; i++) {
    for (int j = 0; j < 6; j++) {
      ex.append(i * 100); // Set enemy x position
      ey.append(70 * j); // Set enemy y position
      enemyAlive.append(1); // Mark enemy as alive
      if (j < 2) {
        enemyType.append(0); // Type 0 enemy
      } else if (j < 4) {
        enemyType.append(1); // Type 1 enemy
      } else {
        enemyType.append(2); // Type 2 enemy
      }
    }
  }
  bosshealth = 10; // Set boss health
  // Set initial boss positions
  for (int i = 0; i < 3; i++) {
    bossX[i] = 100 + i * 300;
    bossY[i] = 100;
  }
  // Set initial barriers positions
  barriers = new int[][] {
    {50, 500, 0},
    {250, 500, 0},
    {450, 500, 0},
    {650, 500, 0},
    {850, 500, 0},
    {1050, 500, 0}
  };
  defeatedEnemiesCount=0;
}

void moveEnemies() {
  for (int i = 0; i < ex.size(); i++) { // Iterate through all enemies
    if (EmovingRight) {
      ex.set(i, ex.get(i) + 3); // Move enemy right
    } else {
      ex.set(i, ex.get(i) - 3); // Move enemy left
    }
  }
  // Check if any enemy hits the boundary of the screen
  for (int i = 0; i < ex.size(); i++) {
    if (ex.get(i) >= width - 40) {
      EmovingRight = false; // Change direction to left
      break;
    } else if (ex.get(i) <= 0) {
      EmovingRight = true; // Change direction to right
      break;
    }
  }
}
void checkCollisions() {
  // Iterate through bullets from the end
  for (int i = bx.size() - 1; i >= 0; i--) {
    int[] bullet = { bx.get(i), by.get(i), 8, 8 }; // Get bullet position and size
    for (int j = 0; j < ex.size(); j++) { // Iterate through all enemies
      if (enemyAlive.get(j) == 1) { // Check if enemy is alive
        int[] enemy = { ex.get(j), ey.get(j), 80, 50 }; // Get enemy position and size
        if (hitBox(enemy, bullet)) { // Check for collision
          enemyAlive.set(j, 0); // Mark enemy as dead
          bx.remove(i); // Remove bullet
          by.remove(i);
          defeatedEnemiesCount++; // Increment defeated enemies count
          if (defeatedEnemiesCount >= ex.size()) { // Check if all enemies are defeated
            gameMode = 5;
          }
          break;
        }
      }
    }
  }
}
void resetBoss() {
  // Reset boss health
  bosshealth = 1200;
  // Reset boss positions
  for (int i = 0; i < 3; i++) {
    bossX[i] = 100 + i * 300;
    bossY[i] = 100;
  }
  // Reset boss movement direction
  bossesMovingRight = true;
  // Clear boss bullets
  bossBulletX.clear();
  bossBulletY.clear();
  // Reset boss shooting probability
  BossShootingProbability = 1;
}
//Teacher Provided code!!
//-------------------------------------------------------------
boolean hitBox(int[] r1, int[] r2) {
  int r1Bot, r1Right;
  int r2Bot, r2Right;
  r1Right=r1[0]+r1[2];//the "right" side of the first rectangle
  r1Bot=r1[1]+r1[3];//the "bottom" of the first rectangle

  r2Right=r2[0]+r2[2];//the "right" side of the second rectangle
  r2Bot=r2[1]+r2[3];//the "bottom" of the second rectangle

  return (r1Right > r2[0] && r1[0] < r2Right && r1Bot > r2[1] && r1[1] < r2Bot);
}//end hitBox

//The function returns true if the mouse pointer is INSIDE the rectangle, otherwise returns false
boolean mouseIn(int left, int top, int w, int h) {
  return (mouseX > left && mouseX < left+w && mouseY > top && mouseY < top+h);
}//end mouseIn
