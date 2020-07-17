import 'package:flutter/material.dart';
import 'game_board.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("TicTacToe")),
      body: new GameBoard(),
    );
  }
}
