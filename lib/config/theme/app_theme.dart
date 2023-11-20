import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFE36407);

const List<Color> _colorThemes = [
  _customColor,
  Colors.lightBlue,
  Colors.redAccent,
  Colors.yellowAccent,
  Colors.lightGreen
];

class AppTheme {

  final int selectedColor;

  AppTheme({this.selectedColor = 0}): assert((selectedColor >= 0 && selectedColor < _colorThemes.length), "Debe ser entre 0 y ${_colorThemes.length}");

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}