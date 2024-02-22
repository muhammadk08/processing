//4 Shapes

size(800,600);
//Shape 1
strokeWeight(10);

stroke(0,0,255);
noFill();
ellipse(100,100,100,100);//Blue circle

stroke(0);

stroke(0, 0, 0);
noFill();
ellipse(215,100,100,100);//black circle

stroke(0);

stroke(255, 0, 0);
noFill();
ellipse(330,100,100,100);//green circle

stroke(0);

stroke(0, 255, 0);
noFill();
ellipse(275,150,100,100);//green circle

stroke(0);

stroke(255, 255, 0);
noFill();
ellipse(160,150,100,100);//yellow circle

stroke(0);

//Shape 2 envelope
strokeWeight(1.5);
fill(0,255,0);
rect(450,50,300,170);
triangle(450,50,750,50,600,120);

//snowman
strokeWeight(6);
fill(255);
ellipse(200,500,160,160);
ellipse(200,360,120,120);
ellipse(200,260,80,80);

//smily
strokeWeight(6);
ellipse(600,450,250,250);
ellipse(550,400,40,40);
ellipse(650,400,40,40);
arc(600,470,150,120,radians(0),radians(180));
