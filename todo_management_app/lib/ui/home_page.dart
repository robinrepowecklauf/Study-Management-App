import 'package:flutter/material.dart';
import 'package:todo_management_app/components/todo_card.dart';
import 'package:todo_management_app/resources/values/app_colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            actions: <Widget>[
              IconButton(
                tooltip: 'Add ToDo',
                icon: const Icon(Icons.add),
                iconSize: 35,
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Options',
                icon: const Icon(Icons.more_vert),
                iconSize: 35,
                onPressed: () {},
              )
            ],
          ),
        ),
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
                toColor: Palette.SECONDARY_COLOR_PURPLE),
            ToDoCard(
                fromColor: Palette.PRIMARY_COLOR_RED,
                toColor: Palette.SECONDARY_COLOR_RED),
            ToDoCard(
                fromColor: Palette.PRIMARY_COLOR_LIGHT_PINK,
                toColor: Palette.SECONDARY_COLOR_LIGHT_PINK),
            ToDoCard(
                fromColor: Palette.PRIMARY_COLOR_BLUE,
                toColor: Palette.SECONDARY_COLOR_BLUE),
            ToDoCard(
                fromColor: Palette.PRIMARY_COLOR_DARK_PINK,
                toColor: Palette.SECONDARY_COLOR_DARK_PINK)
          ],
        ));
  }
}
