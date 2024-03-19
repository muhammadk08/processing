import static javax.swing.JOptionPane.*;

int age,income,point1=0,point2=0;

age=int(showInputDialog("Enter the age"));
income=int(showInputDialog("Enter the income"));

if (age<=28) {
  point1=0;
} else if (age<=50) {
  point1=20;
} else if (age>50) {
  point1=25;
} 
if (income<=20000) {
  point2=0;
} else if (income<=45000) {
  point2=12;
}
else if (income<=75000) {
  point2=22;
}
else if (income<75000) {
  point2=30;
}


if (point1+point2<=20) {
  println("Credit card denied ");
} else if (point1+point2<=32) {
  println("Approved $500 limit");
}
else if (point1+point2<=33) {
  println("Approved $20000 limit");
}
