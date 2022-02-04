import 'package:flutter/material.dart';
import 'package:flutter_ui_example_components/widgets/sample_feature/sample_item_details_view.dart';
import 'package:flutter_ui_example_components/widgets/sample_feature/sample_item_list_view.dart';
import 'package:flutter_ui_example_components/theme/light.dart';
import 'package:flutter_ui_example_components/theme/dark.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.WidgetbookTheme.light()
ThemeData lightTheme() => SampleLightTheme().theme;

@widgetbook.WidgetbookTheme.dark()
ThemeData darkTheme() => SampleDarkTheme().theme;

@widgetbook.WidgetbookUseCase(
    name: 'sample List View', type: SampleItemListView)
Widget sampleListViewStory(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: SampleItemListView(),
  );
}

@widgetbook.WidgetbookApp(
    defaultTheme: widgetbook.WidgetbookTheme.light(),
    name: 'Style Guide',
    devices: [Apple.iPhone12, Apple.iPadPro12inch, Samsung.s10])
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @widgetbook.WidgetbookUseCase(name: 'Sample', type: SampleItemDetailsView)
  Widget sampleDetailsStory(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const SampleItemDetailsView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
    );
  }
}
