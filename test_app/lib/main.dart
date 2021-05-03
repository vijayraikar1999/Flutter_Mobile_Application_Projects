import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/10.animation_example3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
