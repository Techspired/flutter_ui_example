library flutter_ui_example_components;

import 'package:flutter/material.dart';

import 'package:flutter_ui_example_components/theme/color_util.dart';

class SampleDarkTheme {
  get primarySwatch {
    return MaterialColor(4280364672, {
      50: Colors.cyan.lighten(.4),
      100: Colors.cyan.lighten(.3),
      200: Colors.cyan.lighten(.2),
      300: Colors.cyan.lighten(.1),
      400: Colors.cyan,
      500: Colors.cyan.darken(.1),
      600: Colors.cyan.darken(.2),
      700: Colors.cyan.darken(.3),
      800: Colors.cyan.darken(.4),
      900: Colors.cyan.darken(
        .5,
      )
    });
  }

  ThemeData get theme => ThemeData.from(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch));
}
