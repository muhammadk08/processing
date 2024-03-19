import static javax.swing.JOptionPane.*;
////IF 
////1
////make varibles to for city and kms
//String city;
//int km=0;
////get the value for the variables
//city=showInputDialog("Enter your city").toLowerCase();
//  km = int(showInputDialog("Enter the distance")); 
//// Check if the distance is negative
//if (km<0) {
//  println("error");
//} 
//// Check the city name and calculate the taxi fare accordingly
//else if (city.equals("windsor")) {
//  println("It would cost you $" + nf((3.80 + (2.19 * km)), 0, 2));
//} else if (city.equals("london")) {
//println("It would cost you $" + nf((4.25 + (2.25 * km)), 0, 2));
//} else if (city.equals("toronto")) {
//println("It would cost you $" + nf((4.85 + (2.44 * km)), 0, 2));
//} else {
//  println("invalid input");
//}
//2
//int side1, side2, side3;//make variables for each side
////get the value of the variables
//side1= int(showInputDialog("Enter the side length"));
//side2= int(showInputDialog("Enter the side length"));
//side3= int(showInputDialog("Enter the side length"));
//// Check if all three sides are equal for a equilateral triangle
//if (side1==side2 && side2==side3){
//println("This is an equilateral triangle");
//}
////check if at least 2 sides are equal for an isosceles  triangle
//else if (side1 == side2 || side1 == side3 || side2 == side3){
//println("This is an isosceles  triangle");
//}
////if no sides are equal print scalene
//else {
//println("This is an scalene triangle");
//}
//3
//int speed,limit,over;//make variable for speed limit,speed and over the speed limit 
//float fine=0; // variable for fine make it 0 so its intialized
//speed= int(showInputDialog("Enter the speed "));
//limit= int(showInputDialog("Enter the speed limit"));
//// Calculate the speed difference
//over=speed-limit;
//// Check if the speed is not over the speed limit
//if (over<=0) {
//  println("No fine"); //if not over the limit no fine
//}
//// Check if the speed difference is between 1 and 19 km/h over the limit
//else if (over<=19) {
//    fine = over * 5.50;// Calculate fine for speeds between 1 and 19 km/h over
//}
//// Check if the speed difference is between 20 and 34 km/h over the limit
//else if (over<= 34) {
//    fine = over * 8.75;// Calculate fine for speeds between 20 and 34 km/h over
//} 
//// Check if the speed difference is between 35 and 49 km/h over the limit
//else if (over <= 49) {
//    fine = over * 10.00; // Calculate fine for speeds between 35 and 49 km/h over
//}
//// Check if the speed difference is 50 km/h or more over the limit
//else if (over < 50){
//    fine = over * 40.00; // Calculate fine for speeds of 50 km/h or more over
//}

//// Print the calculated fine amount rounded to 2 decimal places
//println("The fine will be $" + nf(fine, 0, 2));  
