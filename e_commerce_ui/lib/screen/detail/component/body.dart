import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/model/Product.dart';
import 'package:e_commerce_ui/screen/detail/component/counter_with_fav_btn.dart';
import 'package:e_commerce_ui/screen/detail/component/product_with_image.dart';
import 'package:flutter/material.dart';

import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'description.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: size.height / 2,
                  color: product.color,
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          ColorAndSize(product: product),
                          Description(product: product),
                          CounterWithFavBtn(),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                ProductWithImage(product: product),
              ],
            ),
          ),
        ),
        AddToCart(product: product),
      ],
    );
  }
}
