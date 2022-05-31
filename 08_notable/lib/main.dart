import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notable/models/note.dart';
import 'package:notable/screens/add_note_screen.dart';
import 'package:notable/screens/home_screen.dart';
import 'package:notable/utilities/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Future<void> example() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('key', 'value');
  //   String? value = prefs.getString('key');
  //   print(value);
  //   prefs.remove('key');
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: kDarkGrey,
          centerTitle: false,
          elevation: 0,
        ),
      ),
      routes: {
        AddNoteScreen.id: (context) => AddNoteScreen(),
      },
      home: FutureBuilder(
          future: Hive.openBox('notes'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Scaffold(
                  body: Center(
                    child: Text('An error occurred'),
                  ),
                );
              } else {
                return const HomeScreen();
              }
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: kYellowColor,
                  ),
                ),
              );
            }
          }),
    );
  }
}
