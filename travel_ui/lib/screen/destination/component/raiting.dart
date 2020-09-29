import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final int rate;
  final double iconSize = 12;

  const Rating({
    Key key,
    this.rate = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: iconSize,
          color: rate >= 1 ? Colors.yellow : Colors.grey.withOpacity(0.5),
        ),
        Icon(
          Icons.star,
          size: iconSize,
          color: rate >= 2 ? Colors.yellow : Colors.grey.withOpacity(0.5),
        ),
        Icon(
          Icons.star,
          size: iconSize,
          color: rate >= 3 ? Colors.yellow : Colors.grey.withOpacity(0.5),
        ),
        Icon(
          Icons.star,
          size: iconSize,
          color: rate >= 4 ? Colors.yellow : Colors.grey.withOpacity(0.5),
        ),
        Icon(
          Icons.star,
          size: iconSize,
          color: rate >= 5 ? Colors.yellow : Colors.grey.withOpacity(0.5),
        ),
      ],
    );
  }
}
