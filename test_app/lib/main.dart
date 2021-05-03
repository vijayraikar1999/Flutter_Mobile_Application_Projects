import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/9_animation_example2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationExample2(),
    );
  }
}
