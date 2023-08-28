import 'package:cellz/global_functions/create_line_checkSq.dart';
import 'package:flutter/material.dart';

import 'game_classes.dart';
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

  //create dot from the allPoints list and use PainUI to create the UI
  //use a stack so that the lines will appear below the dots. the lines will have their own ridview

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
                if (!offsetAnalyzer(newLineOffset[0], newLineOffset[1], allPoints[index] as Points)) {
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

//we need a stack inside a sizedBox and inside a stack there is an animated container. this animated container is positioned at the center left of the stack inside the sizedBox
