library flutter_ui_example_components;

import 'package:flutter/material.dart';

import 'package:flutter_ui_example_components/theme/color_util.dart';

class SampleLightTheme {
  get primarySwatch {
    return MaterialColor(4280364672, {
      50: Colors.pink.lighten(.4),
      100: Colors.pink.lighten(.3),
      200: Colors.pink.lighten(.2),
      300: Colors.pink.lighten(.1),
      400: Colors.pink,
      500: Colors.pink.darken(.1),
      600: Colors.pink.darken(.2),
      700: Colors.pink.darken(.3),
      800: Colors.pink.darken(.4),
      900: Colors.pink.darken(
        .5,
      )
    });
  }

  ThemeData get theme => ThemeData.from(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch));
}
