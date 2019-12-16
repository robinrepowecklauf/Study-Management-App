import 'package:flutter/material.dart';

class Palette {
  List<Color> colors;

  static const Color LIGHT_BLUE_COLOR = Color(0xFF009DFF);
  static const Color BLUE_COLOR = Color(0xFF036DC3);
  static const Color DARK_TURQOUISE_COLOR = Color(0xFF60a3bc);
  static const Color RED_COLOR = Color(0xFFe94f64);
  static const Color PURPLE_COLOR = Color(0xFFa29bfe);
  static const Color GREEN_COLOR = Color(0xFF6aae6a);
  static const Color ORANGE_COLOR = Color(0xFFe57254);
  static const Color PINK_COLOR = Color(0xFFd56f90);
  static const Color GRAY_COLOR = Color(0xFF636e72);

  static const Color DARK_MODE_DARK_GRAY_COLOR =
      Color.fromRGBO(36, 36, 37, 100);

  static const Color DARK_MODE_LIGHT_GRAY_COLOR =
      Color.fromRGBO(55, 55, 59, 100);

  Palette() {
    colors = [
      BLUE_COLOR,
      RED_COLOR,
      GREEN_COLOR,
      PURPLE_COLOR,
      ORANGE_COLOR,
      DARK_TURQOUISE_COLOR,
      PINK_COLOR,
      GRAY_COLOR
    ];
  }
}
