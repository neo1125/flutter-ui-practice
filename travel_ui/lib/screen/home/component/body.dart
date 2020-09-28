import 'package:flutter/material.dart';

import 'exclusive_hotels.dart';
import 'top_destinations.dart';
import 'top_icon_button.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "What you would like\n to find?",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopIconButton(
                iconData: Icons.flight,
              ),
              TopIconButton(
                iconData: Icons.home,
              ),
              TopIconButton(
                iconData: Icons.beach_access,
              ),
              TopIconButton(
                iconData: Icons.motorcycle,
              ),
            ],
          ),
        ),
        TopDestinations(),
        ExclusiveHotels(),
      ],
    );
  }
}
