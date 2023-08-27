import '../lists_of_objects.dart';
import 'Points.dart';

class GameCanvas {
  int? numOfXPoints; // number of points on the x axis.
  int? numOfYPoints; // number of points on the y axis.
  static bool? isGameOver; // toCheck if the game is over or not
  static int? movesLeft;
  void calculateMovesLeft(int i /*numOfXPoints*/, int j /*numOfYPoints*/) {
    GameCanvas.movesLeft = (i - 1) * j + (j - 1) * i;
  }

  static void createDots(int xCount, int yCount) {
    for (int i = 0; i < xCount; i++) {
      for (int j = 0; j < yCount; j++) {
        allPoints
            .add(Points(xCord: i, yCord: j)); //i am using the reverse formate because this is how the grid is drawn
      }
    }
  }

  GameCanvas({this.numOfXPoints, this.numOfYPoints});

  @override
  String toString() {
    return 'GameCanvas(numOfXPoints: $numOfXPoints, numOfYPoints: $numOfYPoints, isGameOver: $isGameOver, movesLeft: $movesLeft)';
  }
}
