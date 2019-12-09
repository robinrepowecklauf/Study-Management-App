import 'package:flutter/material.dart';
import 'package:todo_management_app/resources/values/styles.dart';

class InTrayCard extends StatelessWidget {
  final Color fromColor;
  final Color toColor;
  final String title;

  InTrayCard({this.fromColor, this.toColor, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: getInTrayCardDecoration(this.fromColor, this.toColor),
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment(0, -0.8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: inTrayCardTitle,
              ))
        ],
      ),
    );
  }

  BoxDecoration getInTrayCardDecoration(fromColor, toColor) => BoxDecoration(
      gradient: LinearGradient(
          colors: [this.fromColor, this.toColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 8),
          blurRadius: 8,
        ),
      ],
      borderRadius: BorderRadius.circular(20));
}
