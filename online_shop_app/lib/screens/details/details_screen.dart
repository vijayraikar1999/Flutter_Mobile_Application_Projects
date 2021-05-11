import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/Product.dart';
import 'package:online_shop_app/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset('assets/icons/cart.svg'),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
