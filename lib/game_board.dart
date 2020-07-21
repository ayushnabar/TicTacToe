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
    return Scaffold(
        body: Center(
            child: Column(children: [
      //Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: 100,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                "TicTacToe",
                textAlign: TextAlign.center,
              ))),
      Row(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
                //padding: const EdgeInsets.fromLTRB(70, 100, 160, 100),
                children: [
                  Container(
                      // left top right bottom
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 80),
                      child: Text(
                        "Player 1\n" + player1.toString(),
                        textAlign: TextAlign.center,
                      ))
                ]),
            Column(mainAxisAlignment: MainAxisAlignment.center,
                //padding: const EdgeInsets.fromLTRB(70, 100, 160, 100),
                children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(250, 0, 0, 80),
                      child: Text(
                        "Player 2\n" + player2.toString(),
                        textAlign: TextAlign.center,
                      ))
                ])
          ]),
        ],
      ),
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
    ])));
  }

  String _lastChar = ' ';
  _buildSquare(int i, int j) {
    return GestureDetector(
        onTap: () {
          _changeBoard(i, j);
          _checkWinner(i, j);
          _calculateScore(i, j);
        },
        child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.black)),
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

  _checkWinner(int i, int j) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    //bool boolean;
    var toCheckFor = matrix[i][j];
    var length = matrix.length;
    for (int count = 0; count < matrix.length; count++) {
      if (matrix[i][count] == toCheckFor) {
        row++;
      }
      if (matrix[count][j] == toCheckFor) {
        col++;
      }
      if (matrix[count][count] == toCheckFor) {
        diag++;
      }
      if (matrix[i][matrix.length - count - 1] == toCheckFor) {
        rdiag++;
      }
    }
    if (row == length || col == length || diag == length || rdiag == length) {
      if (toCheckFor == 'O') {
        _printWinner("Player X");
      } else if (toCheckFor == 'X') {
        _printWinner("Player O");
      }
    }
  }

  _calculateScore(int first, int second) {
    if (matrix[first][second] == 'O') {
      player1++;
    } else if (matrix[first][second] == 'X') {
      player2++;
    }
  }

  _printWinner(String winner) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text("$winner won"),
            actions: <Widget>[
              FlatButton(
                child: Text("Reset Game"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _createMatrix();
                  });
                },
              )
            ],
          );
        });
  }
}
