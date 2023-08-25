import 'package:flutter/material.dart';

//create an instance of currentUser:
final currentUser = GamePlayers(isPlayer: true, score: 0, numOfLives: 4, linesDrawn: [], squaresOwned: []);
//create two instances of Points for testing purposes:
final p1 = Points(xCord: 1, yCord: 1);
final p2 = Points(xCord: 1, yCord: 2);

List<Lines> allLines = [];

//global list of pointsUsed
List<Points> pointsUsed = [];
Lines? createLine(Points p1, Points p2) {
  if ((p2.xCord == p1.xCord + 1) || (p2.xCord == p1.xCord - 1)) {
    return Lines(firstPoint: p1, secondPoint: p2, lineDirection: LineDirection.Horiz, owner: currentUser);
  } else if ((p2.yCord == p1.yCord + 1) || (p2.yCord == p1.yCord - 1)) {
    return Lines(firstPoint: p1, secondPoint: p2, lineDirection: LineDirection.Vert, owner: currentUser);
  } else {
    return null;
  }
}

final newLine = createLine(p1, p2);

checkSquare(Lines newLine) {
  allLines.add(newLine);
  switch (newLine.lineDirection) {
    case LineDirection.Horiz:
      Lines L1 = Lines(
          firstPoint: Points(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord),
          secondPoint: Points(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord + 1),
          owner: currentUser,
          lineDirection: LineDirection.Vert);

      Lines L2 = Lines(
          firstPoint: Points(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord),
          secondPoint: Points(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord + 1),
          owner: currentUser,
          lineDirection: LineDirection.Vert);

      Lines L3 = Lines(
          firstPoint: Points(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord + 1),
          secondPoint: Points(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord + 1),
          owner: currentUser,
          lineDirection: LineDirection.Horiz);

      if (allLines.contains(L1) && allLines.contains(L2) && allLines.contains(L3)) {
        Square s1 = Square(L1Horiz: newLine, L2Horiz: L3, L1Vert: L1, L2Vert: L2);
        currentUser.addSquares(s1);

        currentUser.incrementScore();

        if (GameCanvas.movesLeft == 0) {}
      }

      L1 = Lines(
          firstPoint: Points(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord),
          secondPoint: Points(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord - 1),
          owner: currentUser,
          lineDirection: LineDirection.Vert);

      L2 = Lines(
          firstPoint: Points(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord),
          secondPoint: Points(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord - 1),
          owner: currentUser,
          lineDirection: LineDirection.Vert);

      L3 = Lines(
          firstPoint: Points(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord - 1),
          secondPoint: Points(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord - 1),
          owner: currentUser,
          lineDirection: LineDirection.Horiz);

      if (allLines.contains(L1) && allLines.contains(L2) && allLines.contains(L3)) {
        Square s1 = Square(L1Horiz: newLine, L2Horiz: L3, L1Vert: L1, L2Vert: L2);
        currentUser.addSquares(s1);

        currentUser.incrementScore();

        if (GameCanvas.movesLeft == 0) {}
      }

      break;

    case LineDirection.Vert:
      Lines L1 = Lines(
          firstPoint: Points(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord),
          secondPoint: Points(xCord: newLine.firstPoint.xCord - 1, yCord: newLine.firstPoint.yCord),
          owner: currentUser,
          lineDirection: LineDirection.Horiz);

      Lines L2 = Lines(
          firstPoint: Points(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord),
          secondPoint: Points(xCord: newLine.secondPoint.xCord - 1, yCord: newLine.secondPoint.yCord),
          owner: currentUser,
          lineDirection: LineDirection.Horiz);

      Lines L3 = Lines(
          firstPoint: Points(xCord: newLine.firstPoint.xCord - 1, yCord: newLine.firstPoint.yCord),
          secondPoint: Points(xCord: newLine.secondPoint.xCord - 1, yCord: newLine.secondPoint.yCord),
          owner: currentUser,
          lineDirection: LineDirection.Vert);

      if (allLines.contains(L1) && allLines.contains(L2) && allLines.contains(L3)) {
        Square s1 = Square(L1Horiz: L1, L2Horiz: L2, L1Vert: newLine, L2Vert: L3);
        currentUser.addSquares(s1);

        currentUser.incrementScore();

        if (GameCanvas.movesLeft == 0) {}
      }

      //After checking for the square above, we are going to check for the square on the right side of 	the newLine in 	the same manner as above

      L1 = Lines(
          firstPoint: Points(xCord: newLine.firstPoint.xCord, yCord: newLine.firstPoint.yCord),
          secondPoint: Points(xCord: newLine.firstPoint.xCord + 1, yCord: newLine.firstPoint.yCord),
          owner: currentUser,
          lineDirection: LineDirection.Horiz);

      L2 = Lines(
          firstPoint: Points(xCord: newLine.secondPoint.xCord, yCord: newLine.secondPoint.yCord),
          secondPoint: Points(xCord: newLine.secondPoint.xCord + 1, yCord: newLine.secondPoint.yCord),
          owner: currentUser,
          lineDirection: LineDirection.Horiz);

      L3 = Lines(
          firstPoint: Points(xCord: newLine.firstPoint.xCord + 1, yCord: newLine.firstPoint.yCord),
          secondPoint: Points(xCord: newLine.secondPoint.xCord + 1, yCord: newLine.secondPoint.yCord),
          owner: currentUser,
          lineDirection: LineDirection.Vert);

      if (allLines.contains(L1) && allLines.contains(L2) && allLines.contains(L3)) {
        Square s1 = Square(L1Horiz: L1, L2Horiz: L2, L1Vert: newLine, L2Vert: L3);
        currentUser.addSquares(s1);

        currentUser.incrementScore();

        if (GameCanvas.movesLeft == 0) {}
      }

      break;
  }
}

// + All the Classes defined, the functions to control the game and the UI part is going to reside in the main.dart
// + The should be directly executable and the game should be playable just by me for now as described in the Phase 1 initial details.
// Now here is what I want you to do: without going into the details of the entire game implementation, I want you to only write down a large list of commented-todos that will make this main.dart fully functional.

// TODO: Define the Points class with xCord, yCord, isMarked, isDisabled, and isSelected properties.
class Points {
  int xCord;
  int yCord;
  bool isUntouched; //used to mark the point as outlined container
  bool isMarked; //used to mark the point as bold if already used
  bool isDisabled; //used to avoid selection if point is connected in all four directions
  bool isSelected; //use to mark the point even bolder. When drawing a line
  Points(
      {required this.xCord,
      required this.yCord,
      this.isUntouched = true,
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

  static bool checkDisability(Points p1) {
    if (p1.isDisabled == true) {
      return true;
    }
    //find number of instances of p1 in pointsUsed
    if (pointsUsed.where((element) => element.xCord == p1.xCord && element.yCord == p1.yCord).length > 3) {
      return true;
    }
    return false;
  }

  static bool checkNearby(Points p1, Points p2) {
    if (p1.xCord == p2.xCord && p1.yCord == p2.yCord) {
      return false;
    }
    if (p1.xCord == p2.xCord && p1.yCord == p2.yCord + 1) {
      return true;
    }
    if (p1.xCord == p2.xCord && p1.yCord == p2.yCord - 1) {
      return true;
    }
    if (p1.xCord == p2.xCord + 1 && p1.yCord == p2.yCord) {
      return true;
    }
    if (p1.xCord == p2.xCord - 1 && p1.yCord == p2.yCord) {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return 'Points(xCord: $xCord, yCord: $yCord, isMarked: $isMarked, isDisabled: $isDisabled, isSelected: $isSelected)';
  }

  @override
  int get hashCode => super.hashCode;
}

// TODO: Define the Lines class with firstPoint, secondPoint, owner, and lineDirection properties.

class Lines {
  Points firstPoint;
  Points secondPoint;
  GamePlayers owner;
  LineDirection lineDirection;
  Lines({required this.firstPoint, required this.secondPoint, required this.owner, required this.lineDirection});
  void animate(Lines providedLine) {
    //animates the provided Line ie. Line drawn by ai function
  }

  @override
  String toString() {
    return 'Lines(firstPoint: $firstPoint, secondPoint: $secondPoint, owner: $owner, lineDirection: $lineDirection)';
  }

  @override
  bool operator ==(Object other) {
    if (other is Lines) {
      return this.firstPoint == other.firstPoint && this.secondPoint == other.secondPoint;
    }
    return false;
  }

  @override
  int get hashCode => super.hashCode;
}

// TODO: Define the LineDirection enum.

enum LineDirection { Horiz, Vert }

// TODO: Define the Square class with L1Horiz, L2Horiz, L1Vert, and L2Vert properties.

class Square {
  Lines L1Horiz;
  Lines L2Horiz;
  Lines L1Vert;
  Lines L2Vert;
  Square({required this.L1Horiz, required this.L2Horiz, required this.L1Vert, required this.L2Vert});

  @override
  String toString() {
    return 'Square(L1Horiz: $L1Horiz, L2Horiz: $L2Horiz, L1Vert: $L1Vert, L2Vert: $L2Vert)';
  }

  @override
  bool operator ==(Object other) {
    if (other is Square) {
      return this.L1Horiz == other.L1Horiz &&
          this.L2Horiz == other.L2Horiz &&
          this.L1Vert == other.L1Vert &&
          this.L2Vert == other.L2Vert;
    }
    return false;
  }

  @override
  int get hashCode => super.hashCode;
}

// TODO: Define the GameCanvas class with numOfXPoints, numOfYPoints, isGameOver, and movesLeft properties.

class GameCanvas {
  int? numOfXPoints; // number of points on the x axis.
  int? numOfYPoints; // number of points on the y axis.
  static bool? isGameOver; // toCheck if the game is over or not
  static int? movesLeft;
  void calculateMovesLeft(int i /*numOfXPoints*/, int j /*numOfYPoints*/) {
    GameCanvas.movesLeft = (i - 1) * j + (j - 1) * i;
  }

  @override
  String toString() {
    return 'GameCanvas(numOfXPoints: $numOfXPoints, numOfYPoints: $numOfYPoints, isGameOver: $isGameOver, movesLeft: $movesLeft)';
  }
}

// TODO: Define the GamePlayers class with isPlayer, score, numOfLives, linesDrawn, and squaresOwned properties.

class GamePlayers {
  bool isPlayer = false;
  int score = 0;
  int numOfLives = 4;
  List<Lines> linesDrawn = [];
  List<Square> squaresOwned = [];
  //Constructor to instantiate the values:
  GamePlayers(
      {required this.isPlayer,
      required this.score,
      required this.numOfLives,
      required this.linesDrawn,
      required this.squaresOwned});

  void incrementScore() {
    //increments the score as user completes a square/squares
    this.score++;
  }

  void loseLife() {
    //this.life--;
    this.numOfLives = this.numOfLives - 1;
  }

  void addSquares(Square s1) {
    squaresOwned.add(s1);
  }

  @override
  String toString() {
    return 'GamePlayers(isPlayer: $isPlayer, score: $score, numOfLives: $numOfLives, linesDrawn: $linesDrawn, squaresOwned: $squaresOwned)';
  }
}

// TODO: Create a list of Points objects called allPoints.
List allPoints = <Points>[];

// TODO: Create an empty list of used Points objects called usedPoints.
List usedPoints = <Points>[];

void main() {
  //used a nested loop to create  5x5 points and add them to the allPoints list
  for (var i = 0; i < 10; i++) {
    //creates xCord attributes of points objects
    for (var j = 0; j < 10; j++) {
      //creates yCord attributes of points objects
      allPoints.add(Points(xCord: i, yCord: j));
    }
  }
  runApp(cellzGame());
}

class cellzGame extends StatefulWidget {
  const cellzGame({Key? key}) : super(key: key);

  @override
  _cellzGameState createState() => _cellzGameState();
}

class _cellzGameState extends State<cellzGame> {
  //Implement Point object in the form of circular container:
//In this step we will create a container widget which acts a  Point the styling is adjusted base on the properties of the point object which is passed to it.
  Widget PointUi(Points P) {
    if (P.isDisabled == true) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple[400],
        ),
      );
    } else if (P.isSelected == true) {
      return Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple[500],
        ),
      );
    } else if (P.isMarked == true) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple,
        ),
      );
    } else if (P.isUntouched == true) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.deepPurple,
            width: 2.0,
          ),
        ),
      );
    } else {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.deepPurple,
            width: 4.0,
          ),
        ),
      );
    }
  }

  // TODO: Create a function to createPoints based on rows and columns.

  Widget createPoints(int rows, int colums) {
    //this functions returns the PointsUI objects in a grid view

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: rows * colums,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: rows,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              //if untoched then make it selected and vice versa
              if (allPoints[index].isUntouched == true) {
                setState(() {
                  allPoints[index].isUntouched = false;
                  allPoints[index].isSelected = true;
                });
              } else {
                setState(() {
                  allPoints[index].isUntouched = true;
                  allPoints[index].isSelected = false;
                });
              }
            },
            child: Container(
              //use a margin of 30 if the current index Point has property isSelected == true

              margin: (allPoints[index].isSelected == true) ? EdgeInsets.all(13) : EdgeInsets.all(15),
              child: PointUi(
                allPoints[index],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //set theme color to deep purple
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Cellz Game', style: TextStyle(color: Colors.white)),
        ),
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  createPoints(5, 9),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
