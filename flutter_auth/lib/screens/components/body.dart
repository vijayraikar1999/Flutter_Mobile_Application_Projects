import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WELCOME TO EDU',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SvgPicture.asset(
            'assets/icons/chat.svg',
            height: size.height * 0.45,
          ),
          TextButton(
            onPressed: () {},
            child: Text('LOGIN'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 40.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
