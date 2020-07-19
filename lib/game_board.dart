import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<List> matrix;
  var player1;
  var player2;

  // constructor
  _GameBoardState() {
    _createMatrix();
  }

  _createMatrix() {
    player1 = 0;
    player2 = 0;
    matrix = List<List>(3);
    for (int i = 0; i < matrix.length; i++) {
      matrix[i] = List(3);
      for (int j = 0; j < matrix[0].length; j++) {
        matrix[i][j] = ' ';
      }
    }
  }

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

  String _lastChar = ' ';
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
    return GestureDetector(
        onTap: () {
          _changeBoard(i, j);
        },
        child: Container(
            width: 100,
            height: 100,
            child: Center(
                child: Text(matrix[i][j], style: TextStyle(fontSize: 92)))));
  }

  _changeBoard(int i, int j) {
    setState(() {
      if (matrix[i][j] == ' ') {
        if (_lastChar == 'O') {
          matrix[i][j] = 'X';
        } else {
          matrix[i][j] = 'O';
        }
        _lastChar = matrix[i][j];
      }
    });
  }
}
