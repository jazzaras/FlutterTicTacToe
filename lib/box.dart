// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BoardBox extends StatelessWidget {
  String sym;
  Function played;
  static int idCounter = 0;
  int _id = idCounter;
  String playingState;

  BoardBox(this.sym, this.played, this.playingState) {
    idCounter = idCounter + 1;
    if (idCounter > 8) idCounter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: (this.playingState == "playing" && this.sym == "")
            ? () => played(_id)
            : null,
        child: Container(
          alignment: Alignment.center,
          height: 105,
          width: 105,
          color: Color.fromRGBO(254, 191, 64, 1),
          child: Text(
            sym,
            style: TextStyle(
              fontSize: 90,
              fontFamily: "CabinSketch",
            ),
          ),
        ),
      ),
    );
  }
}
