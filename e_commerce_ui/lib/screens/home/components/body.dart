import 'package:e_commerce_ui/constants.dart';
import 'package:e_commerce_ui/models/Product.dart';
import 'package:e_commerce_ui/screens/detail/detail_screen.dart';
import 'package:e_commerce_ui/screens/home/components/category_tab.dart';
import 'package:e_commerce_ui/screens/home/components/item_card.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        CategoryTab(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: GridView.builder(
              itemCount: dummyProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: dummyProducts[index],
                onPressFunc: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        product: dummyProducts[index],
                      ),
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
