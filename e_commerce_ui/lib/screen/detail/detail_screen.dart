import 'package:flutter/material.dart';
import 'package:e_commerce_ui/model/Product.dart';
import 'package:e_commerce_ui/screen/component/main_app_bar.dart';

import 'component/body.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(
        backgroundColor: product.color,
        iconColor: Colors.white,
      ),
      body: Body(
        product: product,
      ),
    );
  }
}
