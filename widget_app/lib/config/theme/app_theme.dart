import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.deepOrange,
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected Color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selected Color must be less then colorlist');

  ThemeData getTheme() => ThemeData(colorSchemeSeed: colorList[selectedColor]);
}
