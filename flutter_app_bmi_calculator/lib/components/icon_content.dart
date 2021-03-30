import 'package:flutter/cupertino.dart';
import 'package:flutter_app_bmi_calculator/components/constants.dart';

class IconContent extends StatelessWidget {
  final String label;
  final IconData icon;

  IconContent({this.label, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
