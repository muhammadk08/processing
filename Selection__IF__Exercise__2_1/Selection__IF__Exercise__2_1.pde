import static javax.swing.JOptionPane.*;

//1
int h,w;

h=int(showInputDialog("Enter the height"));
w=int(showInputDialog("Enter the width"));

if (h==w) {
  println("the shape is a square");
  println("the area of this shape is", h*w);
}
else{
   println("the shape is a rectangle");
   println("the area of this rectangle is", h*w);
}
