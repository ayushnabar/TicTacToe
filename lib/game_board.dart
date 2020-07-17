import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
    return Container(
        width: 60, height: 60, child: Center(child: Text('hello')));
  }
}
