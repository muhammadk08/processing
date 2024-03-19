//Gang of Four Point calculator
import static javax.swing.JOptionPane.*;

int noc;

noc=int(showInputDialog("Enter the number of cards you have"));

if (noc <0) {
    println("Error");
  } 
  else if(noc <= 7) {
    println("You have " + noc * 1 + " points");
  } 
  else if (noc <= 10) {
    println("You have " + noc * 2 + " points");
  } 
  else if (noc <= 13) {
    println("You have " + noc * 3 + " points");
  } 
  else if (noc <= 15) {
    println("You have " + noc * 4 + " points");
  } 
  else if (noc <= 16) {
    println("You have " + noc * 4 + " points");
  }
