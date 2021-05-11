import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/Product.dart';
import 'package:online_shop_app/screens/details/components/product_title_with_image.dart';
import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'container_with_fav_btn.dart';
import 'description.dart';

class Body extends StatelessWidget {
  const Body({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  height: 500.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPadding / 2),
                      Description(product: product),
                      SizedBox(height: kDefaultPadding / 2),
                      ContainerWithFavBtn(),
                      SizedBox(height: kDefaultPadding / 2),
                      AddToCart(product: product),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
