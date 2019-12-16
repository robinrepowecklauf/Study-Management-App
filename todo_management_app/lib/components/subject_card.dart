import 'package:flutter/material.dart';
import 'package:todo_management_app/resources/values/styles.dart';

class SubjectCard extends StatelessWidget {
  final Color gradientFromColor;
  final Color gradientToColor;
  final String titleText;

  SubjectCard({this.gradientFromColor, this.gradientToColor, this.titleText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: _getSubjectCardDecoration(
          this.gradientFromColor, this.gradientToColor),
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment(0, -0.8),
              child: Text(
                titleText,
                textAlign: TextAlign.center,
                style: subjectCardTitleText,
              ))
        ],
      ),
    );
  }

  BoxDecoration _getSubjectCardDecoration(fromColor, toColor) => BoxDecoration(
      gradient: LinearGradient(
          colors: [this.gradientFromColor, this.gradientToColor],
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
