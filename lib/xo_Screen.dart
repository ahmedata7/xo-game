import 'package:flutter/material.dart';
import 'package:xo/gameheader.dart';
import 'package:xo/loginScreen.dart';
import 'package:xo/xo_buttom.dart';

class xoGame extends StatefulWidget {
  static const String routeName = "xoHome";

  @override
  State<xoGame> createState() => _xoGameState();
}

class _xoGameState extends State<xoGame> {
  List<String> gameBoard =
  [
    "", "", "",
    "", "", "",
    "", "", "",
  ];
  int score1 = 0;
  int score2 = 0;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as gameArgs;
    String p1Name = args.player1Name;
    String p2Name = args.player2Name;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Are u ready for X0",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    gameHeader("$p1Name (X)"),
                    gameHeader("Score => ($score1)"),
                  ],
                ),
                Column(
                  children: [
                    gameHeader("$p2Name (O)"),
                    gameHeader("Score => ($score2)"),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: xoButton(gameBoard[0], 0, onPlayerClick)),
                Expanded(child: xoButton(gameBoard[1], 1, onPlayerClick)),
                Expanded(child: xoButton(gameBoard[2], 2, onPlayerClick)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: xoButton(gameBoard[3], 3, onPlayerClick)),
                Expanded(child: xoButton(gameBoard[4], 4, onPlayerClick)),
                Expanded(child: xoButton(gameBoard[5], 5, onPlayerClick)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: xoButton(gameBoard[6], 6, onPlayerClick)),
                Expanded(child: xoButton(gameBoard[7], 7, onPlayerClick)),
                Expanded(child: xoButton(gameBoard[8], 8, onPlayerClick)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onPlayerClick(int index) {
    if (gameBoard[index].isNotEmpty) return;
    if (counter % 2 == 0) {
      gameBoard[index] = "X";
    } else {
      gameBoard[index] = "O";
    }
    counter++;
    if (checkWinner("X")) {
      score1 += 5;
      resetBoard();
      counter = 0;
    } else if (checkWinner("O")) {
      score2 += 5;
      resetBoard();
      counter = 1;
    } else if (counter == 9) {
      resetBoard();
      if(score1>score2 || score1 == score2){
        counter = 0;
      }else{
        counter = 1;
      }
    }
    setState(() {});
  }

  bool checkWinner(symbolPlayer) {
    for (int i = 0; i < 9; i += 3) {
      if (gameBoard[i] == symbolPlayer &&
          gameBoard[i + 1] == symbolPlayer &&
          gameBoard[i + 2] == symbolPlayer) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (gameBoard[i] == symbolPlayer &&
          gameBoard[i + 3] == symbolPlayer &&
          gameBoard[i + 6] == symbolPlayer) {
        return true;
      }
    }
    if (gameBoard[0] == symbolPlayer &&
        gameBoard[4] == symbolPlayer &&
        gameBoard[8] == symbolPlayer) {
      return true;
    } else if (gameBoard[2] == symbolPlayer &&
        gameBoard[4] == symbolPlayer &&
        gameBoard[6] == symbolPlayer) {
      return true;
    }
    return false;
  }

  void resetBoard() {
    gameBoard =
    [
      "", "", "",
      "", "", "",
      "", "", "",
    ];
  }
}
