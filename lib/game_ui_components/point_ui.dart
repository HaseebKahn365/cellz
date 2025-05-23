import 'package:flutter/material.dart';

import '../game_classes.dart';

Widget PointUi(Points P) {
  if (P.isDisabled == true) {
    return Container(
      margin: EdgeInsets.all(40),
      height: 40,
      color: Colors.deepPurple[100],
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple[400],
        ),
      ),
    );
  } else if (P.isMarked == true) {
    return Container(
      margin: EdgeInsets.all(40),
      height: 40,
      color: Colors.deepPurple[100],
      child: Container(
        margin: EdgeInsets.all(10),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple[500],
        ),
      ),
    );
  } else if (P.isSelected == true) {
    return Container(
      margin: EdgeInsets.all(40),
      height: 40,
      color: Colors.deepPurple[100],
      child: Container(
        margin: EdgeInsets.all(20),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple,
        ),
      ),
    );
  } else if (P.isUntouched == true) {
    return Container(
      margin: EdgeInsets.all(40),
      height: 40,
      color: Colors.deepPurple[100],
      child: Container(
        margin: EdgeInsets.all(20),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.deepPurple,
            width: 2.0,
          ),
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
