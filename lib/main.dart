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
            ],
          )
        ]),
      ),
    );
  }
}

//