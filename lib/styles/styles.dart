import 'package:flutter/material.dart';

class Styles {
  static const Color mainColor = Color(0xFFF5DF4D);
  static const Color firstGradientColor = Color(0xFF404040);
  static const Color secondGradientColor = Colors.black;
  static const Color colorForTextField = Color(0xFFF4F4F4);

  static const TextStyle fontForCard =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: mainColor);
  static const TextStyle ordinaryFont =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400);
  static const TextStyle titleForCard =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black);
  static const TextStyle title =
      TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black);
  static const TextStyle fontForSwitcher =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 12);
  static const TextStyle subTitle =
      TextStyle(fontSize: 20, color: Color(0xFFABB4BD));
  static const TextStyle fontForTextField = TextStyle(
      fontSize: 14, color: Color(0xFFABB4BD), fontWeight: FontWeight.w400);
  static const TextStyle fontForHint = TextStyle(
      fontSize: 12, color: Color(0xFFABB4BD), fontWeight: FontWeight.w400);
}
