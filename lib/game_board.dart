import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSquare(0, 0),
          _buildSquare(0, 1),
          _buildSquare(0, 2),
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSquare(1, 0),
          _buildSquare(1, 1),
          _buildSquare(1, 2),
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSquare(2, 0),
          _buildSquare(2, 1),
          _buildSquare(2, 2),
        ],
      ),
    ]));
  }

  _buildSquare(int i, int j) {
    // bool topleft = i == 0 || j == 0;
    // bool middleleft = i == 1 || j == 0;
    // bool bottomleft = i == 2 || j == 0;
    // bool topmiddle = i == 0 || j == 1;
    //bool middlemiddle = i == 1 || j == 1;
    // bool bottommiddle = i == 2 || j == 1;
    // bool topright = i == 0 || j == 2;
    //bool middleright = i == 1 || j == 2;
    // bool bottomright = i == 2 || j == 2;
    return Container(
        width: 100,
        height: 100,
        child: Center(child: Text('X', style: TextStyle(fontSize: 92))));
  }
}
