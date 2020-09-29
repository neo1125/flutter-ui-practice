import 'package:flutter/material.dart';

class CarouselTitle extends StatelessWidget {
  final String title;
  final Function onPress;

  const CarouselTitle({
    Key key,
    this.title,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "See All",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
