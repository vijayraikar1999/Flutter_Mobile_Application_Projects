import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frivia',
      theme: ThemeData(
        fontFamily: 'ArchitectsDaughter',
        scaffoldBackgroundColor: const Color.fromRGBO(31, 31, 31, 1.9),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Frivia'),
        ),
      ),
    );
  }
}
