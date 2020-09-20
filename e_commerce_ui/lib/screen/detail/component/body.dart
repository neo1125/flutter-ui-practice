import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/model/Product.dart';
import 'package:flutter/material.dart';

import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      SizedBox(
        height: size.height - 250,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: size.height * 0.3,
                      ),
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
                          ColorAndSize(product: product),
                          Description(product: product),
                        ],
                      ),
                    ),
                    ProductWithImage(product: product),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      Container(
        color: Colors.white,
        child: Column(
          children: [
            CounterWithFavBtn(),
            Row(
              children: [
                Container(
                  width: 58,
                  height: 50,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
