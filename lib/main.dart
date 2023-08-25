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
  //Implement Point object in the form of circular container:
//In this step we will create a container widget which acts a  Point the styling is adjusted base on the properties of the point object which is passed to it.
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

  // TODO: Create a function to createPoints based on rows and columns.

  Widget createPoints(int rows, int colums) {
    //this functions returns the PointsUI objects in a grid view

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: rows * colums,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: rows,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              //if untoched then make it selected and vice versa
              if (allPoints[index].isUntouched == true) {
                setState(() {
                  allPoints[index].isUntouched = false;
                  allPoints[index].isSelected = true;
                });
              } else {
                setState(() {
                  allPoints[index].isUntouched = true;
                  allPoints[index].isSelected = false;
                });
              }
            },
            child: Container(
              //use a margin of 30 if the current index Point has property isSelected == true

              margin: (allPoints[index].isSelected == true) ? EdgeInsets.all(13) : EdgeInsets.all(15),
              child: PointUi(
                allPoints[index],
              ),
            ),
          );
        },
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
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  createPoints(5, 9),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
