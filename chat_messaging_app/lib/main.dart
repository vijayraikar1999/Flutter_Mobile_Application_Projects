import 'package:chat_messaging_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:chat_messaging_app/screens/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      home: WelcomeScreen(),
    );
  }
}
