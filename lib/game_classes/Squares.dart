import 'Lines.dart';

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
