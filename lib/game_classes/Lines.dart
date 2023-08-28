import '../game_classes.dart';

class Lines {
  Points firstPoint;
  Points secondPoint;
  GamePlayers owner;
  LineDirection lineDirection;
  bool isNew;
  Lines(
      {required this.firstPoint,
      required this.secondPoint,
      required this.owner,
      required this.lineDirection,
      this.isNew = false});
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

enum LineDirection { Horiz, Vert }
