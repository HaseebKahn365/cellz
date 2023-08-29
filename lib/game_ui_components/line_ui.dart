import 'dart:math';

import 'package:cellz/game_classes.dart';
import 'package:flutter/material.dart';

import '../global_functions/create_line_checkSq.dart';
import '../lists_of_objects.dart';

//drawLines also uses a gridview to draw the lines but it works using the following logic:
Widget drawLines(int xCount, int yCount) {
  return Container(
    height: 300,
    color: Colors.amber.withOpacity(0.1),
    child: GridView.count(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      crossAxisCount: xCount,
      children: List.generate(allPoints.length, (index) {
        if (newLine != null) {
          if (allPoints[index] as Points == newLine?.firstPoint) {
            if (newLine?.lineDirection == LineDirection.Horiz) {
              //check for animating to the right or left:
              //animating to right: no transformation
              if (newLine!.firstPoint.xCord > newLine!.secondPoint.xCord) {
                print('Trying to draw line to left');
                //animate to left (transform 180 degrees anticlockwise)

                return Transform.rotate(
                  angle: pi,
                  child: LinePainting(),
                );
              } else if (newLine!.firstPoint.xCord < newLine!.secondPoint.xCord) {
                print('Trying to draw line to right');
                //animate to right (transform 0 degrees)
                return Transform.rotate(
                  angle: 0,
                  child: LinePainting(),
                );
              }
            } else if (newLine?.lineDirection == LineDirection.Vert) {
              print('Trying to draw vertical line');
              if (newLine!.firstPoint.yCord > newLine!.secondPoint.yCord) {
                print('Trying to draw line to top');
                //animate to top (transform 90 degrees)
                return Transform.rotate(
                  angle: 3 * pi / 2,
                  child: LinePainting(),
                );
              } else if (newLine!.firstPoint.yCord < newLine!.secondPoint.yCord) {
                print('Trying to draw line to bottom');
                //animate to bottom (transform -90 degrees)
                return Transform.rotate(
                  angle: pi / 2,
                  child: LinePainting(),
                );
              }
            }
          }
        }
        // Return an empty Container when no condition is met.
        return Container();
      }),
    ),
  );
}

class LinePainting extends StatefulWidget {
  const LinePainting({Key? key}) : super(key: key);

  @override
  State<LinePainting> createState() => _LinePaintingState();
}

class _LinePaintingState extends State<LinePainting> {
  bool isLineCreated = false;

  @override
  void initState() {
    super.initState();

    // Trigger the animation after a delay (e.g., 2 seconds)
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        isLineCreated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
          alignment: Alignment.centerLeft,
          height: isLineCreated ? 20 : 20,
          width: isLineCreated ? 140 : 10,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}

//we will create a new stateful widget called LinesUI where the old lines will not be animated but the new lines will be animated

//Container(
      //   color: Colors.red[100],
      //   height: 30,
      //   width: 160,
      //   //rotate anticlockwise by 90 degrees
      //   //transform: Matrix4.rotationZ(-pi / 2),
      //   child:
      //       //create a stack inside the sizedBox
      //       Stack(
      //     children: [
      //       //create an animated container inside the stack
      //       Positioned(
      //         //set the alignment of the animated container to center left
      //         left: 0,
      //         top: 5,
      //         //return this animated container in case if the Lines object has isNew == true

      //         child: AnimatedContainer(
      //           //set the duration of the animation
      //           duration: Duration(milliseconds: 500),
      //           //set the height and width of the animated container
      //           curve: Curves.decelerate,
      //           alignment: Alignment.centerLeft,
      //           height: isLineCreated ? 20 : 20,
      //           width: isLineCreated ? 160 : 10,
      //           //set the color of the animated container
      //           decoration: BoxDecoration(
      //             color: Colors.deepPurple,
      //             borderRadius: BorderRadius.circular(10),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),