import 'package:flutter/material.dart';
import 'resources/values/app_colors.dart';
import 'components/todo_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: <Widget>[
        ToDoCard(
            fromColor: Palette.PRIMARY_COLOR_LIGHT_BLUE,
            toColor: Palette.SECONDARY_COLOR_LIGHT_BLUE),
        ToDoCard(
            fromColor: Palette.PRIMARY_COLOR_YELLOW,
            toColor: Palette.SECONDARY_COLOR_YELLOW),
        ToDoCard(
            fromColor: Palette.PRIMARY_COLOR_PURPLE,
            toColor: Palette.SECONDARY_COLOR_PURPLE)
      ],
    )));
  }
}
