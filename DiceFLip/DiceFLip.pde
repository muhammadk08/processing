//DiceFLip

PImage one,two,three,four,five,six;
int num=9;

void setup() {
  size(500,500);
  one=loadImage("one.png");
  two=loadImage("two.png");
  three=loadImage("three.png");
  four=loadImage("four.png");
  five=loadImage("five.png");
  six=loadImage("six.png");
}

void draw() {
  background(255,255,0);
   rect(230,400, 100, 70);
  if (num==1) {
    image(one, 250, 150, 100, 100);
  } else if (num==2) {
    image(two, 250, 150, 100, 100);
  }
  else if (num==3) {
    image(three, 250, 150, 100, 100);
  }
  else if (num==4) {
    image(four, 250, 150, 100, 100);
  }
  else if (num==5) {
    image(five, 250, 150, 100, 100);
  }
  else if (num==6) {
    image(six, 250, 150, 100, 100);
  }
}


void mousePressed() {
  if (mouseX>230 && mouseX<330 && mouseY>400 && mouseY<470) {
    num=int(random(1, 6));
    println(num);
  }
}
