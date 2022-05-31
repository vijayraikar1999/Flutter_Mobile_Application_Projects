import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';
import 'land.dart';
import 'rounded_text_field.dart';
import 'tabs.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isFullSun = false;
  bool _isDayMode = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isFullSun = true;
      });
    });
  }

  void changeMode(int activeTab) {
    if (activeTab == 0) {
      // Then it's day
      setState(() {
        _isDayMode = true;
      });
      // At first it sets isDayMode to true and then after 300 milliseconds it sets isFullSun to true.
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _isFullSun = true;
        });
      });
    } else {
      setState(() {
        _isFullSun = false;
      });
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _isDayMode = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Color> lightBgColors = [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      // Add more light on background
      if (_isFullSun) Color(0xFFFF9D80),
    ];

    // Bg colors for night mode

    List<Color> darkBGColors = [
      Color(0xFF8c2480),
      Color(0xFF283584),
      Color(0xFF376AB2),
    ];

    Duration _duration = Duration(seconds: 1);

    return AnimatedContainer(
      duration: _duration,
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _isDayMode ? lightBgColors : darkBGColors,
        ),
      ),
      child: Stack(
        children: [
          //Sun
          AnimatedPositioned(
            curve: Curves.easeInOut,
            duration: _duration,
            left: getProportionateScreenWidth(30),
            bottom: getProportionateScreenWidth(_isFullSun ? -45 : -120),
            child: SvgPicture.asset("assets/icons/Sun.svg"),
            // The Sun is an SVG which uses gradient colors, that's why dark colors comes when you click on textField.
          ),
          // Land
          Land(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacing(of: 50),
                  Tabs(
                    press: (value) {
                      changeMode(value);
                    },
                  ),
                  VerticalSpacing(),
                  Text(
                    "Good Morning",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  VerticalSpacing(of: 10),
                  Text(
                    "Enter your Informations below",
                    style: TextStyle(color: Colors.white),
                  ),
                  VerticalSpacing(of: 50),
                  RoundedTextField(
                    initialValue: "ourdemo@email.com",
                    hintText: "Email",
                  ),
                  VerticalSpacing(),
                  RoundedTextField(
                    initialValue: "XXXXXXX",
                    hintText: "Password",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Tab, AnimatedContainer, AnimatedPositioned
