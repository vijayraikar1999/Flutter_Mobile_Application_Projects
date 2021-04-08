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
      home: ContainerWidgetExample(),
    );
  }
}
