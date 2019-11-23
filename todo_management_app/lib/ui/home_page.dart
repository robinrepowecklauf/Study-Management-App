import 'package:flutter/material.dart';
import 'package:todo_management_app/components/todo_card.dart';
import 'package:todo_management_app/resources/values/app_colors.dart';
import 'package:todo_management_app/resources/values/text_styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: AppBar(
            elevation: 0,
            // makes time and wifi on iphone become black
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                tooltip: 'Add ToDo',
                icon: const Icon(Icons.add),
                iconSize: 35,
                color: Palette.PRIMARY_COLOR_OPTION_BLUE,
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Options',
                icon: const Icon(Icons.more_vert),
                iconSize: 35,
                color: Palette.PRIMARY_COLOR_OPTION_BLUE,
                onPressed: () {},
              )
            ],
            bottom: getAppBarTexts(),
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

PreferredSize getAppBarTexts() {
  return PreferredSize(
    preferredSize: Size.fromHeight(30),
    child: Container(
      height: 80,
      width: 320,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hello, Robin!',
            style: title,
          ),
          Text(
            "Let's get more organized.",
            style: subTitle,
          )
        ],
      ),
    ),
  );
}
