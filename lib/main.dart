// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:cellz/global_functions/create_line_checkSq.dart';
import 'package:flutter/material.dart';

import 'game_classes.dart';
import 'game_ui_components/line_ui.dart';
import 'game_ui_components/point_ui.dart';
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
  bool isLineCreated = false;

  @override
  void initState() {
    super.initState();

    // Trigger the animation after a delay (e.g., 2 seconds)
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLineCreated = true;
      });
    });
  }
  //create dot from the allPoints list and use PainUI to create the UI
  //use a stack so that the lines will appear below the dots. the lines will have their own ridview

  Widget createPoints(int xCount, int yCount) {
    return Container(
      height: 300,
      color: Colors.red.withOpacity(0),
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

                //allPoints[index].isSelected = true;
                //this function will check if the line drawn is valid or not.
                //the offset ANALYZER function will return true if in case if it is trying to return null
                if (!(offsetAnalyzer(newLineOffset[0], newLineOffset[1], allPoints[index] as Points) == null)) {
                  print('Invalid Line');
                  //make the point unselected
                  allPoints[index].isSelected = false;
                }
              });
            },
            child: PointUi(
              allPoints[index],
            ),
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
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //we should create a stack here so that the lines will appear below the dots

          //create a gridview inside the stack
          Stack(
            // Set the index of the widget you want to show
            children: [
              drawLines(2, 2), // Index 1
              createPoints(2, 2), // Index 0
              /*To draw the lines we first will have to create a container with a stack widget below the points gridview. Then using the stack we will create two more stacks each of which will contain two linear progress indicators, one is horizontal and the other is vertical. The first stack will be wrapped in an Allign widget which will be allrignd to the top left corner.  Just like as follows:
Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Stack(
                children: [Align(
                    alignment: AlignmentDirectional(-1, -1),
The second stack widget will be also layed out in the similar fashion but it will the in the bottom left corner. The two stacks combined will have 4 linear progress indictors which altogether forms four lines. Each of the linear progress indicator should be animated.
we first have to test this widget. To check out it the layout is proper:
 */
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.red[100],
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, -1),
                            child:
                                //i want the stack here containing two linea progress indicators for representing lines
                                Stack(
                              children: [
                                //i want to see the animation from top right to top left please rotate the AnimatedLinearProgressIndicator by 180 degrees anticlockwise
                                Transform.rotate(
                                  child: AnimatedLinearProgressIndicator(),
                                  angle: 180 * 3.14 / 180,
                                ), //animating from top left to top right corner
                                //create another one but tranfrom it by 90 degrees clockwise and also align it to the right corner of the container
                                Transform.rotate(
                                  angle: 90 * 3.14 / 180,
                                  child: Align(
                                    alignment: AlignmentDirectional(1, 1),
                                    child: AnimatedLinearProgressIndicator(), //from top left to bottom left corner
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //create another stack here container two linear progress indicators for representing lines but the should 180 degrees anticlockwise and also align it to the right corner of the container

                          Transform.rotate(
                            angle: 180 * 3.14 / 180,
                            child: Align(
                              alignment: AlignmentDirectional(-1, -1),
                              child:
                                  //i want the stack here containing two linea progress indicators for representing lines
                                  Stack(
                                children: [
                                  AnimatedLinearProgressIndicator(),
                                  //create another one but tranfrom it by 90 degrees clockwise and also align it to the right corner of the container
                                  Transform.rotate(
                                    angle: 90 * 3.14 / 180,
                                    child: Align(
                                      alignment: AlignmentDirectional(1, 1),
                                      child: AnimatedLinearProgressIndicator(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

// a smooth progress indicator
class AnimatedLinearProgressIndicator extends StatefulWidget {
  const AnimatedLinearProgressIndicator({Key? key}) : super(key: key);

  @override
  _AnimatedLinearProgressIndicatorState createState() => _AnimatedLinearProgressIndicatorState();
}

class _AnimatedLinearProgressIndicatorState extends State<AnimatedLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _colorTween =
        ColorTween(begin: Colors.deepPurpleAccent[100], end: Colors.deepPurpleAccent).animate(_animationController);
    _animationController.forward();
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {}
      if (_animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.white,
      valueColor: _colorTween,
      minHeight: 10,
      value: _animationController.value,
    );
  }
}
