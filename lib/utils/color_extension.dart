import 'package:flutter/material.dart';

/// Darken a color by [percent] amount (100 = black)
// ........................................................
Color _darken(Color c, [int percent = 0]) {
  if (percent <= 0) return c;
  var f = 1 - percent / 100;
  return Color.fromARGB(
      c.a.toInt(), (c.r * f).round(), (c.g * f).round(), (c.b * f).round());
}

/// Lighten a color by [percent] amount (100 = white)
// ........................................................
Color _lighten(Color c, [int percent = 0]) {
  if (percent <= 0) return c;
  var p = percent / 100;
  return Color.fromARGB(c.a.toInt(), (c.r + (255 - c.r) * p).round(),
      (c.g + (255 - c.g) * p).round(), (c.b + (255 - c.b) * p).round());
}

extension ColorBrightnessExtension on Color {
  Color darker([int percent = 0, bool swap = false]) =>
      swap ? _lighten(this, percent) : _darken(this, percent);
  Color lighter([int percent = 0, bool swap = false]) =>
      swap ? _darken(this, percent) : _lighten(this, percent);
}
