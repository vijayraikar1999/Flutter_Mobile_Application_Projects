import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(Myapp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
