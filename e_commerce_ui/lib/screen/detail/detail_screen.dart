import 'package:e_commerce_ui/screen/detail/component/body.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_ui/model/Product.dart';
import 'package:e_commerce_ui/screen/component/main_app_bar.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: MainAppBar(
        iconColor: Colors.white,
      ),
      body: Body(
        product: product,
      ),
    );
  }
}
