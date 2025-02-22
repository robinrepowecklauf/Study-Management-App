import 'package:flutter/material.dart';

TextStyle appBarTitleText(Color color) {
  if (color == null) color = Colors.white;
  return TextStyle(color: color, fontSize: 35, fontWeight: FontWeight.bold);
}

TextStyle appBarSubTitleText =
    TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold);

TextStyle placeholderDarkModeTextStyle =
    TextStyle(color: Color.fromRGBO(163, 163, 170, 100));

TextStyle aboutTextStyle =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

TextStyle subjectCardTitleText =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
