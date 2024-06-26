// Animation assignment
float cX = 0; // X-coordinate for cloud movement
float bx = 0; // X-coordinate for bird movement
int speedLimit = 30; // Initial speed limit on the sign
boolean isRaining = false; // Flag to control rain animation
// CLICKABLES AND ANIMATIONS
// 1. CLICK ON THE SUN TO TOGGLE BETWEEN NIGHT AND DAY
// 2. CLICK ON THE DOOR TO OPEN AND CLOSE IT
// 3. CLICK ON THE SPEED LIMIT SIGN TO INCREASE SPEED BY 5
// 4. BIRDS ARE IN CONSTANT MOTION
// 5. CLOUDS DRIFT ACROSS THE SKY
// 6. CLICK ANYWHERE ON THE SCREEN TO ACTIVATE RAIN
void setup() {
  size(1000, 700); // Set canvas size
}
void draw() {
  // Draw sky and sun
  fill(#FCF000);
  strokeWeight(0);
  sun(90, 100, 70, 70);
  // Draw clouds with animation
  noStroke();
  drawCloud(cX, 140, 60, 50);
  drawCloud(cX-150, 70, 60, 50);
  drawCloud(cX+150, 90, 60, 50);
  drawCloud(cX-500, 120, 60, 50);
  cX ++;
  if (cX > 1550) {
    cX = -180;
  }
  // Draw other static elements
  flowers(20, 400);
  strokeWeight(5);
  tree(350);
  fill(#EDFF00);
  drawHouse(250, 200, 450, 250);
  fence();
  stroke(#0A0101);
  fill(#EA0E0E);
  windows(290, 230, 70, 70);
  windows(590, 230, 70, 70);
  strokeWeight(3);
  windows(290, 70, 30, 30);
  windows(440, 70, 30, 30);
  strokeWeight(2);
  door(430, 310, 70, 140);
  fill(#BFB692);
  rect(0, 450, 1000, 600);
  grass();
  road();
  sidewalk();
  sign(800, 300, 100, 100);
  lightPoles();
  car();
  drawPeppaPig(100, 400, 100, 100);
  drawBuddy(800, width/2, 100);
  // Animation for birds
  birds(bx-100-100, 100, 20, 10);
  birds(bx+130-100-100, 100, 20, 10);
  birds(bx+130/2-100-100, 50, 20, 10);
  bx += 4;
  if (bx > 1550) {
    bx = -100;
  }
  // Check for rain animation toggle
  if (isRaining) {
    rain();
  }
}
// Function to draw a house
void drawHouse(int x, int y, int w, int l) {
  strokeWeight(5);
  stroke(0);
  rect(x, y, w, l); // Main body of the house
  quad(x-40, y, x+10, x-110, y+500, x-110, x+490, y); // Roof
  rect(x+10, y-150, 240, 90); // Window on the roof
  quad(230, y-150, 280, 10, 480, 10, 520, y-150); // Roof window
}
// Function to draw a fence
void fence() {
  fill(#C6815E);
  stroke(#D89472);
  int x = 503;
  for (int tk = 0; tk < 28; tk++) {
    rect(x, 100, 7, 40); // Vertical poles
    triangle(x, 100, (x+7), 100, (x + 3), 90); // Fence top
    x += 7;
  }
}
// Function to draw windows
void windows(int x, int y, int w, int l) {
  rect(x, y, w, l); // Window frame
  line(x+l/2, y, x+l/2, y+l); // Horizontal divider
  line(x, y+l/2, x+l, y+l/2); // Vertical divider
}
// Function to draw a door
void door(int x, int y, int w, int h) {
  if (mousePressed && mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    fill(#E3DF8E); // Green color for open door
    rect(x, y, w, h);
    fill(#5E2F02);
    rect(x+70, y, w, h); // Door with knob
  } else {
    fill(#5E2F02);
    rect(x, y, w, h); // Closed door
    fill(#F7F7EB);
    ellipse(x+10, y+h/2, 10, 10); // Door knob
  }
}
// Function to draw a cloud
void drawCloud(float x, float y, float w, float h) {
  fill(255);
  ellipse(x, y, w, h); // Main ellipse
  ellipse(x+60, y, w, h); // Second ellipse
  ellipse(x+30, y-10, w, h); // Third ellipse
  ellipse(x+30, y+2, w, h); // Fourth ellipse
}
// Function to draw the sun
void sun(int x, int y, int w, int h) {
  if (mousePressed && mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    background(#655F9B); // Change background color when sun is clicked
    fill(#FCFCFC);
    ellipse(x+35, y+35, w, h); // Sun with rays
    noStroke();
    // Draw sun rays
    for (int a = 0; a < 1000; a += 30) {
      for (int b = 0; b < 1000; b += 50) {
        ellipse(a, b, 3, 3);
      }
    }
  } else {
    background(#f1eadb); // Reset background color
    ellipse(x+35, y+35, w, h); // Sun without rays
  }
}
// Function to draw grass
void grass() {
  int x = 0;
  for (int y = 470; y <= 900; y += 19) {
    x = 0;
    for (int tk = 0; tk < 1000; tk++) {
      noStroke();
      fill(#2FFC08);
      triangle(x, y, (x+15), y, (x + 7), y-20); // Grass blades
      x += 7;
    }
  }
}
// Function to draw flowers
void flowers(int d, int y) {
  for (int x = 10; x <= 1100; x += 19) {
    fill(#12FF4B);
    rect(x, y, 2, 50); // Stem
    fill(0);
    ellipse(x, y, 20, 20); // Center
    fill(#FF0808);
    // Petals
    ellipse(x, y-d, 20, 20);
    ellipse(x+d, y, 20, 20);
    ellipse(x-d, y, 20, 20);
    ellipse(x, y+d, 20, 20);
    x += 50;
  }
}
// Function to draw trees
void tree(float y) {
  for (int x = 10; x <= 1100; x += 120) {
    fill(#7A7C52);
    rect(x, y, 20, 100); // Tree trunk
    fill(#08FF16);
    ellipse(x+8, y-20, 100, 100); // Tree top
  }
}
// Function to draw the road
void road() {
  int y = 210;
  fill(#363231);
  rect(0, 315+y, 1100, 100); // Road body
  int x = 0;
  for (int tk = 0; tk < 20; tk++) {
    fill(#F5E748);
    rect(x, 350+y, 35, 15); // Road markings
    x += 80;
  }
}
// Function to draw the sidewalk
void sidewalk() {
  fill(#AAA8A7);
  int y = 210;
  rect(0, 240+y, 1000, 75); // Sidewalk body
  stroke(0);
  // Sidewalk lines
  int x = 50;
  for (int tk = 0; tk < 20; tk++) {
    line(x, 240+y, (x - 40), 315+y);
    x += 75;
  }
  stroke(#D89472);
  line(0, 240+y, 600, 240+y); // Sidewalk boundary
  stroke(0);
  line(0, 315+y, 600, 315+y); // Road boundary
}
// Function to draw a car
void car() {
  fill(#F5022F);
  int x = 150;
  int y = 500;
  // Car body
  quad(x, y, x+250, y, x+250, y+75, x, y+75);
  quad(x+30, y, x+215, y, x+170, y-75, x+75, y-75);
  fill(#02BEF5);
  quad(x+40, y, x+205, y, x+160, y-65, x+85, y-65); // Windows
  // Wheels
  fill(77);
  int b = 580;
  ellipse(190, b, 50, 50);
  ellipse(350, b, 50, 50);
  fill(#FFFFFF);
  ellipse(190, b, 10, 10);
  ellipse(350, b, 10, 10);
  // Car lines
  line(x+100, y, x+100, y+75);
  fill(#F5ED02);
  rect(150, 500, 15, 25);
  rect(400-15, 500, 15, 25);
}
// Function to draw a sign
void sign(int x, int y, int w, int h) {
  fill(1);
  rect(x-5, y, 10, 148); // Pole
  fill(#FF0303);
  ellipse(x, y, 100, 100); // Sign body
  fill(#FFFFFF);
  ellipse(x, y, 75, 75); // Sign face
  fill(0);
  textSize(60);
  // Display speed limit on the sign
  if (speedLimit >= 100) {
    textSize(45);
    text(speedLimit, x - 33, y + 10);
  } else {
    text(speedLimit, x - 30, y + 20);
  }
}
// Function to check if mouse is inside a circle
boolean insideCircle(int x, int y, int radius) {
  return dist(mouseX, mouseY, x, y) < radius;
}
// Function to draw birds
void birds(float x, float y, float w, float h) {
  noFill();
  arc(x, y, w, h, radians(180), radians(360)); // Bird body
  arc(x+w, y, w, h, radians(180), radians(360)); // Bird body
}
// Function to draw rain
void rain() {
  for (int i = 0; i < 1000; i++) {
    float x = random(width);
    float y = random(height);
    strokeWeight(3);
    stroke(#00B9FF);
    line(x, y, x, y + 5); // Raindrops
  }
}
// Function called when mouse is pressed
void mousePressed() {
  // Check if mouse is inside the sign or not
  if (insideCircle(800, 300, 50)) {
    speedLimit += 5; // Increase speed limit
  } else {
    isRaining = !isRaining; // Toggle rain animation
  }
}
// Function to draw light poles
void lightPoles() {
  for (int x = -50; x < 1100; x += 200) {
    noStroke();
    fill(1);
    rect(x - 10, 240, 20, 210); // Pole
    fill(#FFFF00);
    ellipse(x, 220, 40, 40); // Light bulb
    fill(#FFD700);
    ellipse(x, 220, 30, 30); // Light bulb cover
  }
}
// Function to draw Peppa Pig
void drawPeppaPig(int x, int y, int w, int h) {
  noStroke();
  fill(#FC82B5);
  ellipse(x, y, w, h); // Pig body
  fill(0);
  ellipse(x - 20, y - 20, 20, 20); // Eyes
  ellipse(x + 20, y - 20, 20, 20); // Eyes
  fill(#FF2480);
  ellipse(x, y + 20, 30, 20); // Mouth
  fill(#AA1B57);
  ellipse(x - 40, y - 40, 30, 30); // Ears
  ellipse(x + 40, y - 40, 30, 30); // Ears
  stroke(0);
  noFill();
  arc(x, y + 30, 40, 40, radians(0), radians(180)); // Tail
  fill(#FC82B5);
  rect(x-50, y+50, 40, 40); // Legs
  rect(x+5, y+50, 40, 40); // Legs
  rect(x-50, y+150, 40, 60); // Legs
  rect(x+5, y+150, 40, 60); // Legs
  ellipse(x, y+h+15, w, h+20); // Feet
}
// Function to draw Buddy
void drawBuddy(float x, float y, float size) {
  fill(#FF0000);
  ellipse(x, y + 40, 80, 100); // Body
  fill(255);
  ellipse(x, y, size, size); // Head
  fill(0);
  ellipse(x - 20, y - 20, 10, 10); // Eyes
  ellipse(x + 20, y - 20, 10, 10); // Eyes
  fill(#FF9600);
  ellipse(x, y + 10, 15, 10); // Nose
  stroke(0);
  strokeWeight(2);
  arc(x, y + 20, 40, 40, radians(0), radians(180)); // Mouth
  strokeWeight(5);
  line(x - 30, y + 30, x - 50, y + 60); // Arms
  line(x + 30, y + 30, x + 50, y + 60); // Arms
  line(x - 20, y + 70, x - 30, y + 110); // Legs
  line(x + 20, y + 70, x + 30, y + 110); // Legs
}
