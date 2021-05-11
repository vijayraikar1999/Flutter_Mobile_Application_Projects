import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'cart_counter.dart';

class ContainerWithFavBtn extends StatelessWidget {
  const ContainerWithFavBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(),
        Container(
          padding: EdgeInsets.all(8.0),
          height: 32.0,
          width: 32.0,
          decoration: BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset('assets/icons/heart.svg'),
        ),
      ],
    );
  }
}
