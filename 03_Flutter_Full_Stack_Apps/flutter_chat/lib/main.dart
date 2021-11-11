import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/chat_screen.dart';
import 'package:flutter_chat/screens/login_screen.dart';
import 'package:flutter_chat/screens/registration_screen.dart';
import 'package:flutter_chat/utilities/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: kPurpleColor,
              body: Center(
                child: CircularProgressIndicator(
                  color: kDarkGrey,
                ),
              ),
            );
          } else {
            if (snapshot.hasData && snapshot.data!.emailVerified) {
              // Go to chat screen
              return ChatScreen(user: snapshot.data!);
            }

            if (snapshot.hasError) {
              // display error message
              return const Scaffold(
                backgroundColor: kPurpleColor,
                body: Center(
                  child: Text(
                    'An error occurred',
                    style: TextStyle(
                      color: kDarkGrey,
                    ),
                  ),
                ),
              );
            }

            return LoginScreen();
          }
        },
      ),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
