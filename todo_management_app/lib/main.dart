import 'package:flutter/material.dart';
import 'resources/values/app_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(10, (index) {
                  return Center(
                    child: Container(
                      width: 140,
                      height: 150,
                      //margin: EdgeInsets.only(left: 30, top: 210),
                      color: Palette.PRIMARY_COLOR_LIGHT_PINK,
                      child: Card(
                        semanticContainer: true,
                        color: Palette.PRIMARY_COLOR_BLUE,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text('ArmIT',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  );
                }))));
  }
}
