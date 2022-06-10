import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/screens/home_screen.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Travel UI',
      theme: ThemeData(
        primaryColor: const Color(0xff3ebace),
        accentColor: const Color(0xffd8ecf1),
        scaffoldBackgroundColor: const Color(0xfff3f5f7),
      ),
      home: const HomeScreen(),
    );
  }
}
