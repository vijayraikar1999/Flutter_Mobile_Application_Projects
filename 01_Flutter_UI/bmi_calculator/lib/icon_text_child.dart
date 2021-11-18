import 'package:bmi_calculator/data.dart';
import 'package:flutter/material.dart';

class IconTextChild extends StatelessWidget {
  final IconData icon;
  final String gender;

  IconTextChild({required this.icon, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return Icon(
            icon,
            size: constraints.maxWidth * 0.5,
          );
        }),
        SizedBox(height: 15.0),
        Text(
          gender,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
