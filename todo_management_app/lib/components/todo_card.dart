import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final Color fromColor;
  final Color toColor;
  final String header;

  ToDoCard({this.fromColor, this.toColor, this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      //color: Colors.red,
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
                        colors: [this.fromColor, this.toColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 8),
                        blurRadius: 8,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: <Widget>[
                    Align(
                        alignment: Alignment(0, -0.8),
                        child: Text(
                          'Chalmers',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
