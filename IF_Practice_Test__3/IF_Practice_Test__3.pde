import static javax.swing.JOptionPane.*;

int cr,th,tb,s;
s=int(showInputDialog("Enter 1 for triangle and 2 for cirlce"));


if (s==1) {
 //ta=int(showInputDialog("Enter the area"));
 th=int(showInputDialog("Enter height"));
 tb=int(showInputDialog("Enter base"));
 println("the area of the triangle is "+((tb)*(th)*0.5));
} else if (s==2) {
 //ca=int(showInputDialog("Enter the area"));
 cr=int(showInputDialog("Enter the radius"));
 println("the area of the cirlce is "+(3.14*cr*cr));
} 
