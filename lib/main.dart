import 'package:flutter/material.dart';
import 'game_classes.dart';
import 'lists_of_objects.dart';

void main() {
  //used a nested loop to create  5x5 points and add them to the allPoints list
  for (var i = 0; i < 10; i++) {
    //creates xCord attributes of points objects
    for (var j = 0; j < 10; j++) {
      //creates yCord attributes of points objects
      allPoints.add(Points(xCord: i, yCord: j));
    }
  }
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
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple[400],
        ),
      );
    } else if (P.isSelected == true) {
      return Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple[500],
        ),
      );
    } else if (P.isMarked == true) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple,
        ),
      );
    } else if (P.isUntouched == true) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.deepPurple,
            width: 2.0,
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
        // appBar: AppBar(
        //   backgroundColor: Colors.deepPurple,
        //   title: Text('Cellz Game', style: TextStyle(color: Colors.white)),
        // ),
        body: Center(
          child: GestureDetector(
            onPanStart: (details) {
              final renderObject = context.findRenderObject() as RenderBox;
              final localPosition = renderObject.globalToLocal(details.globalPosition);
              //  print('globalPositions ${localPosition}');
              setState(() {
                newLineOffset[0] = (localPosition);
              });
            },
            onPanUpdate: (details) {
              final renderObject = context.findRenderObject() as RenderBox;
              final localPosition = renderObject.globalToLocal(details.globalPosition);
              // print(localPosition);
              setState(() {
                newLineOffset[1] = (localPosition);
              });
            },
            onPanEnd: (details) {
              setState(() {
                newLineOffset[2] = (Offset(0, 0));
              });
            },
            child: CustomPaint(
              painter: LinePainter(newLineOffset, Colors.deepPurple),
              size: Size.infinite,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  LinePainter(this.points, this.color);
  final List<Offset> points;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(points[0], points[1], paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
