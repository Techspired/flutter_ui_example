
# Flutter_ui_example

  **An example of an application folder structure for flutter that uses a shared components library between two projects**

The purpose of this sample is to:
1. IIllustrate the use Widget Book to share designs in a way that designers and product people can view on the web without access to testflight, appcenter, or the ability to build the app locally.
2. Show how separating components into a separate project works for Flutter apps. 

  

The widgetbook is mostly generated, and resides in its own app in order to keep the main app clean.

Separating out the widgets into a library also forces developers out of the habit of hard coding strings, urls, and other model-specific properties that tend to drift into UI code.

  ## Project Structure
  What we end up with is a simple 3 folder project, each containing a flutter app or library.
  ```mermaid
graph LR
A[Widget Library ] -- Referenced by --> B[Style Guide App]
A -- Referenced by --> C[Mobile App]

```

## Getting Started

  

We start by creating 3 folders. In this case **flutter_ui_example_app** (for the main app)
with the command

>  flutter create -t skeleton flutter_ui_example_app

This creates the listview sample.

We want to move our widgets to another project which will comprise the widget library. The widgets will live in **flutter_ui_example_components**

Create a blank project (or counter app and delete main and app.dart)

Move the sample_item_* files to this project and add the statement
		
		library flutter_ui_example_components;
		
to the top of files for widgets that you want to share in the widgets package.

Create a style guide project folder (Create a counter app and remove all logic from the app.dart Material App) and add a reference to your flutter_ui_example_components to the pubspec.

This is the project to which we will add Widgetbook.

Widget book was created in October 2021 and is actively developed. Currently, there are 4 parts: Widgetbook, Widgetbook_annotations, Widgetbook_generator, and Widgetbook models.
  

We will be using the first three.


First, to avoid linting the files in the styleguide project we will generate, add ****.widgetbook.dart to the excluded file types in your analaysis_options.yaml**


	analyzer:
		exclude:
		- lib/**\**.g.dart**
		- lib/**\**.widgetbook.dart**


change the logic of app.dart to this 

	import  'package:flutter/material.dart';
	import  'package:flutter_ui_example_components/widgets/sample_feature/sample_item_details_view.dart';
	import  'package:flutter_ui_example_components/widgets/sample_feature/sample_item_list_view.dart';
	import  'package:flutter_ui_example_components/theme/light.dart';
	import  'package:flutter_ui_example_components/theme/dark.dart';
	import  'package:widgetbook/widgetbook.dart';
	import  'package:widgetbook_annotation/widgetbook_annotation.dart'  as widgetbook;

	@widgetbook.WidgetbookTheme.light()
	
	ThemeData  lightTheme() =>  SampleLightTheme().theme;
	@widgetbook.WidgetbookTheme.dark()
	ThemeData  darkTheme() =>  SampleDarkTheme().theme;

	@widgetbook.WidgetbookUseCase(
	name:  'sample List View', type:  SampleItemListView)
	Widget  sampleListViewStory(BuildContext  context) {
		return  const  Padding(
			padding:  EdgeInsets.all(16),
			child:  SampleItemListView(),
		);
	}
	
	@widgetbook.WidgetbookApp(defaultTheme: widgetbook.WidgetbookTheme.light(),
	devices: [Apple.iPhone12, Apple.iPadPro12inch, Samsung.s10])

	class  App  extends  StatelessWidget {
		const  App({Key?  key}) :  super(key:  key);
		
		@widgetbook.WidgetbookUseCase(name:  'Sample', type:  SampleItemDetailsView)
		Widget  sampleDetailsStory(BuildContext  context) {
			return  Container(
				child:  const  SampleItemDetailsView(),
			);
		}

		@override
		Widget  build(BuildContext  context) {
			return  MaterialApp(
				theme:  lightTheme(),
			);
		}
	}

Add the necessary files to generate the Widgetbook to the pubspec

		dependencies:
			widgetbook:  1.0.3
			widgetbook_annotation:  1.0.1 
		dev_dependencies:
			widgetbook_generator:  1.0.3
			build_runner #to run the generator

You will notice the theme, app, and usecase annotations in the updated app logic. 
Now you can generate the app.widgetbook.dart by running the command:

		flutter pub run build_runner


## Asset Files in the Library

Asset files in a widget library don't automatically carry over their image and icon files. 

If you are using an image asset, such as 

	   AssetImage('lib/images/flutter_logo.png')

in the generated SampleListView file, just add the package name

		AssetImage('lib/images/flutter_logo.png', 
			package: 'flutter_ui_example_components'),

So that when you reference it in your app projects, the image shows.

