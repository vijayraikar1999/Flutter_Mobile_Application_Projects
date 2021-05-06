import 'package:chat_messaging_app/components/primary_button.dart';
import 'package:chat_messaging_app/constants.dart';
import 'package:chat_messaging_app/screens/chats/chat_screen.dart';
import 'package:flutter/material.dart';

class SigninOrSignupScreen extends StatelessWidget {
  const SigninOrSignupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Spacer(
                flex: 2,
              ),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? 'assets/images/Logo_light.png'
                    : 'assets/images/Logo_dark.png',
                height: 146,
              ),
              Spacer(
                flex: 1,
              ),
              PrimaryButton(
                text: 'Sign In',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChatScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: kDefaultPadding * 1.5,
              ),
              PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: 'Sign Up',
                press: () {},
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
