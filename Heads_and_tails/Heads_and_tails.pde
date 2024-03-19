//coinFlip

PImage headPic, tailPic;
int num=9;

void setup() {
  size(600, 400);
  headPic=loadImage("head.jpg");
  tailPic=loadImage("tail.jpg");
}

void draw() {
  background(127);
  rect(80, 50, 100, 70);
  if (num==0) {
    image(headPic, 250, 150, 100, 100);
  } else if (num==1) {
    image(tailPic, 250, 150, 100, 100);
  }
}


void mousePressed() {
  //in this function we will generate a random
  //number (0 or 1) only if we click
  //the button
  if (mouseX>80 && mouseX<180 && mouseY>50 && mouseY<120) {//inside rect
    num=int(random(0, 2));
    println(num);
  }
}
