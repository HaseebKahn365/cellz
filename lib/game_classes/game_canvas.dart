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
