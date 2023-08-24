// History of the game:
// There is a game that we used to play a lot in the school times. Now I am in university. I am a huge fan of the game. This game is about connecting dots and forming squares. The use who draws the last line to form a complete square(s) will own the square. The square will be labeled with the first letter of his name. At the end of the game the player who owns the most squares will have won the game. The rules are simple. You only get to draw a single line as per your turn but if you manage to form a square you will get another turn and you will have to draw another line as well.
// Currently on market options:
// There are several games that are developed based on this idea but they lack the features that make the game more interactive and alive. These existing apps like Line2Box and Dots and Boxes have been developed with Unity. These are not smooth. They not only have a lower framerate but they also lack animation while the user is connecting dots, as a matter of fact there is no connecting dots (poor design) you have to tap on the gap between the two lines and the line abruptly appears. This is a really bad design choice and is something that I want to overcome in my game that I am going to develop under the name ‘Cellz’ using flutter. Cellz will be designed with subtle details that will make the app appealing to the users.
// Subtle Details in Cellz:
// First and foremost, the connection of dots for making lines will be much smoother. I am going to use the same gesture controls and design that is used in the android  lock screen pattern. There will be extensive use of the Google’s Material 3 Design Language. This will make the app more engaging and seeing the smooth and fine control to connect dots is really what the user is gonna be craving for. There are a lot of rules and regulations that will define the properties and behaviors of different components points/dots, lines, squares, user and canvas. There will be instantaneous indicators of remaining moves in the game, current scores of the users and remaining time for each user. If the game is ongoing and the user loses all of his time then he will immediately lose the game.
// Development Phases:
// Phase 1:
// In the first phase of development, we will draw only four points on the canvas. For the sake of time saving and testing, there won’t be multiusers. The Points and Lines Classes’ definitions should be kept as simple and straight farward as defined in the following tables .The life should be deducted automatically as the game starts and incremented in case if the user wins the game at the end. We will just test the point and check if they are connecting properly. After the completion of the square, A letter should animate from the center indicating the current user as the owner of the square. When all the lines are drawn and remaining lines in the game are left zero. Then, an AlertDialogue Box is going to appear with title ‘You Won’. Let’s say current user name is ‘Haseeb’ (that’s my name), Then the Alert Dialogue box should say ‘You won’ in the title and in the content, it should have the score of the user and opponent. Upon press of the back button or an attempt to leave the game, using back navigation the user should be notified with an AlertDialogue Box whether he surely wants to quit the game and lose his life. We will make sure that everything works normally and there aren’t any mishaps. For the phase one testing we will only use stateful widget for state management and we will soon shift to provider as we lay down the foundation.

// Phase 2:
// Integration of the Provider State Management solution to maintain the state throughout the Game’s UI. In the second phase of the development, we will add levels and multiplayer options. We will implement firebase so that the users can connect via using game ids. The user will be able to play online with another player. Share game id {Live Game Document ID} with another player and play together using game id.
// Phase 3:
// The third phase of the development is probably the most advanced phase. We have to integrate a function that acts as another player. There will be random amount of latency so that the human player stays engaged for the computer’s response. The computer player will play competitively with the human player. But as the user becomes offline, this function should be disabled causing the human user to lose his life. The bot player will use an algorithm that will compete with the Human in the most competitive way possible.
// Architecture and Design:
// Before diving into the UI part of the game. We will first identify the components and classes of inside the game along with their respective properties and methods.
// Points
// Members:
// Int xCord;
// Int yCord;
// Bool isMarked; //used to mark the point as bold if already used
// Bool isDisabled; //used to avoid selection if point is connected in all four directions
// Bool isSelected; //use to mark the point even bolder. When drawing a line
// Methods:
// Points({required this. xCord, required this. yCord, this. isSelected = false, this. isDisabled = false, this. isSelected = false});
// Overload the equality operator for Point:
// bool operator ==(Point p2){
// if(this.xCord == p2.xCord && this.yCord == p2.yCord){return true;} else {return false;}
// }
// bool checkDisability(Points p1){
//     if(p1.isDisabled == true){
//         return true;
//     }
//     //find number of instances of p1 in pointsUsed
//     if(
//         pointsUsed.where((element) => element.xCord == p1.xCord && element.yCord == p1.yCord).length > 3
//     ){
//         return true;
//     }
//     return false;

// }

// Lines
// Members:
// Points firstPoint;
// Points secondPoint;
// User owner;
// LineDirection lineDirection;

// Methods:
// Void animate(Lines providedLine){
// //animates the provided Line ie. Line drawn by ai function
// }
// Void CheckSquare(Lines providedLine){
// //this function will check the square based on the line provided as an argument
// }
// Overload the equality operator for Lines:
// bool operator ==(Line l2){
// if(this.firstPoint == l2.firstPoint && this.secondPoint == l2.secondPoint){return true;} else {return false;}
// }

// Enum for directions of the lines drawn
// Enum LineDirection = {Horiz, Vert};

// Square
// Members:
// Lines L1Horiz;
// Lines L2Horiz;
// Lines L1Vert;
// Lines L2Vert;

// Methods:
// Void checkHorizSquare( Lines horizontalLine){
// //This function will check if there is a square above or below the current horizontal line which is //provided as an argument.
// }
// Void checkVertSquare( Lines VerticalLine){
// //This function will check if there is a square on the right or left of the current vertical line which is //provided as an argument.
// }

// GameCanvas
// Members:
// Int numOfXPoints; // number of points on the x axis.
// Int numOfYPoints;// number of points on the y axis.
// Static Bool isGameOver; // toCheck if the game is over or not
// Static Int movesLeft;

// Methods:
// Void calculateMovesLeft(int i /*numOfXPoints*/, int j /*numOfYPoints*/ ){
// GameCanvas.movesLeft = (i-1)j + (j-1)i;
// Void checkVertSquare( Lines VerticalLine){
// //This function will check if there is a square on the right or left of the current vertical line which is //provided as an argument.
// }

// GamePlayers
// Members:
// Bool isPlayer;
// Int score;
// Int numOfLives;//
// List<Lines> linesDrawn = [];
// List<Squares> squaresOwned = [];
// Methods:
// Void incrementScore(){
// //increments the score as user completes a square/squares
// This.score++;
// }
// Void loseLife(){
// //this.life--;
// }
// Void addSquares(Squares s1){
// squaresOwned.add(s1);
// }

// Development Phase 1 Control Flow:
// •	GameStartup:
// On the start of the game, we should first create the Points Objects. This task will be carried out by a function called create points which is explained below:
// List<Points> allPoints= [];
// List<Points> usedPoints =[]; empty at first

// void createPoints(int rows /*numOfXPoints*/, int colums/*numOfYPoints*/){
//     for(var i=0; i<rows; i++){
//         //creates xCord attributes of points objects
//         for(var j=0; j<colums; j++){
//             //creates yCord attributes of points objects
//             allPoints.add(Point(xCord: i, yCord: j));
//         }
//     }
// }

// //After the creation of the points we should plot the Points on the screen from the allPoints[] list based on their respective xCord and yCord Values;
// •	Logic for drawing lines:
// We should use a gesture detector or any other widget so that when the user pans down on the screen, we will first check if the point is disabled or not. If the Point is disabled then we should not be able to draw a line from this current point. We will check whether the point is diabled or not using the function that we have defined in the Points class.
// bool checkDisability(Points p1){
//     if(p1.isDisabled == true){
//         return true;
//     }
//     //find number of instances of p1 in pointsUsed
//     if(
//         pointsUsed.where((element) => element.xCord == p1.xCord && element.yCord == p1.yCord).length > 3
//     ){
//         return true;
//     }
//     return false;

// }

// In case if p1 is not a disabled point, and p1 is being connected with a valid nearby point then add both the points to the usedPoints list.
// We should only be able to connect to a nearby point which is only in the nearby zone around the current p1. Ie check using the following function:
// bool checkNearby(Points p1, Points p2){
//     if(p1.xCord == p2.xCord && p1.yCord == p2.yCord){
//         return false;
//     }
//     if(p1.xCord == p2.xCord && p1.yCord == p2.yCord+1){
//         return true;
//     }
//     if(p1.xCord == p2.xCord && p1.yCord == p2.yCord-1){
//         return true;
//     }
//     if(p1.xCord == p2.xCord+1 && p1.yCord == p2.yCord){
//         return true;
//     }
//     if(p1.xCord == p2.xCord-1 && p1.yCord == p2.yCord){
//         return true;
//     }
//     return false;
// }

// usedPoints.add(p1);
// usedPoints.add(p2);

// Determining the direction of the points connected and creating a line object based on the direction and then add it to the list of allLines:
// List<Lines> allLines = [];
// Lines createLine(Point p1, Point p2){
// If((p2.xCord == p1.xCord+1) || (p2.xCord == p1.xCord-1)  ){
//  return  Lines( firstPoint: p1, secondPoint: p2, lineDirection: LineDirection.Horiz);
// }
// else if((p2.yCord == p1.yCord+1) || (p2.yCord == p1.yCord-1)  ){
//  return  Lines( firstPoint: p1, secondPoint: p2, lineDirection: LineDirection.Vert);
// }
// else{
//     return null;
// }
// }

// final newLine = createLine(p1, p2);
// allLines.add(newLine);

// Now we will come to the cool part where we will check for the squares. We first look for the direction of the line that is passed as an argument to checkSquare() function, after wards we will create 3 new lines and if these newly created 3 lines were found in the List
// We will check for the right and left squares if the line is vertical:
// checkSquare(Lines: newLine){
// switch(newLine.direction){
// case LineDirection.Horiz:
// //check for upper and lower square:
// //Upper Square:
// //L1 is a new line that goes upwards from p1.
// Line L1 = Line( Point(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord), Point(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord +1), owner: currentUser, lineDirection: LineDirection.Vert);
// //L2 is a new line that goes upwards from p2.
// Line L2 = Line( Point(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord), Point(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord +1), owner: currentUser, lineDirection: LineDirection.Vert);
// //L3 is a new line that goes above new line in the same direction as newLine.
// Line L3 = Line( Point(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord+1), Point(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord+1), owner: currentUser, lineDirection: LineDirection.Horiz);

// //check if L1, L2 and L3 are in the list of allLines: then we have a square with owner as current user.

// if(allLines.contains(L1) && allLines.contains(L2) && allLines.contains(L3)){
//     //we have a square
//     //create a square object and add it to the list of squares owned by the current user.
//     Square s1 = Square(L1, L2, L3, newLine);
//     currentUser.addSquares(s1);
//     //increment the score of the current user.
//     currentUser.incrementScore();
//     //check if the game is over or not:
//     if(GameCanvas.movesLeft == 0){
//         //game is over
//         //show an alert dialogue box with the title ‘You Won’ and content as the score of the current user and the opponent.
//         //show a button to navigate to the home screen.
//     }
// }

// After checking for the square above, we are going to check for the square below the newLine in the same manner as above
// //Lower Square:
// //L1 is a new line that goes downwards from p1.
// L1 = Line( Point(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord), Point(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord -1), owner: currentUser, lineDirection: LineDirection.Vert);
// //L2 is a new line that goes downwards from p2.
// L2 = Line( Point(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord), Point(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord -1), owner: currentUser, lineDirection: LineDirection.Vert);
// //L3 is a new line that goes below new line in the same direction as newLine.
// L3 = Line( Point(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord-1), Point(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord-1), owner: currentUser, lineDirection: LineDirection.Horiz);

// //check if L1, L2 and L3 are in the list of allLines: then we have a square with owner as current user.

// if(allLines.contains(L1) && allLines.contains(L2) && allLines.contains(L3)){
//     //we have a square
//     //create a square object and add it to the list of squares owned by the current user.
//     Square s1 = Square(L1, L2, L3, newLine);
//     currentUser.addSquares(s1);
//     //increment the score of the current user.
//     currentUser.incrementScore();
//     //check if the game is over or not:
//     if(GameCanvas.movesLeft == 0){
//         //game is over
//         //show an alert dialogue box with the title ‘You Won’ and content as the score of the current user and the opponent.
//         //show a button to navigate to the home screen.
//     }
// }

// break;

// Now its time to check if the line is vertical then we will check the squares on the left and right side of the newLine:
// case LineDirection.Vert:
// //check for left and right square:
// //Left Square:
// //L1 is a new line that goes left from p1.
// Line L1 = Line( Point(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord), Point(xCord: newLine.firstPoint.xCord-1, yCord: newLine.firstPoint.yCord), owner: currentUser, lineDirection: LineDirection.Horiz);
// //L2 is a new line that goes left from p2.
// Line L2 = Line( Point(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord), Point(xCord: newLine.secondPoint.xCord-1, yCord: newLine.secondPoint.yCord), owner: currentUser, lineDirection: LineDirection.Horiz);
// //L3 is a new line that goes left of new line in the same direction as newLine.
// Line L3 = Line( Point(xCord: newLine.firstPoint.xCord-1, yCord: newLine.firstPoint.yCord), Point(xCord: newLine.secondPoint.xCord-1, yCord: newLine.secondPoint.yCord), owner: currentUser, lineDirection: LineDirection.Vert);

// //check if L1, L2 and L3 are in the list of allLines: then we have a square with owner as current user.

// if(allLines.contains(L1) && allLines.contains(L2) && allLines.contains(L3)){
//     //we have a square
//     //create a square object and add it to the list of squares owned by the current user.
//     Square s1 = Square(L1, L2, L3, newLine);
//     currentUser.addSquares(s1);
//     //increment the score of the current user.
//     currentUser.incrementScore();
//     //check if the game is over or not:
//     if(GameCanvas.movesLeft == 0){
//         //game is over
//         //show an alert dialogue box with the title ‘You Won’ and content as the score of the current user and the opponent.
//         //show a button to navigate to the home screen.
//     }
// }

// 	After checking for the square above, we are going to check for the square on the right side of 	the newLine in 	the same manner as above
// //Right Square:
// //L1 is a new line that goes right from p1.
// L1 = Line( Point(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord), Point(xCord: newLine.firstPoint.xCord+1, yCord: newLine.firstPoint.yCord), owner: currentUser, lineDirection: LineDirection.Horiz);
// //L2 is a new line that goes right from p2.
// L2 = Line( Point(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord), Point(xCord: newLine.secondPoint.xCord+1, yCord: newLine.secondPoint.yCord), owner: currentUser, lineDirection: LineDirection.Horiz);
// //L3 is a new line that goes right of new line in the same direction as newLine.
// L3 = Line( Point(xCord: newLine.firstPoint.xCord+1, yCord: newLine.firstPoint.yCord), Point(xCord: newLine.secondPoint.xCord+1, yCord: newLine.secondPoint.yCord), owner: currentUser, lineDirection: LineDirection.Vert);

// //check if L1, L2 and L3 are in the list of allLines: then we have a square with owner as current user.

// if(allLines.contains(L1) && allLines.contains(L2) && allLines.contains(L3)){
//     //we have a square
//     //create a square object and add it to the list of squares owned by the current user.
//     Square s1 = Square(L1, L2, L3, newLine);
//     currentUser.addSquares(s1);
//     //increment the score of the current user.
//     currentUser.incrementScore();
//     //check if the game is over or not:
//     if(GameCanvas.movesLeft == 0){
//         //game is over
//         //show an alert dialogue box with the title ‘You Won’ and content as the score of the current user and the opponent.
//         //show a button to navigate to the home screen.
//     }
// }

// break;
// }
// }

// //Using all the above knowledge about the game, we are now ready to deploy the Phase 1 of the app the Phase 1 of the app when fully deployed should have the following features:
// + All the Classes defined, the functions to control the game and the UI part is going to reside in the main.dart
// + The should be directly executable and the game should be playable just by me for now as described in the Phase 1 initial details.
// Now here is what I want you to do: without going into the details of the entire game implementation, I want you to only write down a large list of commented-todos that will make this main.dart fully functional.

// // TODO: Import necessary Flutter packages.
// Here are all the essential packages that I have downloaded:
//   cupertino_icons: ^1.0.2
//   provider: ^6.0.5
//   firebase_core: ^2.15.1
//   firebase_auth: ^4.8.0
//   firebase_database: ^10.2.5
//   fluttertoast: ^8.2.2
//   flutter_dialogs: ^3.0.0
//   animations: ^2.0.7

// TODO: Define the Points class with xCord, yCord, isMarked, isDisabled, and isSelected properties.
class Points {
  int xCord;
  int yCord;
  bool isMarked; //used to mark the point as bold if already used
  bool isDisabled; //used to avoid selection if point is connected in all four directions
  bool isSelected; //use to mark the point even bolder. When drawing a line
  Points(
      {required this.xCord,
      required this.yCord,
      this.isSelected = false,
      this.isDisabled = false,
      this.isMarked = false});
  @override
  //properly overload the == opertor for use like this: p1 == p2 shoudl return true if their respective xCord and yCord are equal
  //'Points.==' ('bool Function(Points)') isn't a valid override of 'Object.==' ('bool Function(Object)').dartinvalid_override
  bool operator ==(Object other) {
    if (other is Points) {
      return this.xCord == other.xCord && this.yCord == other.yCord;
    }
    return false;
  }

  bool checkDisability(Points p1) {
    if (p1.isDisabled == true) {
      return true;
    }
    //find number of instances of p1 in pointsUsed
    if (pointsUsed.where((element) => element.xCord == p1.xCord && element.yCord == p1.yCord).length > 3) {
      return true;
    }
    return false;
  }
}

// TODO: Define the Lines class with firstPoint, secondPoint, owner, and lineDirection properties.

// TODO: Define the LineDirection enum.

// TODO: Define the Square class with L1Horiz, L2Horiz, L1Vert, and L2Vert properties.

// TODO: Define the GameCanvas class with numOfXPoints, numOfYPoints, isGameOver, and movesLeft properties.

// TODO: Define the GamePlayers class with isPlayer, score, numOfLives, linesDrawn, and squaresOwned properties.

// TODO: Create a list of Points objects called allPoints.

// TODO: Create an empty list of used Points objects called usedPoints.

// TODO: Create a function to createPoints based on rows and columns.

// TODO: Plot the Points on the screen based on their coordinates.

// TODO: Implement a Gesture Detector to handle line drawing.

// TODO: Check if the selected Point is disabled before drawing a line.

// TODO: Implement logic to check if the selected Point is nearby for line connection.

// TODO: Add connected Points to the usedPoints list.

// TODO: Create Line objects based on the direction of the line drawn.

// TODO: Add Line objects to the allLines list.

// TODO: Check for squares after drawing a line.

// TODO: Implement logic to check for upper and lower squares for horizontal lines.

// TODO: Implement logic to check for left and right squares for vertical lines.

// TODO: Create Square objects and add them to the squaresOwned list of the current user.

// TODO: Increment the score of the current user if a square is formed.

// TODO: Check if the game is over based on the number of moves left.

// TODO: Display an AlertDialog with game results if the game is over.

// TODO: Implement a function to handle navigation when the game is over.

// TODO: Add the main game loop and user interface.

// TODO: Display remaining moves, current scores, and opponent's information.

// TODO: Implement a function to decrement the life of a player if needed.

// TODO: Implement a function to update the UI based on game state.

// TODO: Create a function to handle back navigation and confirm quitting the game.

// TODO: Set up the initial game state, including creating Points and Lines.

// TODO: Implement Phase 1 testing with a stateful widget.

// TODO: Prepare for transitioning to Provider for state management in Phase 2.

// TODO: Ensure all the defined classes and methods are used correctly in the game logic.

// TODO: Make sure the UI elements and animations are smooth and visually appealing.

// TODO: Handle animations when a square is formed.

// TODO: Ensure that the game runs smoothly without any crashes or errors.

// TODO: Add comments and documentation to your code for clarity.

// TODO: Test the game thoroughly to identify and fix any issues or bugs.

// TODO: Prepare for Phase 2 by setting up Firebase integration for multiplayer support.
