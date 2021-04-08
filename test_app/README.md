# test_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.
In this project I work on learning Flutter in more detail.
Inside the lib directory I add the demo about all the features available in Flutter.
If you want to check them then just change the home property to the widget from the the dart file you wanna check.

for example:

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/1_scaffold_widget.dart';
import 'package:test_app/2_container_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // This is the home property I was talking about. so if I wanna see the example about Container then simply assign the widget ContainerWidgetExample from         // the container_widget_exmaple.dart file. and you can check out all the other dart files present in the lib folder and change the home to the widget from         // the file as you want.
      
      home: ContainerWidgetExample(),
    );
  }
}


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
