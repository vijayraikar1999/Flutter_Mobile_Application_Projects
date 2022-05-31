import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  RatingStars({@required this.rating});

  @override
  Widget build(BuildContext context) {
    String stars = '⭐ ' * rating;
    stars += '☆ ' * (5 - rating);
    stars.trim();
    return Text(
      stars,
      style: TextStyle(
        fontSize: 18.0,
      ),
    );
  }
}
