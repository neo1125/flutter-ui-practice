import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/model/Product.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final Product product;

  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        product.description,
        style: TextStyle(
          height: 1.5,
        ),
      ),
    );
  }
}
