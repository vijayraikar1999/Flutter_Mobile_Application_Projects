import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF252C4A),
      body: Stack(
        children: [
          WebsafeSvg.asset(
            'assets/icons/bg1.svg',
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2),
                  Text(
                    "Let's Play Quiz,",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text('Enter your informations below'),
                  Spacer(),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFF1C2341),
                      hintText: 'Full Name',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white54, width: 2.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Let's Start Quiz",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.button.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
