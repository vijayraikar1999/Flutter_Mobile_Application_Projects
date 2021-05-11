import 'package:flutter/material.dart';
import 'package:online_shop_app/models/Product.dart';
import '../../../constants.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Color'),
                Row(
                  children: [
                    ColorDot(
                      color: Color(0xFF356C95),
                      isSelected: true,
                    ),
                    ColorDot(color: Color(0xFFF8C078)),
                    ColorDot(color: Color(0xFFA29B9B)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: kTextColor),
                children: [
                  TextSpan(text: 'Size\n'),
                  TextSpan(
                    text: '${product.size} cm',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: kDefaultPadding / 4, right: kDefaultPadding / 2),
      padding: EdgeInsets.all(2.5),
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
