// ignore_for_file: null_check_always_fails, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tictactoe/box.dart';

class GameBoard extends StatefulWidget {
  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  bool _checkForWinner() {
    if ((_board[0] == _board[1] && _board[0] == _board[2] && _board[0] != "") ||
        (_board[3] == _board[4] && _board[3] == _board[5] && _board[3] != "") ||
        (_board[6] == _board[7] && _board[6] == _board[8] && _board[6] != "") ||
        (_board[0] == _board[3] && _board[0] == _board[6] && _board[0] != "") ||
        (_board[1] == _board[4] && _board[1] == _board[7] && _board[1] != "") ||
        (_board[2] == _board[5] && _board[2] == _board[8] && _board[2] != "") ||
        (_board[0] == _board[4] && _board[0] == _board[8] && _board[0] != "") ||
        (_board[2] == _board[4] && _board[2] == _board[6] && _board[2] != "")) {
      return true;
    } else {
      return false;
    }
  }

  // True = X
  // False = O
  // null = empty space (not yet selected) not x nor o
  final List<String> _board = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  bool turn = true;
  String playingState = "non";

  @override
  Widget build(BuildContext context) {
    void changeBox(int index) {
      if (_board[index] == "") {
        setState(() {
          _board[index] = (turn == true ? "X" : "O");
          turn = !turn;
        });
      }

      if (_checkForWinner()) {
        setState(() {
          playingState = "played";
          turn = !turn;
          print(turn);
        });
      } else if (!_board.contains("")) {
        playingState = "draw";
      }
    }

    void resetBoard() {
      for (int i = 0; i < 9; i++) {
        _board[i] = "";
      }
      turn = true;
    }

    Widget ControlAnddStatus() {
      if (playingState == "non") {
        return SizedBox(
          height: 75,
          width: 250,
          child: ElevatedButton(
              onHover: null,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(254, 191, 64, 1))),
              child: Text(
                "Start Game",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  playingState = "playing";
                });
              }),
        );
      } else if (playingState == "playing") {
        return Center(
          child: Text(
            (turn) ? "X's turn" : "O's turn",
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.w200),
          ),
        );
      } else if (playingState == "played") {
        return Column(
          children: [
            Text(
              (playingState == "playing")
                  ? ((turn) ? "X's turn" : "O's turn")
                  : (playingState == "draw")
                      ? "Draw..."
                      : "${(turn) ? "X" : "O"} WON!!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w200),
            ),
            ElevatedButton(
                onHover: null,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(254, 191, 64, 1))),
                child: Text(
                  "Play Again",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    playingState = "playing";
                    resetBoard();
                  });
                }),
          ],
        );
      } else if (playingState == "draw") {
        return Column(
          children: [
            Text(
              "Draw...",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w200),
            ),
            ElevatedButton(
                onHover: null,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(254, 191, 64, 1))),
                child: Text(
                  "Play Again",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    playingState = "playing";
                    resetBoard();
                  });
                })
          ],
        );
      }

      return Container();
    }

    return Column(
      children: [
        Container(
          height: 370,
          width: 500,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoardBox(_board[0], changeBox, playingState),
                    BoardBox(_board[1], changeBox, playingState),
                    BoardBox(_board[2], changeBox, playingState)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoardBox(_board[3], changeBox, playingState),
                    BoardBox(_board[4], changeBox, playingState),
                    BoardBox(_board[5], changeBox, playingState)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoardBox(_board[6], changeBox, playingState),
                    BoardBox(_board[7], changeBox, playingState),
                    BoardBox(_board[8], changeBox, playingState)
                  ],
                ),
              ]),
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          // height: 200,
          // width: 350,
          child: ControlAnddStatus(),
        )
      ],
    );
  }
}
