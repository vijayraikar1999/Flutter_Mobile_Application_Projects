import 'package:flutter/material.dart';
import 'package:online_shop_app/models/Product.dart';
import '../../constants.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              // height: 180.0,
              // width: 160.0,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Hero(
                tag: '${product.id}',
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              product.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            '\$${product.price}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
