import 'package:flutter/material.dart';
import 'resources/values/app_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scaffold = new Scaffold(
      appBar: AppBar(
        title: Text('yoyoyo'),
        backgroundColor: Palette.PRIMARY_COLOR_BLUE,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: buildLinearGradient(),
        ),
      ),
    );
    return MaterialApp(title: 'hello world', home: scaffold);
  }

  LinearGradient buildLinearGradient() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Palette.PRIMARY_COLOR_DARK_PINK,
          Palette.SECONDARY_COLOR_DARK_PINK,
        ]);
  }
}
