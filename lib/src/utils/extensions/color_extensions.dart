import 'package:flutter/material.dart' show Color;

extension ColorExtension on Color {
  /// Converts the color to a darken color based on the [percent]
  ///
  /// the default value is 40.
  Color darken({int percent = 40}) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(alpha, (red * value).round(), (green * value).round(),
        (blue * value).round());
  }
}
