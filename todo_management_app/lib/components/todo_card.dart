import 'package:flutter/material.dart';
import 'package:todo_management_app/resources/values/app_colors.dart';

class ToDoCard extends StatelessWidget {
  final Color color;
  final String header;

  ToDoCard({this.color, this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      color: Colors.red,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                //color: this.color,
                width: 140,
                height: 160,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [this.color, Palette.SECONDARY_COLOR_BLUE],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
