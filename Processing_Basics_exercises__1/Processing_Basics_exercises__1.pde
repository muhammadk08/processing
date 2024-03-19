//Processing Basics exercises #1
import static javax.swing.JOptionPane.*;
////1
println("Perimeter:",5*2+7*2);
println("Area:",5*7);
//2
int len1,len2;
len1=int(showInputDialog("Enter lenght 1; "));
len2=int(showInputDialog("Enter lenght 2; "));
println("the area of the shape is",len1*len2);
//3
int snow1,snow2;
snow1=int(showInputDialog("Enter snow day 1; "));
snow2=int(showInputDialog("Enter snow day 2; "));
println("the average snow is",(snow1+snow2)/2);
//4
float total;
total =(5.99+24.99+2.99)*1.13;
println("The total she spent is $:"+nf(total,0,2));
println("The balance left is $:"+nf(100-total,0,2));
//5
int year;
year=int(showInputDialog("Enter birth year; "));
println("you are",2024-year,"years old");
