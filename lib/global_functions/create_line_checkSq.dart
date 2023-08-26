import '../game_classes.dart';
import '../lists_of_objects.dart';

//create an instance of currentUser:
final currentUser = GamePlayers(isPlayer: true, score: 0, numOfLives: 4, linesDrawn: [], squaresOwned: []);
//create two instances of Points for testing purposes:
var p1 = Points(xCord: 1, yCord: 1);
var p2 = Points(xCord: 1, yCord: 2);

//global list of pointsUsed

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
