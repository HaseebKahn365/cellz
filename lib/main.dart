import 'dart:math';

import 'package:cellz/global_functions/create_line_checkSq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'game_classes.dart';
import 'lists_of_objects.dart';

void main() {
  //create a GameCanvas instance;
  final currentGame = GameCanvas(numOfXPoints: 2, numOfYPoints: 2);
  currentGame.calculateMovesLeft(2, 2);
  print(GameCanvas.movesLeft);
  GameCanvas.createDots(2, 2);

  runApp(cellzGame());
}

class cellzGame extends StatefulWidget {
  const cellzGame({Key? key}) : super(key: key);

  @override
  _cellzGameState createState() => _cellzGameState();
}

class _cellzGameState extends State<cellzGame> {
  // Initialize newLineOffset with Offset.zero for all three elements
  var newLineOffset = List<Offset>.filled(3, Offset.zero);

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

  //create dot from the allPoints list and use PainUI to create the UI

  Widget createPoints(int xCount, int yCount) {
    return Container(
      height: 300,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        crossAxisCount: xCount,
        children: List.generate(allPoints.length, (index) {
          return GestureDetector(
            onPanStart: (details) {
              // final renderObject = context.findRenderObject() as RenderBox;
              // final localPosition = renderObject.globalToLocal(details.globalPosition);
              //  print('globalPositions ${localPosition}');

              setState(() {
                newLineOffset[0] = (details.globalPosition);
                allPoints[index].isSelected = true;

                print('You started at point: ${allPoints[index]}');
              });
            },
            onPanUpdate: (details) {
              // final renderObject = context.findRenderObject() as RenderBox;
              // final localPosition = renderObject.globalToLocal(details.globalPosition);
              // print(localPosition);
              setState(() {
                newLineOffset[1] = (details.globalPosition);
              });
            },
            onPanEnd: (details) {
              setState(() {
                //print the offsets inside the newLineoffset List
                print(newLineOffset);

                allPoints[index].isSelected = true;
                //this function will check if the line drawn is valid or not.
                offsetAnalyzer(newLineOffset[0], newLineOffset[1], allPoints[index] as Points);
              });
            },
            child: Stack(children: [
              Positioned(
                child: LineAnimation(),
              ),
              PointUi(
                allPoints[index],
              ),
            ]),
          );
        }),
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
        body: Center(
          child: Column(children: [
            createPoints(2, 2),
            //animate the container horzontally from left to right: intially it is width: 10, height: 10 then it will be width: 200, height: 10
          ]),
        ),
      ),
    );
  }
}

offsetAnalyzer(Offset P1, Offset Q1, Points currentPoint) {
  //first we need to find the difference between the x-coordinate and y-coordinate of the two offsets
  //minimum offset coordinate difference is 120
  //Lets say we have two points P1(x1,y1) and Q1(x2,y2) as two offsets. Then find the difference between x1 and x2 and y1 and y2
  final xDif = (Q1.dx - P1.dx);
  final yDif = (Q1.dy - P1.dy);
  //X-major (Horizontal) line
  if (xDif.abs() > yDif.abs() && xDif.abs() > 120) {
    //the Line could be in the right or left direction:
    //FOR RIGHT LINE:
    if (xDif > 120) {
      newLine = createLine(Points(xCord: currentPoint.xCord, yCord: currentPoint.yCord),
          Points(xCord: currentPoint.xCord + 1, yCord: currentPoint.yCord));
      print('Horizontal Right created: $newLine');
    }
    //FOR LEFT LINE:
    else if (xDif < -120 && xDif.abs() > 120) {
      newLine = createLine(
        Points(xCord: currentPoint.xCord, yCord: currentPoint.yCord),
        Points(xCord: currentPoint.xCord - 1, yCord: currentPoint.yCord),
      );
      print('Horizontal Left created: $newLine');
      //add the new line to the allLines list if it does not already exists there:
      if (!allLines.contains(newLine)) {
        allLines.add(newLine);
      }
    }
  }
  //Y-major (Vertical) line
  else if (yDif.abs() > xDif.abs() && yDif.abs() > 120) {
    //the Line could be in the up or down direction:
    //FOR Down LINE:
    //we need to be careful here because when we drag from top to bottom the offset.dy increases which means we have to create a newLine under the following conditions:
    if (yDif > 120) {
      newLine = createLine(Points(xCord: currentPoint.xCord, yCord: currentPoint.yCord),
          Points(xCord: currentPoint.xCord, yCord: currentPoint.yCord + 1));
      print('Vertical Down created: $newLine');

      //add the new line to the allLines list if it does not already exists there:
      if (!allLines.contains(newLine)) {
        allLines.add(newLine);
      }
    }
    //FOR UP LINE:
    else if (yDif < -120) {
      newLine = createLine(
        Points(xCord: currentPoint.xCord, yCord: currentPoint.yCord),
        Points(xCord: currentPoint.xCord, yCord: currentPoint.yCord - 1),
      );
      print('Vertical Up created: $newLine');
      //add the new line to the allLines list if it does not already exists there:
      if (!allLines.contains(newLine)) {
        allLines.add(newLine);
      }
    }
  }
}
//we need a stack inside a sizedBox and inside a stack there is an animated container. this animated container is positioned at the center left of the stack inside the sizedBox

class LineAnimation extends StatefulWidget {
  const LineAnimation({super.key});

  @override
  State<LineAnimation> createState() => _LineAnimationState();
}

class _LineAnimationState extends State<LineAnimation> {
  bool isLineCreated = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isLineCreated = !isLineCreated;
      }),
      child: Container(
        color: Colors.red[100],
        height: 30,
        width: 160,
        //rotate anticlockwise by 90 degrees
        //transform: Matrix4.rotationZ(-pi / 2),
        child:
            //create a stack inside the sizedBox
            Stack(
          children: [
            //create an animated container inside the stack
            Positioned(
              //set the alignment of the animated container to center left
              left: 0,
              top: 5,

              child: AnimatedContainer(
                //set the duration of the animation
                duration: Duration(milliseconds: 500),
                //set the height and width of the animated container
                curve: Curves.decelerate,
                alignment: Alignment.centerLeft,
                height: isLineCreated ? 20 : 20,
                width: isLineCreated ? 160 : 10,
                //set the color of the animated container
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
