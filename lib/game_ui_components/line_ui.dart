import 'package:flutter/material.dart';

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
