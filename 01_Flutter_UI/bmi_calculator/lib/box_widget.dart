import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  final Color color;
  final Widget? cardChild;

  BoxWidget({required this.color, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}
