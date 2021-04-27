import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF252C4A),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Skip'),
          )
        ],
      ),
      body: Stack(
        children: [
          WebsafeSvg.asset('assets/icons/bg1.svg', fit: BoxFit.fill),
        ],
      ),
    );
  }
}
