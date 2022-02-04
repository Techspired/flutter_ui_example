import 'package:flutter/material.dart';

extension Adjust on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  Color invert() {
    final r = 255 - this.red;
    final g = 255 - this.green;
    final b = 255 - this.blue;

    return Color.fromARGB((this.opacity * 255).round(), r, g, b);
  }
}
