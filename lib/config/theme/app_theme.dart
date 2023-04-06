import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pinkAccent,
  Colors.teal,
  Colors.cyan,
  Colors.lime,
  Colors.indigo,
  Colors.brown,
  Colors.grey,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }):assert(selectedColor >= 0 , 'selectedColor must be greater or equal than 0'),
  assert(selectedColor < colorList.length, 'selectedColor must be less than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false,

    )
  );

}
