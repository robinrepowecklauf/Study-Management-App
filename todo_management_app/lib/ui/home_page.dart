import 'package:flutter/material.dart';
import 'package:todo_management_app/components/intray_card.dart';
import 'package:todo_management_app/resources/values/app_colors.dart';
import 'create_intray_page.dart';
import '../components/page_up_animation.dart';
import 'package:todo_management_app/components/base_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          titleText: 'Hello, Robin',
          subTitleText: "Let's get more organized",
          icons: <Widget>[
            IconButton(
                icon: const Icon(Icons.add),
                iconSize: 35,
                color: Palette.PRIMARY_COLOR_OPTION_BLUE,
                onPressed: () {
                  Navigator.push(context, SlideUpRoute(page: InTray()));
                }),
            IconButton(
              icon: const Icon(Icons.more_vert),
              iconSize: 35,
              color: Palette.PRIMARY_COLOR_OPTION_BLUE,
              onPressed: () {},
            )
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            InTrayCard(
                fromColor: Palette.PRIMARY_COLOR_LIGHT_BLUE,
                toColor: Palette.SECONDARY_COLOR_LIGHT_BLUE),
            InTrayCard(
                fromColor: Palette.PRIMARY_COLOR_YELLOW,
                toColor: Palette.SECONDARY_COLOR_YELLOW),
            InTrayCard(
                fromColor: Palette.PRIMARY_COLOR_PURPLE,
                toColor: Palette.SECONDARY_COLOR_PURPLE),
            InTrayCard(
                fromColor: Palette.PRIMARY_COLOR_RED,
                toColor: Palette.SECONDARY_COLOR_RED),
            InTrayCard(
                fromColor: Palette.PRIMARY_COLOR_LIGHT_PINK,
                toColor: Palette.SECONDARY_COLOR_LIGHT_PINK),
            InTrayCard(
                fromColor: Palette.PRIMARY_COLOR_BLUE,
                toColor: Palette.SECONDARY_COLOR_BLUE),
            InTrayCard(
                fromColor: Palette.PRIMARY_COLOR_DARK_PINK,
                toColor: Palette.SECONDARY_COLOR_DARK_PINK)
          ],
        ));
  }
}
