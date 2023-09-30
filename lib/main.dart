// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './gameBoard.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 252, 84, 84),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(90),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: Text(
                      "Tic Tac Toe",
                    ),
                    titleTextStyle: TextStyle(
                      fontSize: 65,
                      fontFamily: "TiltPrism",
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    centerTitle: true,
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                child: Column(
                  children: [
                    GameBoard(),
                  ],
                ),
              ),
            )));
  }
}
